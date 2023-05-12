`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_ram_net_write_curleft
(
	input clk,
	input reset,
	
	input [NET_DWIDTH-1:0] i_net_data,
	input i_net_valid,
	input i_net_sop,
	input i_net_eop,
	
	output logic o_cur_wclaim [2],
	output logic o_cur_wrelease [2],
	output logic [CURLEFT_AWIDTH-1:0] o_cur_addr,
	output logic [CURLEFT_DWIDTH-1:0] o_cur_data,
	output logic [1:0] o_cur_we [2],
	
	output logic o_left_wclaim [2],
	output logic o_left_wrelease [2],
	output logic [CURLEFT_AWIDTH-1:0] o_left_addr,
	output logic [CURLEFT_DWIDTH-1:0] o_left_data,
	output logic [1:0] o_left_we [2]
);

// Decode header flit
t_head_packet in_header;
assign in_header = t_head_packet'(i_net_data);

// Write address counter
logic [TOP_AWIDTH-1:0] addr_cnt;
bit addr_cnt_inc, addr_cnt_reset;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) addr_cnt <= '0;
	else begin
		if (addr_cnt_reset) addr_cnt <= '0;
		else if (addr_cnt_inc) addr_cnt <= addr_cnt + (TOP_AWIDTH)'(1);
	end
end

// Which buffers and page are we writing into?
t_buftrio whichbufs;
logic whichpage;
bit whichbufspage_load;

always_ff @ (posedge clk) begin
	if (whichbufspage_load) begin
		whichbufs <= in_header.WHICHBUFS;
		whichpage <= in_header.WHICHPAGE;
	end
end

// Connect to memories
logic valid;
logic wclaim;
logic wrelease;

assign o_cur_addr = addr_cnt[TOP_AWIDTH-1 -: CURLEFT_AWIDTH];
assign o_cur_data = {2{i_net_data}};
assign o_cur_we[0][0] = valid & ~addr_cnt[0] & whichbufs.cur & ~whichpage;
assign o_cur_we[0][1] = valid & addr_cnt[0] & whichbufs.cur & ~whichpage;
assign o_cur_we[1][0] = valid & ~addr_cnt[0] & whichbufs.cur & whichpage;
assign o_cur_we[1][1] = valid & addr_cnt[0] & whichbufs.cur & whichpage;

assign o_left_addr = o_cur_addr;
assign o_left_data = o_cur_data;
assign o_left_we[0][0] = valid & ~addr_cnt[0] & whichbufs.left & ~whichpage;
assign o_left_we[0][1] = valid & addr_cnt[0] & whichbufs.left & ~whichpage;
assign o_left_we[1][0] = valid & ~addr_cnt[0] & whichbufs.left & whichpage;
assign o_left_we[1][1] = valid & addr_cnt[0] & whichbufs.left & whichpage;

assign o_cur_wrelease[0] = wrelease;
assign o_cur_wrelease[1] = wrelease;
assign o_left_wrelease[0] = wrelease;
assign o_left_wrelease[1] = wrelease;

assign o_cur_wclaim[0] = wclaim && in_header.WHICHBUFS.cur && ~in_header.WHICHPAGE;
assign o_cur_wclaim[1] = wclaim && in_header.WHICHBUFS.cur && in_header.WHICHPAGE;
assign o_left_wclaim[0] = wclaim && in_header.WHICHBUFS.left && ~in_header.WHICHPAGE;
assign o_left_wclaim[1] = wclaim && in_header.WHICHBUFS.left && in_header.WHICHPAGE;


// State machine
enum int unsigned
{
	S_HEADER,
	S_DATA
} state, nextstate;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) state <= S_HEADER;
	else state <= nextstate;
end

always_comb begin
	nextstate = state;
	valid = '0;
	whichbufspage_load = '0;
	addr_cnt_reset = '0;
	addr_cnt_inc = '0;
	wclaim = '0;
	wrelease = '0;
	
	case (state)
		S_HEADER: begin
			addr_cnt_reset = '1;
			if (i_net_valid && i_net_sop && in_header.RD_DATA) begin
				wclaim = '1;
				whichbufspage_load = '1;
				nextstate = S_DATA;
			end
		end
		
		S_DATA: begin
			valid = i_net_valid;
			addr_cnt_inc = i_net_valid;
			if (i_net_valid && !i_net_sop && i_net_eop) begin
				wrelease = '1;
				nextstate = S_HEADER;
			end
		end
	endcase
end


endmodule
