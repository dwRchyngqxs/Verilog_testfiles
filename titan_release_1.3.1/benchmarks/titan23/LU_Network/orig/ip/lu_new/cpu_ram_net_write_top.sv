`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_ram_net_write_top
(
	input clk,
	input reset,
	
	input [NET_DWIDTH-1:0] i_net_data,
	input i_net_valid,
	input i_net_sop,
	input i_net_eop,
	
	input [NET_DWIDTH-1:0] i_loop_data,
	input i_loop_valid,
	input i_loop_sop,
	input i_loop_eop,	
	
	output logic o_top_wclaim,
	output logic o_top_wrelease,
	output logic [TOP_AWIDTH-1:0] o_top_addr,
	output logic [TOP_DWIDTH-1:0] o_top_data,
	output logic o_top_we
);

// Decode header flits
t_head_packet net_header;
assign net_header = t_head_packet'(i_net_data);
wire net_start = i_net_valid && i_net_sop && net_header.RD_DATA && net_header.WHICHBUFS.top;

t_head_packet loop_header;
assign loop_header = t_head_packet'(i_loop_data);
wire loop_start = i_loop_valid && i_loop_sop && loop_header.WR_DATA && loop_header.WHICHBUFS.top;

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

// Connect to memories, mux between net write and loopback write
logic valid;
logic wrelease;
logic wclaim;
enum bit {NET, LOOP} data_src;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		o_top_we <= '0;
		o_top_wrelease <= '0;
		o_top_wclaim <= '0;
	end
	else begin
		o_top_addr <= addr_cnt;
		o_top_data <= (data_src == NET) ? i_net_data : i_loop_data;
		o_top_we <= valid;
		o_top_wrelease <= wrelease;
		o_top_wclaim <= wclaim;
	end
end

// State machine
enum int unsigned
{
	S_HEADER,
	S_NET,
	S_LOOP
} state, nextstate;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) state <= S_HEADER;
	else state <= nextstate;
end

always_comb begin
	nextstate = state;
	valid = '0;
	addr_cnt_reset = '0;
	addr_cnt_inc = '0;
	data_src = NET;
	wclaim = '0;
	wrelease = '0;
	
	case (state)
		S_HEADER: begin
			addr_cnt_reset = '1;
			if (net_start) begin
				wclaim = '1;
				nextstate = S_NET;
			end
			else if (loop_start) begin
				wclaim = '1;
				nextstate = S_LOOP;
			end
		end
		
		S_NET: begin
			data_src = NET;
			valid = i_net_valid;
			addr_cnt_inc = i_net_valid;
			if (i_net_valid && !i_net_sop && i_net_eop) begin
				wrelease = '1;
				nextstate = S_HEADER;
			end
		end
		
		S_LOOP: begin
			data_src = LOOP;
			valid = i_loop_valid;
			addr_cnt_inc = i_loop_valid;
			if (i_loop_valid && !i_loop_sop && i_loop_eop) begin
				wrelease = '1;
				nextstate = S_HEADER;
			end
		end
	endcase
end


endmodule
