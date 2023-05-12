`include "lu_new_pkg.sv"
import lu_new::*;

module ctrl_top_arb
(
	input [NETADDRBITS-1:0] c_n_cpus,
	
	input clk_b,
	input reset,
	
	input i_go,
	input [MAX_BDIMBITS-1:0] i_nblocks,
	output o_done,
	
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

assign o_net_ready = '1;

logic load_nblocks;
logic req_units0_clear;
logic req_units1_clear;
logic done_units_clear;
logic active_units_clear;
logic active_units_inc;
logic k_reset;
logic k_inc;
logic k_done;
logic j_load_k;
logic j_inc;
logic j_done;
logic all_active;
logic all_reqed0;
logic all_reqed1;
logic all_done;
logic msg_send;
logic msg_is_go;
logic msg_is_rdreq;
logic msg_rdreq_page;
logic msg_tomem;
logic msg_firstcol;
logic msg_sent;

ctrl_net_iface_dp dp
(
	.c_n_cpus(c_n_cpus),
	
	.clk_b(clk_b),
	.reset(reset),
	.i_net_flit(i_net_flit),
	.i_net_valid(i_net_valid),
	.i_net_sop(i_net_sop),
	.o_net_flit(o_net_flit),
	.o_net_valid(o_net_valid),
	.o_net_sop(o_net_sop),
	.o_net_eop(o_net_eop),
	.i_net_ready(i_net_ready),
	.i_nblocks(i_nblocks),
	.i_load_nblocks(load_nblocks),
	.i_req_units0_clear(req_units0_clear),
	.i_req_units1_clear(req_units1_clear),
	.i_done_units_clear(done_units_clear),
	.i_active_units_clear(active_units_clear),
	.i_active_units_inc(active_units_inc),
	.i_k_reset(k_reset),
	.i_k_inc(k_inc),
	.o_k_done(k_done),
	.i_j_load_k(j_load_k),
	.i_j_inc(j_inc),
	.o_j_done(j_done),
	.o_all_active(all_active),
	.o_all_reqed0(all_reqed0),
	.o_all_reqed1(all_reqed1),
	.o_all_done(all_done),
	.i_msg_send(msg_send),
	.i_msg_is_go(msg_is_go),
	.i_msg_is_rdreq(msg_is_rdreq),
	.i_msg_rdreq_page(msg_rdreq_page),
	.i_msg_tomem(msg_tomem),
	.i_msg_firstcol(msg_firstcol),
	.o_msg_sent(msg_sent)
);

ctrl_net_iface_ctrl ctrl
(
	.clk_b(clk_b),
	.reset(reset),
	.i_go(i_go),
	.o_done(o_done),
	.o_load_nblocks(load_nblocks),
	.o_req_units0_clear(req_units0_clear),
	.o_req_units1_clear(req_units1_clear),
	.o_done_units_clear(done_units_clear),
	.o_active_units_clear(active_units_clear),
	.o_active_units_inc(active_units_inc),
	.o_k_reset(k_reset),
	.o_k_inc(k_inc),
	.i_k_done(k_done),
	.o_j_load_k(j_load_k),
	.o_j_inc(j_inc),
	.i_j_done(j_done),
	.i_all_active(all_active),
	.i_all_reqed0(all_reqed0),
	.i_all_reqed1(all_reqed1),
	.i_all_done(all_done),
	.o_msg_send(msg_send),
	.o_msg_is_go(msg_is_go),
	.o_msg_is_rdreq(msg_is_rdreq),
	.o_msg_rdreq_page(msg_rdreq_page),
	.o_msg_tomem(msg_tomem),
	.o_msg_firstcol(msg_firstcol),
	.i_msg_sent(msg_sent)
);


endmodule
