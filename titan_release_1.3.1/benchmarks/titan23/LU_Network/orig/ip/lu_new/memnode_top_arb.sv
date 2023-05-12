import lu_new::*;

module memnode_top_arb
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


mem_interface iface
(
	.clk_b(clk_b),
	.reset(reset),
	
	.i_net_data(i_net_flit),
	.i_net_SOP(i_net_sop),
	.i_net_EOP(i_net_eop),
	.i_net_valid(i_net_valid),
	.o_net_ready(o_net_ready),
	
	.o_net_data(o_net_flit),
	.o_net_valid(o_net_valid),
	.o_net_SOP(o_net_sop),
	.o_net_EOP(o_net_eop),
	.i_net_ready(i_net_ready),
	
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
