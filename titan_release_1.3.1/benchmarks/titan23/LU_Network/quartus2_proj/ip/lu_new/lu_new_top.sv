`include "lu_new_pkg.sv"
import lu_new::*;

module lu_new_top #
(
	parameter BURSTLEN=6,
	parameter ADDRESS_WIDTH=30
)
(
	input clk_a,
	input clk_b,
	input reset,
	
	input [MAX_BDIMBITS-1:0] i_nblocks,
	input i_go,
	output o_done,
	
	output [31:0] ddr_byteenable,
	output ddr_read,
	output [BURSTLEN-1:0] ddr_size,
	output [255:0] ddr_writedata,
	output ddr_write,
	input [255:0] ddr_rdata,
	input ddr_rdatavalid,
	input ddr_waitrequest,
	output [ADDRESS_WIDTH-1:0] ddr_address
);

`ifdef D_N_CPU
localparam N_CPU = `D_N_CPU;
`else
localparam N_CPU = 4;
`endif

localparam N_NODES = N_CPU + 2;

// Define a link between two nodes
typedef struct packed
{
	// synthesis translate_off
	t_head_packet header;
	// synthesis translate_on
	logic [255:0] data;
	logic sop;
	logic eop;
	logic valid;
	logic ready;
} t_link;

// Create a ring of links
t_link links[N_NODES];

// Chain together the CPUs
genvar i;
generate
for (i = 0; i < N_CPU; i++) begin : cpus
	cpu_top #
	(
		.IS_BPU(i == 0)
	)
	cpu
	(
		.c_id( i[NETADDRBITS-1:0] ),
		.clk_a(clk_a),
		.clk_b(clk_b),
		.reset(reset),
		
		.i_net_flit(links[i].data),
		.i_net_valid(links[i].valid),
		.o_net_ready(links[i].ready),
		.i_net_sop(links[i].sop),
		.i_net_eop(links[i].eop),
		
		.o_net_flit(links[i+1].data),
		.o_net_valid(links[i+1].valid),
		.i_net_ready(links[i+1].ready),
		.o_net_sop(links[i+1].sop),
		.o_net_eop(links[i+1].eop)
	);
	
	// synthesis translate_off
	assign links[i].header = t_head_packet'(links[i].data);
	// synthesis translate_on
end
endgenerate

// synthesis translate_off
assign links[N_CPU].header = t_head_packet'(links[N_CPU].data);
assign links[N_CPU+1].header = t_head_packet'(links[N_CPU+1].data);
// synthesis translate_on

// Create the master control node, which is downstream of the last CPU
ctrl_top ctrl_node
(
	.c_n_cpus(N_CPU[NETADDRBITS-1:0]),
	
	.clk_b(clk_b),
	.reset(reset),
	.i_go(i_go),
	.i_nblocks(i_nblocks),
	.o_done(o_done),
	
	.i_net_flit(links[N_CPU].data),
	.i_net_valid(links[N_CPU].valid),
	.o_net_ready(links[N_CPU].ready),
	.i_net_sop(links[N_CPU].sop),
	.i_net_eop(links[N_CPU].eop),
	
	.o_net_flit(links[N_CPU+1].data),
	.o_net_valid(links[N_CPU+1].valid),
	.i_net_ready(links[N_CPU+1].ready),
	.o_net_sop(links[N_CPU+1].sop),
	.o_net_eop(links[N_CPU+1].eop)
);

// Create the memory controller node, which is downstream of the master controller
// and upstream of CPU #0, closing the ring
memnode_top mem_node
(
	.clk_b(clk_b),
	.reset(reset),
	
	.i_net_flit(links[N_CPU+1].data),
	.i_net_valid(links[N_CPU+1].valid),
	.o_net_ready(links[N_CPU+1].ready),
	.i_net_sop(links[N_CPU+1].sop),
	.i_net_eop(links[N_CPU+1].eop),
	
	.o_net_flit(links[0].data),
	.o_net_valid(links[0].valid),
	.i_net_ready(links[0].ready),
	.o_net_sop(links[0].sop),
	.o_net_eop(links[0].eop),
	
	.waitrequest(ddr_waitrequest),
	.addr(ddr_address),
	.rdata_valid(ddr_rdatavalid),
	.rdata(ddr_rdata),
	.wdata(ddr_writedata),
	.be(ddr_byteenable),
	.read_req(ddr_read),
	.write_req(ddr_write),
	.burstcount(ddr_size)
);

endmodule
