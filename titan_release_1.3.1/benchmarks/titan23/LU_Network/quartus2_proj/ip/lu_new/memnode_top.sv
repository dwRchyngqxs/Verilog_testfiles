`include "lu_new_pkg.sv"
import lu_new::*;

module memnode_top 
(
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
	output o_net_eop,
	
	input	waitrequest,
	output	[29:0] addr,
	input	rdata_valid, 
	input	[255:0] rdata,
	output  [255:0] wdata,
	output  [31:0]	be,
	output	read_req,
	output	write_req,
	output  [5:0]	burstcount
);

logic [255:0] eject_flit;
logic eject_valid;
logic eject_ready;
logic eject_sop;
logic eject_eop;

logic [255:0] inject_flit;
logic inject_valid;
logic inject_sop;
logic inject_eop;
logic inject_ready;

router mem_router
(
	.c_id((NETADDRBITS)'(NETADDR_MEM)),
	
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


mem_interface iface
(
	.clk_b(clk_b),
	.reset(reset),
	
	.i_net_data(eject_flit),
	.i_net_SOP(eject_sop),
	.i_net_EOP(eject_eop),
	.i_net_valid(eject_valid),
	.o_net_ready(eject_ready),
	
	.o_net_data(inject_flit),
	.o_net_valid(inject_valid),
	.o_net_SOP(inject_sop),
	.o_net_EOP(inject_eop),
	.i_net_ready(inject_ready),
	
	.waitrequest(waitrequest),
	.addr(addr),
	.rdata_valid(rdata_valid), 
	.rdata(rdata),
	.wdata(wdata),
	.be(be),
	.read_req(read_req),
	.write_req(write_req),
	.burstcount(burstcount)
);


endmodule
