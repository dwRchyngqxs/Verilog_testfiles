`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_ram_net_read
(
	input clk,
	input reset,
	
	input [NETADDRBITS-1:0] c_id,
	
	// To network for sending data
	output logic [NET_DWIDTH-1:0] o_net_data,
	output logic o_net_valid,
	input i_net_ready,
	output logic o_net_sop,
	output logic o_net_eop,
	
	// Back to top block
	output logic o_loop_valid,
	
	// To current block cache for reading
	output logic o_cur_rclaim [2],
	output logic o_cur_rrelease [2],
	output logic [CURLEFT_AWIDTH-1:0] o_cur_addr,
	input [1:0][CURLEFT_DWIDTH-1:0] i_cur_data,
	output logic o_cur_enable,
	
	// Command interface
	input i_wrreq,
	output logic o_wrreq_done,
	input i_wrreq_whichbufs_top,
	input i_wrreq_whichpage,
	input [MAX_BDIMBITS-1:0] i_wrreq_blkx,
	input [MAX_BDIMBITS-1:0] i_wrreq_blky
);

// Pipeline control
logic pipe_enable1;
logic pipe_enable2;

// Pipeline signals
logic valid_0;
logic eop_0;

// Address counter
logic [TOP_AWIDTH-1:0] addr_0;
bit addr_inc;
bit addr_done;

assign addr_done = (addr_0 == '1);

always_ff @ (posedge clk) begin
	if (i_wrreq) addr_0 <= '0;
	else if (addr_inc) addr_0 <= addr_0 + (TOP_AWIDTH)'(1);
end

// Pipeline constants
logic whichpage;
logic whichbufs_top;
logic [MAX_BDIMBITS-1:0] blkx;
logic [MAX_BDIMBITS-1:0] blky;

always_ff @ (posedge clk) begin
	if (i_wrreq) begin
		whichpage <= i_wrreq_whichpage;
		whichbufs_top <= i_wrreq_whichbufs_top;
		blkx <= i_wrreq_blkx;
		blky <= i_wrreq_blky;
	end
end

// Connect to memory for reading
assign o_cur_addr = addr_0[TOP_AWIDTH-1:1];
assign o_cur_enable = pipe_enable1;

// Mux read data from the correct buffer
logic addr_3;
pipe_delay #(3, 1) addr_0_3 (clk, reset, pipe_enable1, addr_0[0], addr_3);

logic [NET_DWIDTH-1:0] data_4;
logic valid_4;
logic eop_4;
pipe_delay #(4, 1) valid_0_4 (clk, reset, pipe_enable1, valid_0, valid_4);
pipe_delay #(4, 1) eop_0_4 (clk, reset, pipe_enable1, eop_0, eop_4);

always_ff @ (posedge clk) begin
	if (pipe_enable1) begin
		case ({whichpage, addr_3})
			2'b00: data_4 <= i_cur_data[0][255:0];
			2'b01: data_4 <= i_cur_data[0][511:256];
			2'b10: data_4 <= i_cur_data[1][255:0];
			2'b11: data_4 <= i_cur_data[1][511:256];
		endcase
	end
end

// Get read data into an interlock
logic [NET_DWIDTH-1:0] data_4i;
logic eop_4i;
logic valid_4i;
pipe_interlock #
(
	.WIDTH(NET_DWIDTH + 1),
	.REGISTERED(1),
	.MLAB(0)
) data_out_ilk
(
	.i_clk(clk),
	.i_reset(reset),
	
	.i_in({data_4, eop_4}),
	.o_out({data_4i, eop_4i}),
	.i_have(valid_4),
	.o_want(pipe_enable1),
	.o_have(valid_4i),
	.i_want(pipe_enable2)
);

// Outgoing header
t_head_packet out_header;
logic header_valid;

assign out_header.RD_RQST = '0;
assign out_header.WR_DATA = '1;
assign out_header.RD_DATA = '0;
assign out_header.MSG_GO = '0;
assign out_header.MSG_DONE = '0;
assign out_header.DEST_BCAST = '0;
assign out_header.RQST_ID = c_id;
assign out_header.DEST_ID = NETADDR_MEM;
assign out_header.BLKX = blkx;
assign out_header.BLKY = blky;
assign out_header.WHICHBUFS.top = whichbufs_top;

// We claim the memory for reading when header is sent out
assign o_cur_rclaim[0] = header_valid && ~whichpage;
assign o_cur_rclaim[1] = header_valid && whichpage;

// Mux final data output
logic valid_5;
logic sop_5;
logic eop_5;
logic [NET_DWIDTH-1:0] data_5;

enum {HEADER, DATA} sel_5;

pipe_delay #(1, 1) eop_4_5 (clk, reset, pipe_enable2, eop_4i, eop_5);

always_ff @ (posedge clk) begin
	if (pipe_enable2) begin
		data_5 <= (sel_5 == HEADER) ? out_header : data_4i;
		valid_5 <= (sel_5 == HEADER) ? header_valid : valid_4i;
		sop_5 <= (sel_5 == HEADER) ? header_valid : '0;
	end
end

// We release the memory for reading when end of packet is sent
assign o_cur_rrelease[0] = valid_5 && eop_5 && pipe_enable2;
assign o_cur_rrelease[1] = valid_5 && eop_5 && pipe_enable2;


// Connect to network
assign o_net_data = data_5;
assign o_net_valid = valid_5;
assign o_net_sop = sop_5;
assign o_net_eop = eop_5;

assign o_loop_valid = valid_5 && i_net_ready;

assign pipe_enable2 = !(o_net_valid && !i_net_ready);



// State machine
enum int unsigned
{
	S_IDLE,
	S_HEADER,
	S_DATA,
	S_DONE
} state, nextstate;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) state <= S_IDLE;
	else state <= nextstate;
end

always_comb begin
	nextstate = state;
	sel_5 = DATA;
	valid_0 = '0;
	eop_0 = '0;
	
	header_valid = '0;
	addr_inc = '0;
	o_wrreq_done = '0;
	
	case (state)
		S_IDLE: begin
			if (i_wrreq) nextstate = S_HEADER;
		end
		
		S_HEADER: begin
			header_valid = '1;
			sel_5 = HEADER;
			nextstate = S_DATA;
		end
		
		S_DATA: begin
			valid_0 = '1;
			sel_5 = DATA;
			eop_0 = addr_done;
			
			if (pipe_enable1) begin
				addr_inc = '1;
				if (addr_done) nextstate = S_DONE;
			end
		end
		
		S_DONE: begin
			sel_5 = DATA;
			// Wait for pipeline to drain
			if (pipe_enable2 && eop_5) begin
				o_wrreq_done = '1;
				nextstate = S_IDLE;
			end
		end
	endcase
end

endmodule
