`include "defs.vh"

module mmm_hard
(
	input i_clk300,
	input i_clk150,
	input i_clk_ddr,
	input i_reset,
	
	input [31:0] i_indata,
	input i_indata_have,
	output o_indata_want,
	
	output [31:0] o_outdata,
	output o_outdata_have,
	input i_outdata_want,
	
	input [31:0] i_dbg_indata,
	input i_dbg_indata_have,
	output o_dbg_indata_want,
	
	output [63:0] o_dbg_outdata,
	
	output [`MEM_ADDRBITS-1:0] o_ddr_addr,
	input [`MEM_WIDTH-1:0] i_ddr_rdata,
	output [`MEM_WIDTH-1:0] o_ddr_wdata,
	input i_ddr_ready,
	output o_ddr_burstbegin,
	output [3:0] o_ddr_size,
	output o_ddr_read_req,
	output o_ddr_write_req,
	input i_ddr_rdata_valid,
	output [15:0] o_ddr_be,
	input i_ddr_init_done
);

wire mc_nocliques;


wire [`MAX_CLIQUESIZEBITS-1:0] clq_size;
wire [15:0] clq_vertex;
wire clq_valid;
wire clq_strobe;
wire buffer_clear;
wire buffer_clear_done;
wire buffer_dump;
wire buffer_dump_done;
wire [`MAX_CLIQUESIZEBITS-1:0] buffer_init_global_maxsize;
wire [`MAX_CLIQUESIZEBITS-1:0] buffer_global_maxsize;
wire [31:0] buffer_data;
wire buffer_data_valid;
wire buffer_data_ready;

clique_buffer buffer
(
	.i_clk300(i_clk300),
	.i_clk150(i_clk150),
	.i_reset(i_reset),
	.i_clq_size(clq_size),
	.i_clq_valid(clq_valid),
	.i_clq_strobe(clq_strobe),
	.i_clq_vertex(clq_vertex),
	.i_clear(buffer_clear),
	.o_clear_done(buffer_clear_done),
	.i_dump(buffer_dump),
	.o_dump_done(buffer_dump_done),
	.i_init_global_maxsize(buffer_init_global_maxsize),
	.o_global_maxsize(buffer_global_maxsize),
	.o_data(o_outdata),
	.o_data_valid(o_outdata_have),
	.i_data_ready(i_outdata_want)
);


wire [`N_UNITS-1:0] wu_go;
wire [`N_UNITS-1:0] wu_busy;
wire [`MAX_VERTSBITS-1:0] wu_nverts;
wire [`MAX_PROBSBITS-1:0] wu_prob_no;

wire [`MEM_ADDRBITS*`N_UNITS-1:0] wu_ddr_raddr;
wire [`MEM_WIDTH-1:0] wu_ddr_rdata;
wire [`N_UNITS-1:0] wu_ddr_rdata_req;
wire [`N_UNITS-1:0] wu_ddr_rdata_valid;
wire [`N_UNITS-1:0] wu_ddr_rdata_req_accepted;

wire [`MAX_CLIQUESIZEBITS*`N_UNITS-1:0] wu_clq_size;
wire [16*`N_UNITS-1:0] wu_clq_v;
wire [`N_UNITS-1:0] wu_clq_valid;
wire [`N_UNITS-1:0] wu_clq_strobe;
wire [`N_UNITS-1:0] wu_clq_accept;

genvar i;
generate
	for (i = 0; i < `N_UNITS; i = i + 1) begin : work_units
		work_unit wu
		(
			.i_clk(i_clk300),
			.i_reset(i_reset),
			
			.i_go(wu_go[i]),
			.o_busy(wu_busy[i]),
			.i_nverts(wu_nverts),
			.i_prob_no(wu_prob_no),
			.i_nocliques(mc_nocliques),
			.i_global_maxsize(buffer_global_maxsize),
			
			.o_clq_size(wu_clq_size[(i+1)*`MAX_CLIQUESIZEBITS - 1 -: `MAX_CLIQUESIZEBITS]),
			.o_clq_v(wu_clq_v[(i+1)*16-1 -: 16]),
			.o_clq_valid(wu_clq_valid[i]),
			.o_clq_strobe(wu_clq_strobe[i]),
			.i_clq_accept(wu_clq_accept[i]),
			
			.o_ddr_raddr(wu_ddr_raddr[(i+1)*`MEM_ADDRBITS-1 -: `MEM_ADDRBITS]),
			.i_ddr_rdata(wu_ddr_rdata),
			.o_ddr_rdata_req(wu_ddr_rdata_req[i]),
			.i_ddr_rdata_valid(wu_ddr_rdata_valid[i]),
			.i_ddr_rdata_req_accepted(wu_ddr_rdata_req_accepted[i])
		);
	end
