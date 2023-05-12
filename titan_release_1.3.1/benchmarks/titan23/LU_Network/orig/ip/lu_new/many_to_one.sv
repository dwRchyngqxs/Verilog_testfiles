`include "lu_new_pkg.sv"
import lu_new::*;

// Single round-robin arbiter stage
module arb_stage #
(
	parameter RADIX = 1,
	parameter WIDTH = 1,
	parameter ILK = 1
)
(
	input clk,
	input reset,
	
	input i_sop[RADIX],
	input i_eop[RADIX],
	input [WIDTH-1:0] i_data[RADIX],
	input i_valid[RADIX],
	output logic o_ready[RADIX],
	
	output logic o_sop,
	output logic o_eop,
	output logic [WIDTH-1:0] o_data,
	output logic o_valid,
	input i_ready
);

localparam RADBITS = CLogB2(RADIX-1);

// Currently serviced/granted input and next input
logic [RADBITS-1:0] cur_input, next_input;
bit cur_input_load;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) cur_input <= '0;
	else if (cur_input_load) cur_input <= next_input;
end

// This generate block creates RADIX valid/idx pairs, one for each
// of the RADIX inputs. The IDXs are just the numbers 0 to RADIX-1.
// Each generated valid/idx pair is fed by a mux that selects from
// all of the RADIX valid inputs. The one that gets selected is
// based on who holds the current grant.
//
// Example, if RADIX is 4, and input 2 currently holds the grant,
// the outputs of this generate block will be:
//
//     sorted_valid	sorted_idx
// 0       valid[3]           3
// 1       valid[0]           0
// 2       valid[1]           1
// 3       valid[2]           2
//
// Note that the inputs have been sorted by a fair round-robin
// priority, such that the currently granted input (2) gets put at
// the end of the list, and the next adjacent input (3) gets
// first dibs.

logic sorted_valids [RADIX];
logic [RADBITS-1:0] sorted_idxs [RADIX];

genvar gi;
generate
	for (gi = 0; gi < RADIX; gi++) begin : sort
		// Generate a packed vector of all the input valid/IDX pairs
		logic [RADIX-1:0] [ RADBITS+1 - 1 : 0 ]  sort_in ;

		always_comb begin
			for (int i = 0; i < RADIX; i++) begin
				automatic int in_idx = (gi + i + 1) % RADIX;
				sort_in[i] = { i_valid[in_idx], (RADBITS)'(in_idx) };
			end
		end
		
		// Do the sorting
		lpm_mux #
		(
			.lpm_width(1 + RADBITS),
			.lpm_size(RADIX),
			.lpm_widths(RADBITS),
			.lpm_pipeline(0)
		)
		sort_mux
		(
			.data(sort_in),
			.result({sorted_valids[gi], sorted_idxs[gi]}),
			.sel(cur_input)
		);
	end
endgenerate

// Once we have sorted_valids/sorted_idx, this priority encoder
// scans through sorted_valids and finds the first nonzero entry.
// This guy will get the grant next. If no one is making a request,
// next_input remains at current_input.
always_comb begin
	next_input = cur_input;
		
	for (int i = RADIX-1; i >= 0; i--) begin
		if (sorted_valids[i]) next_input = sorted_idxs[i];
	end
end
	
// Given the currently-granted input, make a mux that will
// connect the granted input to the output. This includes
// all the forward-travelling signals (data, valid, sop, eop).

logic [WIDTH-1:0] granted_data;
logic granted_valid;
logic granted_ready;
logic granted_sop;
logic granted_eop;

logic [RADIX-1:0] [ (WIDTH + 3) - 1 : 0 ] out_mux_input;

lpm_mux #
(
	.lpm_width(WIDTH + 3),
	.lpm_size(RADIX),
	.lpm_widths(RADBITS),
	.lpm_pipeline(0)
)
out_mux
(
	.data(out_mux_input),
	.result({granted_data, granted_valid, granted_sop, granted_eop}),
	.sel(cur_input)
);

// This generate block builds the out_mux_input vector for the forward-travelling signals,
// and gates the backward-travelling ready signal based on who holds the grant.
generate
	for (gi = 0; gi < RADIX; gi++) begin : connect_
		assign out_mux_input [ gi ] =	{i_data[gi], i_valid[gi], i_sop[gi], i_eop[gi]};
		assign o_ready[gi] = granted_ready && (cur_input == (RADBITS)'(gi));
	end
endgenerate

// Finally, this connects the granted outputs to the module output.
// This optionally gets a pipe interlock for bonus registers.
generate
	if (ILK) begin : ilk
		pipe_interlock #
		(
			.WIDTH(WIDTH + 2),
			.REGISTERED(1)
		)
		ilk
		(
			.i_clk(clk),
			.i_reset(reset),
			
			.i_in({granted_data, granted_sop, granted_eop}),
			.i_have(granted_valid),
			.o_want(granted_ready),
			.o_out({o_data, o_sop, o_eop}),
			.o_have(o_valid),
			.i_want(i_ready)
		);
	end
	else begin : wires
		assign o_data = granted_data;
		assign o_sop = granted_sop;
		assign o_eop = granted_eop;
		assign o_valid = granted_valid;
		assign granted_ready = i_ready;
	end
endgenerate


// Main arbiter state machine.
// We need to know when we're in the middle
// of servicing a long data packet so we can
// hold arbitration steady, hence two states.
	
enum int unsigned
{
	S_NORMAL,
	S_WAIT_EOP
} state, nextstate;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) state <= S_NORMAL;
	else state <= nextstate;
end

always_comb begin
	nextstate = state;
	cur_input_load = '0;
	
	case (state)
		S_NORMAL: begin
			cur_input_load = '1;
			if (granted_valid && granted_ready && granted_sop && !granted_eop) begin
				cur_input_load = '0;
				nextstate = S_WAIT_EOP;
			end
		end
		
		S_WAIT_EOP: begin
			if (granted_valid && granted_ready && !granted_sop && granted_eop) nextstate = S_NORMAL;
		end
	endcase
end

endmodule



// Main module
module many_to_one #
(
	parameter WIDTH = 256,
	parameter DEPTH = 3,
	parameter SOURCES = 18
)
(
	input clk,
	input reset,
	
	input i_sop[SOURCES],
	input i_eop[SOURCES],
	input [WIDTH-1:0] i_data[SOURCES],
	input i_valid[SOURCES],
	output logic o_ready[SOURCES],
	
	output o_sop,
	output o_eop,
	output [WIDTH-1:0] o_data,
	output o_valid,
	input i_ready
);

typedef struct packed
{
	logic [WIDTH-1:0] data;
	logic valid;
	logic sop;
	logic eop;
	logic ready;
} node_t;

localparam RADIX = radix_for_levels(DEPTH, SOURCES);

genvar gi, gj, gk;
generate
	for (gi = 0; gi < DEPTH; gi++) begin : mklevs
		localparam NODES_PREV_LEVEL = nodes_for_level(RADIX, SOURCES, gi);
		localparam NODES_THIS_LEVEL = nodes_for_level(RADIX, SOURCES, gi+1);
		
		node_t in_nodes[NODES_PREV_LEVEL];
		node_t out_nodes[NODES_THIS_LEVEL];
		
		if (gi > 0) begin : connect_levels
			for (gj = 0; gj < NODES_PREV_LEVEL; gj++) begin : connect_levels_inner
				assign in_nodes[gj].data = mklevs[gi-1].out_nodes[gj].data;
				assign in_nodes[gj].valid = mklevs[gi-1].out_nodes[gj].valid;
				assign in_nodes[gj].sop = mklevs[gi-1].out_nodes[gj].sop;
				assign in_nodes[gj].eop = mklevs[gi-1].out_nodes[gj].eop;
				assign mklevs[gi-1].out_nodes[gj].ready = in_nodes[gj].ready;
			end
		end
		else begin : connect_input
			for (gj = 0; gj < NODES_PREV_LEVEL; gj++) begin : connect_input_inner
				assign in_nodes[gj].data = i_data[gj];
				assign in_nodes[gj].valid = i_valid[gj];
				assign in_nodes[gj].sop = i_sop[gj];
				assign in_nodes[gj].eop = i_eop[gj];
				assign o_ready[gj] = in_nodes[gj].ready;
			end
		end
		
		for (gj = 0; gj < NODES_THIS_LEVEL; gj++) begin : mknodes
			localparam START = gj*RADIX;
			localparam NODES_LEFT = NODES_PREV_LEVEL - START;
			localparam ARB_NODES = NODES_LEFT < RADIX ? NODES_LEFT : RADIX;
			
			logic [WIDTH-1:0] data [ARB_NODES];
			logic valid [ARB_NODES];
			logic ready [ARB_NODES];
			logic sop [ARB_NODES];
			logic eop [ARB_NODES];		
			
			for (gk = 0; gk < ARB_NODES; gk++) begin : as
				assign data[gk] = in_nodes[START + gk].data;
				assign valid[gk] = in_nodes[START + gk].valid;
				assign sop[gk] = in_nodes[START + gk].sop;
				assign eop[gk] = in_nodes[START + gk].eop;
				assign in_nodes[START + gk].ready = ready[gk];
			end
			
			localparam NEED_ILK = (gi < DEPTH-1);
			
			if (ARB_NODES > 1) begin : arb_gen
				arb_stage #
				(
					.RADIX(ARB_NODES),
					.WIDTH(WIDTH),
					.ILK(NEED_ILK)
				) arb
				(
					.clk(clk),
					.reset(reset),
					
					.i_data(data),
					.i_sop(sop),
					.i_eop(eop),
					.i_valid(valid),
					.o_ready(ready),
					
					.o_data(out_nodes[gj].data),
					.o_sop(out_nodes[gj].sop),
					.o_eop(out_nodes[gj].eop),
					.o_valid(out_nodes[gj].valid),
					.i_ready(out_nodes[gj].ready)
				);
			end
			else if (NEED_ILK) begin : ilk_gen
				pipe_interlock #
				(
					.WIDTH(WIDTH + 2),
					.REGISTERED(1)
				)
				ilk
				(
					.i_clk(clk),
					.i_reset(reset),
					
					.i_in({data[0], sop[0], eop[0]}),
					.i_have(valid[0]),
					.o_want(ready[0]),
					.o_out({out_nodes[gj].data, out_nodes[gj].sop, out_nodes[gj].eop}),
					.o_have(out_nodes[gj].valid),
					.i_want(out_nodes[gj].ready)
				);
			end
			else begin : wire_gen
				assign out_nodes[gj].data = data[0];
				assign out_nodes[gj].sop = sop[0];
				assign out_nodes[gj].eop = eop[0];
				assign out_nodes[gj].valid = valid[0];
				assign ready[0] = out_nodes[gj].ready;
			end
		end
	end
endgenerate

// Connect outputs
assign o_sop = mklevs[DEPTH-1].out_nodes[0].sop;
assign o_eop = mklevs[DEPTH-1].out_nodes[0].eop;
assign o_data = mklevs[DEPTH-1].out_nodes[0].data;
assign o_valid = mklevs[DEPTH-1].out_nodes[0].valid;
assign mklevs[DEPTH-1].out_nodes[0].ready = i_ready;

endmodule
