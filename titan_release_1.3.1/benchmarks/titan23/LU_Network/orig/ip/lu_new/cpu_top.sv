`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_top #
(
	parameter IS_BPU = 0
)
(
	input [NETADDRBITS-1:0] c_id,
	
	input clk_a,
	input clk_b,
	input reset,
	
	input [255:0] i_net_flit,
	input i_net_valid,
	output o_net_ready,
	input i_net_sop,
	input i_net_eop,
	
	output [255:0] o_net_flit,
	output o_net_valid,
	input i_net_ready,
	output o_net_sop,
	output o_net_eop
);

logic [255:0] eject_flit;
logic eject_valid;
logic eject_sop;
logic eject_eop;
logic eject_ready;

logic [255:0] inject_flit;
logic inject_valid;
logic inject_sop;
logic inject_eop;
logic inject_ready;

router cpu_router
(
	.c_id(c_id),
	
	.clk(clk_b),
	.reset(reset),
	
	.o_local_data(eject_flit),
	.o_local_SOP(eject_sop),
	.o_local_EOP(eject_eop),
	.o_local_valid(eject_valid),
	.i_local_ready(eject_ready),
	
	.i_local_data(inject_flit),
	.i_local_SOP(inject_sop),
	.i_local_EOP(inject_eop),
	.i_local_valid(inject_valid),
	.o_local_ready(inject_ready),
	
	.i_ntwk_data(i_net_flit),
	.i_ntwk_SOP(i_net_sop),
	.i_ntwk_EOP(i_net_eop),
	.i_ustream_valid(i_net_valid),
	.o_ustream_ready(o_net_ready),
	
	.o_ntwk_data(o_net_flit),
	.o_ntwk_SOP(o_net_sop),
	.o_ntwk_EOP(o_net_eop),
	.o_dstream_valid(o_net_valid),
	.i_dstream_ready(i_net_ready)
);

logic [255:0] tocomp_flit;
logic tocomp_valid;
logic tocomp_sop;
logic tocomp_eop;
logic tocomp_ready;
logic [255:0] fromcomp_flit;
logic fromcomp_valid;
logic fromcomp_sop;
logic fromcomp_eop;
logic fromcomp_ready;

logic netif_go;
logic netif_go_firstcol;
logic [MAX_BDIMBITS-1:0] netif_go_blkx;
logic [MAX_BDIMBITS-1:0] netif_go_blky;
logic [MAX_BDIMBITS-1:0] netif_go_blkymax;
logic [MAX_BDIMBITS-1:0] netif_go_blkxmin;

logic netif_rddone;
t_buftrio netif_rddone_whichbufs;
logic netif_rddone_whichpage;

logic netif_rdreq;
logic netif_rdreq_ack;
logic netif_rdreq_toctrl;
logic [MAX_BDIMBITS-1:0] netif_rdreq_blkx;
logic [MAX_BDIMBITS-1:0] netif_rdreq_blky;
t_buftrio netif_rdreq_whichbufs;
logic netif_rdreq_whichpage;

logic netif_done;
logic netif_done_ack;

cpu_net_iface net_iface
(
	.clk(clk_b),
	.reset(reset),
	
	.c_id(c_id),
	
	.i_net_data(eject_flit),
	.i_net_valid(eject_valid),
	.i_net_sop(eject_sop),
	.i_net_eop(eject_eop),
	.o_net_ready(eject_ready),
	
	.o_net_data(inject_flit),
	.o_net_valid(inject_valid),
	.o_net_sop(inject_sop),
	.o_net_eop(inject_eop),
	.i_net_ready(inject_ready),
	
	.o_comp_data(tocomp_flit),
	.o_comp_valid(tocomp_valid),
	.o_comp_sop(tocomp_sop),
	.o_comp_eop(tocomp_eop),
	.i_comp_ready(tocomp_ready),
	
	.i_comp_data(fromcomp_flit),
	.i_comp_valid(fromcomp_valid),
	.i_comp_sop(fromcomp_sop),
	.i_comp_eop(fromcomp_eop),
	.o_comp_ready(fromcomp_ready),
	
	.o_go(netif_go),
	.o_go_firstcol(netif_go_firstcol),
	.o_go_blkx(netif_go_blkx),
	.o_go_blky(netif_go_blky),
	.o_go_blkxmin(netif_go_blkxmin),
	.o_go_blkymax(netif_go_blkymax),
	
	.o_rddone(netif_rddone),
	.o_rddone_whichbufs(netif_rddone_whichbufs),
	.o_rddone_whichpage(netif_rddone_whichpage),
	
	.i_rdreq(netif_rdreq),
	.i_rdreq_toctrl(netif_rdreq_toctrl),
	.o_rdreq_ack(netif_rdreq_ack),
	.i_rdreq_blkx(netif_rdreq_blkx),
	.i_rdreq_blky(netif_rdreq_blky),
	.i_rdreq_whichbufs(netif_rdreq_whichbufs),
	.i_rdreq_whichpage(netif_rdreq_whichpage),
	
	.i_done(netif_done),
	.o_done_ack(netif_done_ack)
);
	


logic comp_go_b;
logic comp_flush_b;
t_cpu_comp_mode comp_mode_b;
logic comp_page_b;
logic comp_done_b;
logic wrreq_b;
logic wrreq_whichpage_b;
logic wrreq_whichbufs_top_b;
logic [MAX_BDIMBITS-1:0] wrreq_blkx_b;
logic [MAX_BDIMBITS-1:0] wrreq_blky_b;
logic wrreq_done_b;

cpu_main_ctrl #
(
	.IS_BPU(IS_BPU)
)
main_ctrl
(
	.clk_b(clk_b),
	.reset(reset),
	.i_go(netif_go),
	.i_go_firstcol(netif_go_firstcol),
	.i_go_blkx(netif_go_blkx),
	.i_go_blky(netif_go_blky),
	.i_go_blkymax(netif_go_blkymax),
	.i_go_blkxmin(netif_go_blkxmin),
	.o_rdreq(netif_rdreq),
	.i_rdreq_ack(netif_rdreq_ack),
	.o_rdreq_toctrl(netif_rdreq_toctrl),
	.o_rdreq_blkx(netif_rdreq_blkx),
	.o_rdreq_blky(netif_rdreq_blky),
	.o_rdreq_whichbufs(netif_rdreq_whichbufs),
	.o_rdreq_whichpage(netif_rdreq_whichpage),
	.i_rddone(netif_rddone),
	.i_rddone_whichbufs(netif_rddone_whichbufs),
	.i_rddone_whichpage(netif_rddone_whichpage),
	.o_comp_go(comp_go_b),
	.o_comp_flush(comp_flush_b),
	.o_comp_mode(comp_mode_b),
	.o_comp_page(comp_page_b),
	.i_comp_done(comp_done_b),
	.o_wrreq(wrreq_b),
	.i_wrreq_ack(wrreq_done_b),
	.o_wrreq_blkx(wrreq_blkx_b),
	.o_wrreq_blky(wrreq_blky_b),
	.o_wrreq_whichpage(wrreq_whichpage_b),
	.o_wrreq_whichbufs_top(wrreq_whichbufs_top_b),
	.o_done(netif_done),
	.i_done_ack(netif_done_ack)
);

logic comp_go_a;
logic comp_flush_a;
t_cpu_comp_mode comp_mode_a;
logic comp_page_a;
logic comp_done_a;
logic wrreq_a;
logic wrreq_whichpage_a;
logic wrreq_whichbufs_top_a;
logic [MAX_BDIMBITS-1:0] wrreq_blkx_a;
logic [MAX_BDIMBITS-1:0] wrreq_blky_a;
logic wrreq_done_a;

logic [NET_DWIDTH-1:0] tocomp_data_a;
logic tocomp_valid_a;
logic tocomp_sop_a;
logic tocomp_eop_a;

logic [NET_DWIDTH-1:0] fromcomp_data_a;
logic fromcomp_valid_a;
logic fromcomp_sop_a;
logic fromcomp_eop_a;
logic fromcomp_ready_a;

cpu_clock_cross clock_cross
(
	.clk_a(clk_a),
	.clk_b(clk_b),
	.reset(reset),
	
	.i_comp_go(comp_go_b),
	.i_comp_flush(comp_flush_b),
	.i_comp_mode(comp_mode_b),
	.i_comp_page(comp_page_b),
	.o_comp_done(comp_done_b),
	.i_wrreq(wrreq_b),
	.i_wrreq_whichpage(wrreq_whichpage_b),
	.i_wrreq_whichbufs_top(wrreq_whichbufs_top_b),
	.i_wrreq_blkx(wrreq_blkx_b),
	.i_wrreq_blky(wrreq_blky_b),
	.o_wrreq_done(wrreq_done_b),
	
	.i_tocomp_data_b(tocomp_flit),
	.i_tocomp_valid_b(tocomp_valid),
	.i_tocomp_sop_b(tocomp_sop),
	.i_tocomp_eop_b(tocomp_eop),
	.o_tocomp_ready_b(tocomp_ready),
	
	.o_fromcomp_data_b(fromcomp_flit),
	.o_fromcomp_valid_b(fromcomp_valid),
	.o_fromcomp_sop_b(fromcomp_sop),
	.o_fromcomp_eop_b(fromcomp_eop),
	.i_fromcomp_ready_b(fromcomp_ready),
	
	.o_comp_go(comp_go_a),
	.o_comp_flush(comp_flush_a),
	.o_comp_mode(comp_mode_a),
	.o_comp_page(comp_page_a),
	.i_comp_done(comp_done_a),
	.o_wrreq(wrreq_a),
	.o_wrreq_whichpage(wrreq_whichpage_a),
	.o_wrreq_whichbufs_top(wrreq_whichbufs_top_a),
	.o_wrreq_blkx(wrreq_blkx_a),
	.o_wrreq_blky(wrreq_blky_a),
	.i_wrreq_done(wrreq_done_a),
	
	.o_tocomp_data_a(tocomp_data_a),
	.o_tocomp_valid_a(tocomp_valid_a),
	.o_tocomp_sop_a(tocomp_sop_a),
	.o_tocomp_eop_a(tocomp_eop_a),
	
	.i_fromcomp_data_a(fromcomp_data_a),
	.i_fromcomp_valid_a(fromcomp_valid_a),
	.i_fromcomp_sop_a(fromcomp_sop_a),
	.i_fromcomp_eop_a(fromcomp_eop_a),
	.o_fromcomp_ready_a(fromcomp_ready_a)
);

logic top_net_wclaim;
logic top_net_wrelease;
logic [TOP_AWIDTH-1:0] top_net_waddr;
logic [TOP_DWIDTH-1:0] top_net_wdata;
logic top_net_we;
logic [TOP_AWIDTH-1:0] top_comp_raddr;
logic [TOP_DWIDTH-1:0] top_comp_rdata;
logic [TOP_AWIDTH-1:0] top_comp_waddr;
logic [TOP_DWIDTH-1:0] top_comp_wdata;
logic [7:0] top_comp_be;
logic top_comp_we;

cpu_top_ram top_block
(
	.clk(clk_a),
	.reset(reset),
	
	.i_net_wclaim(top_net_wclaim),
	.i_net_wrelease(top_net_wrelease),
	.i_net_waddr(top_net_waddr),
	.i_net_wdata(top_net_wdata),
	.i_net_we(top_net_we),
	
	.i_comp_raddr(top_comp_raddr),
	.o_comp_rdata(top_comp_rdata),
	.i_comp_waddr(top_comp_waddr),
	.i_comp_wdata(top_comp_wdata),
	.i_comp_be(top_comp_be),
	.i_comp_we(top_comp_we)
);

logic [CURLEFT_AWIDTH-1:0] cur_comp_waddr [LANES];
logic [LANES-1:0][31:0] cur_comp_wdata;
logic [LANES-1:0] cur_comp_we [2];

logic [CURLEFT_AWIDTH-1:0] cur_comp_raddr [LANES];
logic [LANES-1:0][31:0] cur_comp_rdata [2];

logic cur_net_wclaim [2];
logic cur_net_wrelease [2];
logic [CURLEFT_AWIDTH-1:0] cur_net_waddr;
logic [CURLEFT_DWIDTH-1:0] cur_net_wdata;
logic [1:0] cur_net_we [2];

logic cur_net_rclaim [2];
logic cur_net_rrelease [2];
logic cur_net_renable;
logic [CURLEFT_AWIDTH-1:0] cur_net_raddr;
logic [1:0][CURLEFT_DWIDTH-1:0] cur_net_rdata;

cpu_ram_curleft #
(
	.LEFT(0)
)
cur_block0
(
	.clk(clk_a),
	.reset(reset),
	.i_comp_waddr(cur_comp_waddr),
	.i_comp_wdata(cur_comp_wdata),
	.i_comp_we(cur_comp_we[0]),
	.i_comp_raddr(cur_comp_raddr),
	.o_comp_rdata(cur_comp_rdata[0]),
	.i_net_wclaim(cur_net_wclaim[0]),
	.i_net_wrelease(cur_net_wrelease[0]),
	.i_net_waddr(cur_net_waddr),
	.i_net_wdata(cur_net_wdata),
	.i_net_we(cur_net_we[0]),
	.i_net_rclaim(cur_net_rclaim[0]),
	.i_net_rrelease(cur_net_rrelease[0]),
	.i_net_renable(cur_net_renable),
	.i_net_raddr(cur_net_raddr),
	.o_net_rdata(cur_net_rdata[0])
);

cpu_ram_curleft #
(
	.LEFT(0)
)
cur_block1
(
	.clk(clk_a),
	.reset(reset),
	.i_comp_waddr(cur_comp_waddr),
	.i_comp_wdata(cur_comp_wdata),
	.i_comp_we(cur_comp_we[1]),
	.i_comp_raddr(cur_comp_raddr),
	.o_comp_rdata(cur_comp_rdata[1]),
	.i_net_wclaim(cur_net_wclaim[1]),
	.i_net_wrelease(cur_net_wrelease[1]),
	.i_net_waddr(cur_net_waddr),
	.i_net_wdata(cur_net_wdata),
	.i_net_we(cur_net_we[1]),
	.i_net_rclaim(cur_net_rclaim[1]),
	.i_net_rrelease(cur_net_rrelease[1]),
	.i_net_renable(cur_net_renable),
	.i_net_raddr(cur_net_raddr),
	.o_net_rdata(cur_net_rdata[1])
);

logic [CURLEFT_AWIDTH-1:0] left_comp_waddr [LANES];
logic [LANES-1:0][31:0] left_comp_wdata;
logic [LANES-1:0] left_comp_we [2];

logic left_net_wclaim [2];
logic left_net_wrelease [2];
logic [CURLEFT_AWIDTH-1:0] left_comp_raddr [LANES];
logic [LANES-1:0][31:0] left_comp_rdata [2];

logic [CURLEFT_AWIDTH-1:0] left_net_waddr;
logic [CURLEFT_DWIDTH-1:0] left_net_wdata;
logic [1:0] left_net_we [2];

cpu_ram_curleft #
(
	.LEFT(1)
) left_block0
(
	.clk(clk_a),
	.reset(reset),
	.i_comp_waddr(left_comp_waddr),
	.i_comp_wdata(left_comp_wdata),
	.i_comp_we(left_comp_we[0]),
	.i_comp_raddr(left_comp_raddr),
	.o_comp_rdata(left_comp_rdata[0]),
	.i_net_wclaim(left_net_wclaim[0]),
	.i_net_wrelease(left_net_wrelease[0]),
	.i_net_waddr(left_net_waddr),
	.i_net_wdata(left_net_wdata),
	.i_net_we(left_net_we[0]),
	.i_net_rclaim(),
	.i_net_rrelease(),
	.i_net_renable('1),
	.i_net_raddr(),
	.o_net_rdata()
);

cpu_ram_curleft #
(
	.LEFT(1)
)
left_block1
(
	.clk(clk_a),
	.reset(reset),
	.i_comp_waddr(left_comp_waddr),
	.i_comp_wdata(left_comp_wdata),
	.i_comp_we(left_comp_we[1]),
	.i_comp_raddr(left_comp_raddr),
	.o_comp_rdata(left_comp_rdata[1]),
	.i_net_wclaim(left_net_wclaim[1]),
	.i_net_wrelease(left_net_wrelease[1]),
	.i_net_waddr(left_net_waddr),
	.i_net_wdata(left_net_wdata),
	.i_net_we(left_net_we[1]),
	.i_net_rclaim(),
	.i_net_rrelease(),
	.i_net_renable('1),
	.i_net_raddr(),
	.o_net_rdata()
);

logic loop_valid;

cpu_ram_net_read ram_net_read
(
	.clk(clk_a),
	.reset(reset),
	
	.c_id(c_id),
	
	.o_net_data(fromcomp_data_a),
	.o_net_valid(fromcomp_valid_a),
	.o_net_sop(fromcomp_sop_a),
	.o_net_eop(fromcomp_eop_a),
	.i_net_ready(fromcomp_ready_a),
	
	.o_loop_valid(loop_valid),
	
	.o_cur_rclaim(cur_net_rclaim),
	.o_cur_rrelease(cur_net_rrelease),
	.o_cur_addr(cur_net_raddr),
	.i_cur_data(cur_net_rdata),
	.o_cur_enable(cur_net_renable),
	
	.i_wrreq(wrreq_a),
	.o_wrreq_done(wrreq_done_a),
	.i_wrreq_whichpage(wrreq_whichpage_a),
	.i_wrreq_whichbufs_top(wrreq_whichbufs_top_a),
	.i_wrreq_blkx(wrreq_blkx_a),
	.i_wrreq_blky(wrreq_blky_a)
);

cpu_ram_net_write_curleft ram_net_write_curleft
(
	.clk(clk_a),
	.reset(reset),
	
	.i_net_data(tocomp_data_a),
	.i_net_valid(tocomp_valid_a),
	.i_net_sop(tocomp_sop_a),
	.i_net_eop(tocomp_eop_a),
	
	.o_cur_wclaim(cur_net_wclaim),
	.o_cur_wrelease(cur_net_wrelease),
	.o_cur_addr(cur_net_waddr),
	.o_cur_data(cur_net_wdata),
	.o_cur_we(cur_net_we),
	
	.o_left_wclaim(left_net_wclaim),
	.o_left_wrelease(left_net_wrelease),
	.o_left_addr(left_net_waddr),
	.o_left_data(left_net_wdata),
	.o_left_we(left_net_we)
);

cpu_ram_net_write_top ram_net_write_top
(
	.clk(clk_a),
	.reset(reset),
	
	.i_net_data(tocomp_data_a),
	.i_net_valid(tocomp_valid_a),
	.i_net_sop(tocomp_sop_a),
	.i_net_eop(tocomp_eop_a),
	
	.i_loop_data(fromcomp_data_a),
	.i_loop_valid(loop_valid),
	.i_loop_sop(fromcomp_sop_a),
	.i_loop_eop(fromcomp_eop_a),
	
	.o_top_wclaim(top_net_wclaim),
	.o_top_wrelease(top_net_wrelease),
	.o_top_addr(top_net_waddr),
	.o_top_data(top_net_wdata),
	.o_top_we(top_net_we)
);

logic pipe_k_reset;
logic pipe_k_inc;
logic pipe_k_done;
logic pipe_i_reset;
logic pipe_i_inc;
logic pipe_i_load_k1;
logic pipe_i_done;
logic pipe_j_reset;
logic pipe_j_inc;
logic pipe_j_load_k;
logic pipe_j_load_k1;
logic pipe_j_done;
logic pipe_valid;
logic pipe_norm;
logic pipe_recip;
logic pipe_wr_top;
logic pipe_wr_left;
logic pipe_wr_cur;
logic pipe_whichpage;
logic pipe_empty;

cpu_pipeline #
(
	.IS_BPU(IS_BPU)
) 
pipe
(
	.clk(clk_a),
	.reset(reset),
	
	.i_k_reset(pipe_k_reset),
	.i_k_inc(pipe_k_inc),
	.o_k_done(pipe_k_done),
	.i_i_reset(pipe_i_reset),
	.i_i_inc(pipe_i_inc),
	.i_i_load_k1(pipe_i_load_k1),
	.o_i_done(pipe_i_done),
	.i_j_reset(pipe_j_reset),
	.i_j_inc(pipe_j_inc),
	.i_j_load_k(pipe_j_load_k),
	.i_j_load_k1(pipe_j_load_k1),
	.o_j_done(pipe_j_done),
	.i_valid(pipe_valid),
	.i_norm(pipe_norm),
	.i_recip(pipe_recip),
	.i_wr_top(pipe_wr_top),
	.i_wr_left(pipe_wr_left),
	.i_wr_cur(pipe_wr_cur),
	.i_whichpage(pipe_whichpage),
	.o_pipe_empty(pipe_empty),
	
	.o_cur_rd_addr(cur_comp_raddr),
	.i_cur_rd_data(cur_comp_rdata),
	.o_cur_wr_addr(cur_comp_waddr),
	.o_cur_wr_data(cur_comp_wdata),
	.o_cur_wr_enable(cur_comp_we),
	
	.o_left_rd_addr(left_comp_raddr),
	.i_left_rd_data(left_comp_rdata),
	.o_left_wr_addr(left_comp_waddr),
	.o_left_wr_data(left_comp_wdata),
	.o_left_wr_enable(left_comp_we),
	
	.o_top_rd_addr(top_comp_raddr),
	.i_top_rd_data(top_comp_rdata),
	.o_top_wr_addr(top_comp_waddr),
	.o_top_wr_data(top_comp_wdata),
	.o_top_be(top_comp_be),
	.o_top_wr_enable(top_comp_we)
);

cpu_pipe_ctrl #
(
	.IS_BPU(IS_BPU)
)
pipe_ctrl
(
	.clk(clk_a),
	.reset(reset),
	.i_go(comp_go_a),
	.i_flush(comp_flush_a),
	.i_mode(comp_mode_a),
	.o_done(comp_done_a),
	.i_whichpage(comp_page_a),
	.o_k_reset(pipe_k_reset),
	.o_k_inc(pipe_k_inc),
	.i_k_done(pipe_k_done),
	.o_i_reset(pipe_i_reset),
	.o_i_inc(pipe_i_inc),
	.o_i_load_k1(pipe_i_load_k1),
	.i_i_done(pipe_i_done),
	.o_j_reset(pipe_j_reset),
	.o_j_inc(pipe_j_inc),
	.o_j_load_k(pipe_j_load_k),
	.o_j_load_k1(pipe_j_load_k1),
	.i_j_done(pipe_j_done),
	.o_valid(pipe_valid),
	.o_norm(pipe_norm),
	.o_recip(pipe_recip),
	.o_wr_top(pipe_wr_top),
	.o_wr_left(pipe_wr_left),
	.o_wr_cur(pipe_wr_cur),
	.o_whichpage(pipe_whichpage),
	.i_pipe_empty(pipe_empty)
);
	
endmodule