endgenerate

clique_buf_arbiter clq_arbiter
(
	.i_clk300(i_clk300),
	.i_reset(i_reset),
	.i_nocliques(mc_nocliques),
	
	.i_clq_valid(wu_clq_valid),
	.i_clq_size(wu_clq_size),
	.i_clq_vertex(wu_clq_v),
	.i_clq_strobe(wu_clq_strobe),
	.o_clq_accept(wu_clq_accept),
	
	.o_clq_valid(clq_valid),
	.o_clq_size(clq_size),
	.o_clq_vertex(clq_vertex),
	.o_clq_strobe(clq_strobe)
);

wire [`MAX_PROBSBITS-1:0] sched_prob_no;
wire [`MAX_VERTSBITS-1:0] sched_nverts;
wire sched_can_alloc;
wire sched_can_commit;
wire sched_commit;
wire sched_pending;
	
scheduler sched
(
	.i_clk150(i_clk150),
	.i_clk300(i_clk300),
	.i_reset(i_reset),
	
	.i_mc_prob_no(sched_prob_no),
	.i_mc_nverts(sched_nverts),
	.o_mc_can_alloc(sched_can_alloc),
	.o_mc_can_commit(sched_can_commit),
	.i_mc_commit(sched_commit),
	.o_mc_pending(sched_pending),
	
	.o_wu_go(wu_go),
	.i_wu_busy(wu_busy),
	.o_wu_nverts(wu_nverts),
	.o_wu_prob_no(wu_prob_no)
);

wire [31:0] fillmem_indata;
wire fillmem_indata_have;
wire fillmem_indata_want;
wire fillmem_go;
wire fillmem_done;
wire fillmem_ignore_prob;
wire [`MAX_PROBSBITS-1:0] fillmem_prob_no;
wire [`MAX_VERTSBITS-1:0] fillmem_nverts;
wire [`MEM_ADDRBITS-1:0] fillmem_ddr_waddr;
wire [`MEM_WIDTH-1:0] fillmem_ddr_wdata;
wire fillmem_wdata_have;
wire fillmem_ddr_wdata_accept;

fillmem fillmem_inst
(
	.i_clk150(i_clk150),
	.i_reset(i_reset),
	
	.i_indata(fillmem_indata),
	.i_indata_have(fillmem_indata_have),
	.o_indata_want(fillmem_indata_want),
	.i_go(fillmem_go),
	.o_done(fillmem_done),
	.i_ignore_prob(fillmem_ignore_prob),
	.i_prob_no(fillmem_prob_no),
	.i_nverts(fillmem_nverts),
	
	.o_ddr_waddr(fillmem_ddr_waddr),
	.o_ddr_wdata(fillmem_ddr_wdata),
	.o_ddr_wdata_have(fillmem_wdata_have),
	.i_ddr_wdata_accept(fillmem_ddr_wdata_accept)
);

wire [`MEM_ADDRBITS-1:0] arb_ddr_raddr;
wire [`MEM_WIDTH-1:0] arb_ddr_rdata;
wire arb_ddr_rdata_req;
wire arb_ddr_rdata_req_accepted;
wire arb_ddr_rdata_valid;
wire arb_ddr_rdata_lastword;

