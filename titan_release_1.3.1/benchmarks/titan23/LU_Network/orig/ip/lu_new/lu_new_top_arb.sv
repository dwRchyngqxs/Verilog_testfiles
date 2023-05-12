`include "lu_new_pkg.sv"
import lu_new::*;

// Links are normally 256 bits wide. but some modules
// just send header packets and don't need this full
// width (or even all possible types of control messages).
// Because of partition boundaries, quartus can't optimize
// this automatically, so here are a bunch of convenience
// functions to explicitly strip away parts of the full
// 256-bit width between certain modules.

// CTRL -> MEM only sends RDREQ and GO messages
function logic [255:0] opt_ctrl_to_mem(logic [255:0] in);
	automatic t_head_packet hdr = t_head_packet'(in);
	automatic t_head_packet hdr2 = t_head_packet'('0);
	
	hdr2.RD_RQST = hdr.RD_RQST;
	hdr2.RQST_ID = hdr.RQST_ID;
	hdr2.BLKX = hdr.BLKX;
	hdr2.BLKY = hdr.BLKY;
	hdr2.WHICHBUFS = hdr.WHICHBUFS;
	hdr2.WHICHPAGE = hdr.WHICHPAGE;
	
	hdr2.MSG_GO = hdr.MSG_GO;
	hdr2.BLKYMAX = hdr.BLKYMAX;
	
	return hdr2;
endfunction

// CTRL -> CPU only sends GO messages
function logic [255:0] opt_ctrl_to_cpu(logic [255:0] in);
	automatic t_head_packet hdr = t_head_packet'(in);
	automatic t_head_packet hdr2 = t_head_packet'('0);
	
	hdr2.MSG_GO = hdr.MSG_GO;
	hdr2.BLKYMAX = hdr.BLKYMAX;
	hdr2.BLKXMIN = hdr.BLKXMIN;
	hdr2.FIRSTCOL = hdr.FIRSTCOL;
	hdr2.BLKX = hdr.BLKX;
	hdr2.BLKY = hdr.BLKY;
	hdr2.RQST_ID = hdr.RQST_ID;
	hdr2.DEST_ID = hdr.DEST_ID;
	
	return hdr2;
endfunction

// CPU -> CTRL only sends DONE and RDREQ messages
// CTRL -> CPU only sends GO messages
function logic [255:0] opt_cpu_to_ctrl(logic [255:0] in);
	automatic t_head_packet hdr = t_head_packet'(in);
	automatic t_head_packet hdr2 = t_head_packet'('0);

	hdr2.RD_RQST = hdr.RD_RQST;
	hdr2.RQST_ID = hdr.RQST_ID;
	hdr2.BLKX = hdr.BLKX;
	hdr2.BLKY = hdr.BLKY;
	hdr2.WHICHBUFS = hdr.WHICHBUFS;
	hdr2.WHICHPAGE = hdr.WHICHPAGE;
	
	hdr2.MSG_DONE = hdr.MSG_DONE;
	
	return hdr2;
endfunction


// Here's the top-level module
module lu_new_top_arb #
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

`ifdef D_ARB_DEPTH
localparam ARB_DEPTH = `D_ARB_DEPTH;
`else
localparam ARB_DEPTH = (N_CPU <= 4)? 1 : (N_CPU <= 8)? 2 : (N_CPU <= 18)? 3 : 4;
`endif

// Define a unidirectional link
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


// Create links for all the nodes
t_link l_cpu_in[N_CPU-1:0];
t_link l_mem_in;
t_link l_ctrl_in;

t_link l_cpu_out[N_CPU-1:0];
t_link l_mem_out;
t_link l_ctrl_out;

// Instantiate the CPUs and attach to links
genvar gi;
generate
for (gi = 0; gi < N_CPU; gi++) begin : cpus
	cpu_top_arb #
	(
		.IS_BPU(gi == 0)
	)
	cpu
	(
		.c_id( gi[NETADDRBITS-1:0] ),
		.clk_a(clk_a),
		.clk_b(clk_b),
		.reset(reset),
		
		.i_net_flit(l_cpu_in[gi].data),
		.i_net_valid(l_cpu_in[gi].valid),
		.o_net_ready(l_cpu_in[gi].ready),
		.i_net_sop(l_cpu_in[gi].sop),
		.i_net_eop(l_cpu_in[gi].eop),
		
		.o_net_flit(l_cpu_out[gi].data),
		.o_net_valid(l_cpu_out[gi].valid),
		.i_net_ready(l_cpu_out[gi].ready),
		.o_net_sop(l_cpu_out[gi].sop),
		.o_net_eop(l_cpu_out[gi].eop)
	);
	
	// synthesis translate_off
	assign l_cpu_in[gi].header = t_head_packet'(l_cpu_in[gi].data);
	assign l_cpu_out[gi].header = t_head_packet'(l_cpu_out[gi].data);
	// synthesis translate_on
end
endgenerate

// synthesis translate_off
assign l_mem_in.header = t_head_packet'(l_mem_in.data);
assign l_mem_out.header = t_head_packet'(l_mem_out.data);
assign l_ctrl_in.header = t_head_packet'(l_ctrl_in.data);
assign l_ctrl_out.header = t_head_packet'(l_ctrl_out.data);
// synthesis translate_on

// Create the master control node
ctrl_top_arb ctrl_node
(
	.c_n_cpus(N_CPU[NETADDRBITS-1:0]),
	
	.clk_b(clk_b),
	.reset(reset),
	.i_go(i_go),
	.i_nblocks(i_nblocks),
	.o_done(o_done),
	
	.i_net_flit(l_ctrl_in.data),
	.i_net_valid(l_ctrl_in.valid),
	.o_net_ready(l_ctrl_in.ready),
	.i_net_sop(l_ctrl_in.sop),
	.i_net_eop(l_ctrl_in.eop),
	
	.o_net_flit(l_ctrl_out.data),
	.o_net_valid(l_ctrl_out.valid),
	.i_net_ready(l_ctrl_out.ready),
	.o_net_sop(l_ctrl_out.sop),
	.o_net_eop(l_ctrl_out.eop)
);

// Create the memory controller node
memnode_top_arb mem_node
(
	.clk_b(clk_b),
	.reset(reset),
	
	.i_net_flit(l_mem_in.data),
	.i_net_valid(l_mem_in.valid),
	.o_net_ready(l_mem_in.ready),
	.i_net_sop(l_mem_in.sop),
	.i_net_eop(l_mem_in.eop),
	
	.o_net_flit(l_mem_out.data),
	.o_net_valid(l_mem_out.valid),
	.i_net_ready(l_mem_out.ready),
	.o_net_sop(l_mem_out.sop),
	.o_net_eop(l_mem_out.eop),
	
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


logic [255:0] cpu_to_ctrl_data [N_CPU];
logic cpu_to_ctrl_valid [N_CPU];
logic cpu_to_ctrl_sop [N_CPU];
logic cpu_to_ctrl_eop [N_CPU];
logic cpu_to_ctrl_ready [N_CPU];

logic [NETADDRBITS-1:0] cpu_out_id[2];
assign cpu_out_id[0] = NETADDR_MEM;
assign cpu_out_id[1] = NETADDR_CTRL;

logic [255:0] mem_in_data [N_CPU+1];
logic mem_in_valid [N_CPU+1];
logic mem_in_sop [N_CPU+1];
logic mem_in_eop [N_CPU+1];
logic mem_in_ready [N_CPU+1];

logic [255:0] mem_to_cpu_data [N_CPU];
logic mem_to_cpu_valid [N_CPU];
logic mem_to_cpu_sop [N_CPU];
logic mem_to_cpu_eop [N_CPU];
logic mem_to_cpu_ready [N_CPU];
logic [NETADDRBITS-1:0] mem_to_cpu_id[N_CPU];

logic [255:0] ctrl_out_data [N_CPU+1];
logic ctrl_out_valid [N_CPU+1];
logic ctrl_out_sop [N_CPU+1];
logic ctrl_out_eop [N_CPU+1];
logic ctrl_out_ready [N_CPU+1];
logic [NETADDRBITS-1:0] ctrl_out_id[N_CPU+1];

generate
	for (gi = 0; gi < N_CPU; gi++) begin : cpu_adapters
		logic [255:0] out_data[2];
		logic out_valid[2];
		logic out_ready[2];
		logic out_sop[2];
		logic out_eop[2];
		
		logic [255:0] in_data[2];
		logic in_valid[2];
		logic in_ready[2];
		logic in_sop[2];
		logic in_eop[2];
		
		assign mem_in_data[gi] = out_data[0];
		assign mem_in_valid[gi] = out_valid[0];
		assign mem_in_sop[gi] = out_sop[0];
		assign mem_in_eop[gi] = out_eop[0];
		assign out_ready[0] = mem_in_ready[gi];
		
		assign cpu_to_ctrl_data[gi] = opt_cpu_to_ctrl(out_data[1]);
		assign cpu_to_ctrl_valid[gi] = out_valid[1];
		assign cpu_to_ctrl_sop[gi] = out_sop[1];
		assign cpu_to_ctrl_eop[gi] = out_eop[1];
		assign out_ready[1] = cpu_to_ctrl_ready[gi];
		
		assign in_data[0] = mem_to_cpu_data[gi];
		assign in_valid[0] = mem_to_cpu_valid[gi];
		assign in_sop[0] = mem_to_cpu_sop[gi];
		assign in_eop[0] = mem_to_cpu_eop[gi];
		assign mem_to_cpu_ready[gi] = in_ready[0];
		
		assign in_data[1] = opt_ctrl_to_cpu(ctrl_out_data[gi]);
		assign in_valid[1] = ctrl_out_valid[gi];
		assign in_sop[1] = ctrl_out_sop[gi];
		assign in_eop[1] = ctrl_out_eop[gi];
		assign ctrl_out_ready[gi] = in_ready[1];
			
		one_to_many #
		(
			.WIDTH(256),
			.DEPTH(ARB_DEPTH),
			.SINKS(2)
		)
		cpu_o2m
		(
			.clk(clk_b),
			.reset(reset),
			
			.i_data(l_cpu_out[gi].data),
			.i_valid(l_cpu_out[gi].valid),
			.i_sop(l_cpu_out[gi].sop),
			.i_eop(l_cpu_out[gi].eop),
			.o_ready(l_cpu_out[gi].ready),
			
			.i_id(cpu_out_id),
			.o_data(out_data),
			.o_valid(out_valid),
			.o_sop(out_sop),
			.o_eop(out_eop),
			.i_ready(out_ready)
		);
		
		many_to_one #
		(
			.WIDTH(256),
			.DEPTH(ARB_DEPTH),
			.SOURCES(2)
		)
		cpu_m2o
		(
			.clk(clk_b),
			.reset(reset),
			
			.i_data(in_data),
			.i_valid(in_valid),
			.i_sop(in_sop),
			.i_eop(in_eop),
			.o_ready(in_ready),
			
			.o_data(l_cpu_in[gi].data),
			.o_valid(l_cpu_in[gi].valid),
			.o_sop(l_cpu_in[gi].sop),
			.o_eop(l_cpu_in[gi].eop),
			.i_ready(l_cpu_in[gi].ready)
		);
		
		assign mem_to_cpu_id[gi] = (NETADDRBITS)'(gi);
		assign ctrl_out_id[gi] = (NETADDRBITS)'(gi);
	end
endgenerate

many_to_one #
(
	.WIDTH(256),
	.DEPTH(ARB_DEPTH),
	.SOURCES(N_CPU)
)
ctrl_m2o
(
	.clk(clk_b),
	.reset(reset),
	
	.i_data(cpu_to_ctrl_data),
	.i_valid(cpu_to_ctrl_valid),
	.i_sop(cpu_to_ctrl_sop),
	.i_eop(cpu_to_ctrl_eop),
	.o_ready(cpu_to_ctrl_ready),
	
	.o_data(l_ctrl_in.data),
	.o_valid(l_ctrl_in.valid),
	.o_sop(l_ctrl_in.sop),
	.o_eop(l_ctrl_in.eop),
	.i_ready(l_ctrl_in.ready)
);

one_to_many #
(
	.WIDTH(256),
	.DEPTH(ARB_DEPTH),
	.SINKS(N_CPU+1)
)
ctrl_o2m
(
	.clk(clk_b),
	.reset(reset),
	
	.i_data(l_ctrl_out.data),
	.i_valid(l_ctrl_out.valid),
	.i_sop(l_ctrl_out.sop),
	.i_eop(l_ctrl_out.eop),
	.o_ready(l_ctrl_out.ready),
	
	.i_id(ctrl_out_id),
	.o_data(ctrl_out_data),
	.o_valid(ctrl_out_valid),
	.o_sop(ctrl_out_sop),
	.o_eop(ctrl_out_eop),
	.i_ready(ctrl_out_ready)
);

many_to_one #
(
	.WIDTH(256),
	.DEPTH(ARB_DEPTH),
	.SOURCES(N_CPU+1)
)
mem_m2o
(
	.clk(clk_b),
	.reset(reset),
	
	.i_data(mem_in_data),
	.i_valid(mem_in_valid),
	.i_sop(mem_in_sop),
	.i_eop(mem_in_eop),
	.o_ready(mem_in_ready),
	
	.o_data(l_mem_in.data),
	.o_valid(l_mem_in.valid),
	.o_sop(l_mem_in.sop),
	.o_eop(l_mem_in.eop),
	.i_ready(l_mem_in.ready)
);

one_to_many #
(
	.WIDTH(256),
	.DEPTH(ARB_DEPTH),
	.SINKS(N_CPU)
)
mem_o2m
(
	.clk(clk_b),
	.reset(reset),
	
	.i_data(l_mem_out.data),
	.i_valid(l_mem_out.valid),
	.i_sop(l_mem_out.sop),
	.i_eop(l_mem_out.eop),
	.o_ready(l_mem_out.ready),
	
	.i_id(mem_to_cpu_id),
	.o_data(mem_to_cpu_data),
	.o_valid(mem_to_cpu_valid),
	.o_sop(mem_to_cpu_sop),
	.o_eop(mem_to_cpu_eop),
	.i_ready(mem_to_cpu_ready)
);

assign ctrl_out_id[N_CPU] = NETADDR_MEM;	

assign mem_in_data[N_CPU] = opt_ctrl_to_mem(ctrl_out_data[N_CPU]);
assign mem_in_valid[N_CPU] = ctrl_out_valid[N_CPU];
assign mem_in_sop[N_CPU] = ctrl_out_sop[N_CPU];
assign mem_in_eop[N_CPU] = ctrl_out_eop[N_CPU];
assign ctrl_out_ready[N_CPU] = mem_in_ready[N_CPU];

endmodule
