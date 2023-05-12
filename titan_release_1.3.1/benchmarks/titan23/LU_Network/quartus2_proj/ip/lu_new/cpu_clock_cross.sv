`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_clock_cross
(
	input clk_a,
	input clk_b,
	input reset,
	
	// clk_a side
	input i_comp_go,
	input i_comp_flush,
	input t_cpu_comp_mode i_comp_mode,
	input i_comp_page,
	output logic o_comp_done,
	input i_wrreq,
	input i_wrreq_whichpage,
	input i_wrreq_whichbufs_top,
	input [MAX_BDIMBITS-1:0] i_wrreq_blkx,
	input [MAX_BDIMBITS-1:0] i_wrreq_blky,
	output logic o_wrreq_done,
	
	input [NET_DWIDTH-1:0] i_tocomp_data_b,
	input i_tocomp_valid_b,
	input i_tocomp_sop_b,
	input i_tocomp_eop_b,
	output o_tocomp_ready_b,
	
	output [NET_DWIDTH-1:0] o_fromcomp_data_b,
	output o_fromcomp_valid_b,
	output o_fromcomp_sop_b,
	output o_fromcomp_eop_b,
	input i_fromcomp_ready_b,
	
	// clk_b side
	output logic o_comp_go,
	output logic o_comp_flush,
	output t_cpu_comp_mode o_comp_mode,
	output logic o_comp_page,
	input i_comp_done,
	output logic o_wrreq,
	output logic o_wrreq_whichpage,
	output logic o_wrreq_whichbufs_top,
	output logic [MAX_BDIMBITS-1:0] o_wrreq_blkx,
	output logic [MAX_BDIMBITS-1:0] o_wrreq_blky,
	input i_wrreq_done,
	
	output logic [NET_DWIDTH-1:0] o_tocomp_data_a,
	output logic o_tocomp_valid_a,
	output logic o_tocomp_sop_a,
	output logic o_tocomp_eop_a,
	
	input [NET_DWIDTH-1:0] i_fromcomp_data_a,
	input i_fromcomp_valid_a,
	input i_fromcomp_sop_a,
	input i_fromcomp_eop_a,
	output o_fromcomp_ready_a
);

logic b2a_empty;
logic b2a_fifo_wrreq;
logic b2a_comp_go;
logic b2a_wrreq;

dcfifo #
(
	.lpm_width(1 + $bits(i_comp_mode) + 1 + 1 + 1 + 1 + 1 + 2*MAX_BDIMBITS),
	.lpm_widthu(5),
	.lpm_numwords(32),
	.lpm_showahead("ON"),
	.overflow_checking("OFF")
	// synthesis read_comments_as_HDL on
	//, .ram_block_type("MLAB")
	// synthesis read_comments_as_HDL off
)
b_to_a
(
	.wrclk(clk_b),
	.rdclk(clk_a),
	.data({i_comp_go, i_comp_flush, i_comp_mode, i_comp_page, i_wrreq, i_wrreq_whichpage, i_wrreq_whichbufs_top, i_wrreq_blkx, i_wrreq_blky}),
	.wrreq(b2a_fifo_wrreq),
	.rdreq(1'b1),
	.aclr(reset),
	.q({b2a_comp_go, o_comp_flush, o_comp_mode, o_comp_page, b2a_wrreq, o_wrreq_whichpage, o_wrreq_whichbufs_top, o_wrreq_blkx, o_wrreq_blky}),
	.rdempty(b2a_empty)
);

assign o_comp_go = b2a_comp_go && !b2a_empty;
assign o_wrreq = b2a_wrreq && !b2a_empty;
assign b2a_fifo_wrreq = i_comp_go | i_wrreq;


logic a2b_empty;
logic a2b_fifo_wrreq;
logic a2b_comp_done;
logic a2b_wrreq_done;

dcfifo #
(
	.lpm_width(2),
	.lpm_widthu(5),
	.lpm_numwords(32),
	.lpm_showahead("ON"),
	.overflow_checking("OFF")
	// synthesis read_comments_as_HDL on
	//, .ram_block_type("MLAB")
	// synthesis read_comments_as_HDL off
)
a_to_b
(
	.wrclk(clk_a),
	.rdclk(clk_b),
	.data({i_comp_done, i_wrreq_done}),
	.wrreq(a2b_fifo_wrreq),
	.rdreq(1'b1),
	.aclr(reset),
	.q({a2b_comp_done, a2b_wrreq_done}),
	.rdempty(a2b_empty)
);

assign o_comp_done = a2b_comp_done && !a2b_empty;
assign o_wrreq_done = a2b_wrreq_done && !a2b_empty;
assign a2b_fifo_wrreq = i_comp_done | i_wrreq_done;

logic b2a_data_full;
logic b2a_data_empty;
logic [NET_DWIDTH-1:0] b2a_data;
logic b2a_sop;
logic b2a_eop;
dcfifo #
(
	.lpm_width(NET_DWIDTH + 2),
	.lpm_widthu(5),
	.lpm_numwords(32),
	.lpm_showahead("ON")
	// synthesis read_comments_as_HDL on
	//, .ram_block_type("MLAB")
	// synthesis read_comments_as_HDL off
)
b_to_a_data
(
	.wrclk(clk_b),
	.rdclk(clk_a),
	.data({i_tocomp_data_b, i_tocomp_sop_b, i_tocomp_eop_b}),
	.q({b2a_data, b2a_sop, b2a_eop}),
	.wrreq(i_tocomp_valid_b),
	.rdreq(1'b1),
	.rdempty(b2a_data_empty),
	.wrfull(b2a_data_full)
);

assign o_tocomp_ready_b = !b2a_data_full;

always_ff @ (posedge clk_a or posedge reset) begin
	if (reset) o_tocomp_valid_a = '0;
	else begin
		o_tocomp_valid_a <= !b2a_data_empty;
		o_tocomp_data_a <= b2a_data;
		o_tocomp_sop_a <= b2a_sop;
		o_tocomp_eop_a <= b2a_eop;
	end
end

logic a2b_data_full;
logic a2b_data_empty;
dcfifo #
(
	.lpm_width(NET_DWIDTH + 2),
	.lpm_widthu(5),
	.lpm_numwords(32),
	.lpm_showahead("ON")
	// synthesis read_comments_as_HDL on
	//, .ram_block_type("MLAB")
	// synthesis read_comments_as_HDL off
)
a_to_b_data
(
	.wrclk(clk_a),
	.rdclk(clk_b),
	.data({i_fromcomp_data_a, i_fromcomp_sop_a, i_fromcomp_eop_a}),
	.q({o_fromcomp_data_b, o_fromcomp_sop_b, o_fromcomp_eop_b}),
	.wrreq(i_fromcomp_valid_a),
	.rdreq(i_fromcomp_ready_b),
	.rdempty(a2b_data_empty),
	.wrfull(a2b_data_full)
);

assign o_fromcomp_ready_a = !a2b_data_full;
assign o_fromcomp_valid_b = !a2b_data_empty;

endmodule