ddr_iface ddr_iface_inst
(
	.i_clk300(i_clk300),
	.i_clk150(i_clk150),
	.i_clk_ddr(i_clk_ddr),
	.i_reset(i_reset),
	
	.i_waddr(fillmem_ddr_waddr),
	.i_wdata(fillmem_ddr_wdata),
	.i_wdata_have(fillmem_wdata_have),
	.o_wdata_accept(fillmem_ddr_wdata_accept),
	
	.i_raddr(arb_ddr_raddr),
	.o_rdata(arb_ddr_rdata),
	.i_rdata_req(arb_ddr_rdata_req),
	.o_rdata_req_accepted(arb_ddr_rdata_req_accepted),
	.o_rdata_valid(arb_ddr_rdata_valid),
	.o_rdata_lastword(arb_ddr_rdata_lastword),
	
	.o_ddr_address(o_ddr_addr),
	.o_ddr_write_req(o_ddr_write_req),
	.o_ddr_read_req(o_ddr_read_req),
	.o_ddr_burstbegin(o_ddr_burstbegin),
	.o_ddr_wdata(o_ddr_wdata),
	.o_ddr_be(o_ddr_be),
	.o_ddr_size(o_ddr_size),
	.i_ddr_ready(i_ddr_ready),
	.i_ddr_rdata(i_ddr_rdata),
	.i_ddr_rdata_valid(i_ddr_rdata_valid),
	.i_ddr_init_done(i_ddr_init_done)
);

ddr_arbiter ddr_arb_inst
(
	.i_clk300(i_clk300),
	.i_reset(i_reset),
	
	.i_rdata_req(wu_ddr_rdata_req),
	.i_raddr(wu_ddr_raddr),
	.o_rdata(wu_ddr_rdata),
	.o_rdata_valid(wu_ddr_rdata_valid),
	.o_rdata_req_accepted(wu_ddr_rdata_req_accepted),
	
	.o_rdata_req(arb_ddr_rdata_req),
	.o_raddr(arb_ddr_raddr),
	.i_rdata_lastword(arb_ddr_rdata_lastword),
	.i_rdata(arb_ddr_rdata),
	.i_rdata_valid(arb_ddr_rdata_valid),
	.i_rdata_req_accepted(arb_ddr_rdata_req_accepted)
);

wire dbg_working;

main_control mc
(
	.i_clk150(i_clk150),
	.i_reset(i_reset),
	
	.i_indata(i_indata),
	.i_indata_have(i_indata_have),
	.o_indata_want(o_indata_want),
	
	.o_fillmem_data(fillmem_indata),
	.o_fillmem_have(fillmem_indata_have),
	.i_fillmem_want(fillmem_indata_want),
	.o_fillmem_go(fillmem_go),
	.i_fillmem_done(fillmem_done),
	.o_fillmem_prob_no(fillmem_prob_no),
	.o_fillmem_nverts(fillmem_nverts),
	.o_fillmem_ignore_prob(fillmem_ignore_prob),
	
	.o_buf_clear(buffer_clear),
	.i_buf_clear_done(buffer_clear_done),
	.o_buf_dump(buffer_dump),
	.i_buf_dump_done(buffer_dump_done),
	.o_buf_init_maxsize(buffer_init_global_maxsize),
	.i_buf_cur_maxsize(buffer_global_maxsize),
	
	.o_sched_prob_no(sched_prob_no),
	.o_sched_nverts(sched_nverts),
	.i_sched_can_alloc(sched_can_alloc),
	.i_sched_can_commit(sched_can_commit),
	.o_sched_commit(sched_commit),
	.i_sched_pending(sched_pending),
	
	.o_nocliques(mc_nocliques),
	.o_dbg_working(dbg_working)
);

debug_stats dbg
(
	.i_clk150(i_clk150),
	.i_reset(i_reset),
	
	.i_dbg_indata(i_dbg_indata),
	.i_dbg_indata_have(i_dbg_indata_have),
	.o_dbg_indata_want(o_dbg_indata_want),
	
	.o_dbg_outdata(o_dbg_outdata),
	
	.i_set_running(dbg_working),
	.i_wu_busy(wu_busy)
);

endmodule
