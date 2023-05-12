`include "lu_new_pkg.sv"
import lu_new::*;

// Broadcast node
module bcast_stage #
(
	parameter RADIX = 1,
	parameter WIDTH = 1,
	parameter ILK = 1,
	parameter ID_CHECK = 0
)
(
	input clk,
	input reset,
	
	input i_sop,
	input i_eop,
	input [WIDTH-1:0] i_data,
	input i_valid,
	output logic o_ready,
	
	input [NETADDRBITS-1:0] i_id[RADIX],
	output logic o_sop[RADIX],
	output logic o_eop[RADIX],
	output logic [WIDTH-1:0] o_data[RADIX],
	output logic o_valid[RADIX],
	input i_ready[RADIX]
);

genvar gi;

logic [RADIX-1:0] and_these_readies;
assign o_ready = (&and_these_readies);
	
bit [RADIX-1:0] id_match;

// If checking IDs, then populate the id_match vector based on
// snooping the header packets from the data stream. This check
// needs to be made	during the header packet phase only, so a state
// machine must keep track of when we're in the middle of a data transmission.		
generate
if (ID_CHECK) begin : id_check
	enum int unsigned
	{
		S_NORMAL,
		S_DATA
	} state, nextstate;

	bit save_id_match;
	bit use_saved_match;
	bit [RADIX-1:0] cur_id_match;
	bit [RADIX-1:0] saved_id_match;
	
	always_ff @ (posedge clk or posedge reset) begin
		if (reset) begin
			state <= S_NORMAL;
			saved_id_match <= '0;
		end
		else begin
			state <= nextstate;
			if (save_id_match) saved_id_match <= cur_id_match;
		end
	end
	
	always_comb begin
		nextstate = state;
		use_saved_match = '0;
		save_id_match = '0;
		
		case (state)
			S_NORMAL: begin
				if (o_ready && i_valid && i_sop && !i_eop) begin
					nextstate = S_DATA;
					save_id_match = '1;
				end
			end
			
			S_DATA: begin
				use_saved_match = '1;
				if (o_ready && i_valid && !i_sop && i_eop) begin
					nextstate = S_NORMAL;
				end
			end
		endcase
	end
	
	t_head_packet header;
	assign header = t_head_packet'(i_data);
	assign id_match = use_saved_match ? saved_id_match : cur_id_match;
	
	always_comb begin
		for (int i = 0; i < RADIX; i++) begin
			cur_id_match[i] = (header.DEST_ID == i_id[i]) || header.DEST_BCAST;
		end
	end
end
else begin : no_id_check
	// Not checking IDs? Same as IDs always matching.
	assign id_match = '1;
end

for (gi = 0; gi < RADIX; gi++) begin : mkfanout					
	logic valid;
	logic ready;
	
	// Understanding this is key. Stare at it for a while and it will make sense. Derp.
	assign valid = i_valid && id_match[gi] && (o_ready || !and_these_readies[gi]);
	assign and_these_readies[gi] = !id_match[gi] || ready;
				
	if (ILK) begin : do_ilk
		pipe_interlock #
		(
			.WIDTH(WIDTH + 2),
			.REGISTERED(1)
		) ilk
		(
			.i_clk(clk),
			.i_reset(reset),
			
			.i_in({i_data, i_sop, i_eop}),
			.i_have(valid),
			.o_want(ready),
			
			.o_out({o_data[gi], o_sop[gi], o_eop[gi]}),
			.o_have(o_valid[gi]),
			.i_want(i_ready[gi])
		);
	end
	else begin : no_ilk
		assign o_data[gi] = i_data;
		assign o_sop[gi] = i_sop;
		assign o_eop[gi] = i_eop;
		assign o_valid[gi] = valid;
		assign ready = i_ready[gi];
	end
end
endgenerate
				
endmodule


module one_to_many #
(
	parameter WIDTH = 256,
	parameter SINKS = 18,
	parameter DEPTH = 3,
	parameter ID_CHECK = 1
)
(
	input clk,
	input reset,
		
	input [WIDTH-1:0] i_data,
	input i_valid,
	input i_sop,
	input i_eop,
	output logic o_ready,
	
	input [NETADDRBITS-1:0] i_id[SINKS],
	output logic [WIDTH-1:0] o_data[SINKS],
	output logic o_valid[SINKS],
	output logic o_sop[SINKS],
	output logic o_eop[SINKS],
	input i_ready[SINKS]
);

localparam RADIX = radix_for_levels(DEPTH, SINKS);

typedef struct packed
{
	logic [WIDTH-1:0] data;
	logic valid;
	logic ready;
	logic sop;
	logic eop;
} node_t;

genvar gi, gj, gk;
generate
	for (gi = 0; gi < DEPTH; gi++) begin : mklevs
		localparam NODES_PREV_LEVEL = nodes_for_level(RADIX, SINKS, gi+1);
		localparam NODES_THIS_LEVEL = nodes_for_level(RADIX, SINKS, gi);
		localparam NEED_ILK = (gi > 0);
		localparam NEED_ID_CHECK = ID_CHECK && (gi == 0);
		
		node_t in_nodes[NODES_PREV_LEVEL];
		node_t out_nodes[NODES_THIS_LEVEL];
		
		if (gi < DEPTH-1) begin : connect_levels
			for (gj = 0; gj < NODES_PREV_LEVEL; gj++) begin : connect_levels_inner
				assign in_nodes[gj].data = mklevs[gi+1].out_nodes[gj].data;
				assign in_nodes[gj].valid = mklevs[gi+1].out_nodes[gj].valid;
				assign in_nodes[gj].sop = mklevs[gi+1].out_nodes[gj].sop;
				assign in_nodes[gj].eop = mklevs[gi+1].out_nodes[gj].eop;
				assign mklevs[gi+1].out_nodes[gj].ready = in_nodes[gj].ready;
			end
		end
		else begin : connect_input
			assign in_nodes[0].data = i_data;
			assign in_nodes[0].valid = i_valid;
			assign in_nodes[0].sop = i_sop;
			assign in_nodes[0].eop = i_eop;
			assign o_ready = in_nodes[0].ready;
		end

		for (gj = 0; gj < NODES_PREV_LEVEL; gj++) begin : mknodes
			localparam START = gj*RADIX;
			localparam NODES_LEFT = NODES_THIS_LEVEL - START;
			localparam BCAST_NODES = NODES_LEFT < RADIX ? NODES_LEFT : RADIX;
			
			logic [WIDTH-1:0] data [BCAST_NODES];
			logic valid [BCAST_NODES];
			logic ready [BCAST_NODES];
			logic sop [BCAST_NODES];
			logic eop [BCAST_NODES];	
			logic [NETADDRBITS-1:0] id [BCAST_NODES];
			
			for (gk = 0; gk < BCAST_NODES; gk++) begin : as
				assign out_nodes[START + gk].data = data[gk];
				assign out_nodes[START + gk].valid = valid[gk];
				assign out_nodes[START + gk].sop = sop[gk];
				assign out_nodes[START + gk].eop = eop[gk];
				assign ready[gk] = out_nodes[START + gk].ready;
				assign id[gk] = i_id[START + gk];
			end
			
			bcast_stage #
			(
				.RADIX(BCAST_NODES),
				.WIDTH(WIDTH),
				.ILK(NEED_ILK),
				.ID_CHECK(NEED_ID_CHECK)
			) bcast
			(
				.clk(clk),
				.reset(reset),
				
				.i_sop(in_nodes[gj].sop),
				.i_eop(in_nodes[gj].eop),
				.i_data(in_nodes[gj].data),
				.i_valid(in_nodes[gj].valid),
				.o_ready(in_nodes[gj].ready),
				
				.i_id(id),
				.o_sop(sop),
				.o_eop(eop),
				.o_valid(valid),
				.i_ready(ready),
				.o_data(data)
			);
		end
	end
endgenerate

generate
	for (gi = 0; gi < SINKS; gi++) begin : connect_output
		assign o_data[gi] = mklevs[0].out_nodes[gi].data;
		assign o_sop[gi] = mklevs[0].out_nodes[gi].sop;
		assign o_eop[gi] = mklevs[0].out_nodes[gi].eop;
		assign o_valid[gi] = mklevs[0].out_nodes[gi].valid;
		assign mklevs[0].out_nodes[gi].ready = i_ready[gi];
	end
endgenerate

endmodule
