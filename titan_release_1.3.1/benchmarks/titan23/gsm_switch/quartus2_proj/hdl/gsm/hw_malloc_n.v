
// zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
// File Name	: hw_malloc_n.v
// Description	: multi_port hardware memory allocation module 
// Author		: Zefu Dai
// -------------------------------------------------------------------------------
// Version			: 
//	-- 2012-07-03 created by Zefu Dai
// fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff


`include "../timescale.h"
module hw_malloc_n
#(
    parameter NUM_PORT = 4,
    parameter MWIDTH = 4,
    parameter AWIDTH = 7,
    parameter HM_OFFSET = 0,
    parameter MAX_PKT_LEN = 7
)
(
	// global
	input wire					clk_80M,
	input wire					rst_n,
	input wire					clr_80M,

	// ingress port
	input wire 	[NUM_PORT*MAX_PKT_LEN-1:0] i_ingress_pkt_length,
	input wire 	[NUM_PORT*32-1:0] 			i_ingress_dest_ip,
	input wire  [NUM_PORT-1:0]  	i_ingress_valid,
	input wire 	[NUM_PORT-1:0]		i_ingress_header,

	// output to GSM 
	output wire [NUM_PORT*MWIDTH-1:0] 	o_gsm_multicast,
	output wire [NUM_PORT*AWIDTH-1:0] 	o_gsm_cell_addr,
	output wire	[NUM_PORT-1:0]		o_gsm_wr_en,

	// input from GSM
	output wire  [NUM_PORT-1:0]		o_hmp_rd,
	input wire 	[NUM_PORT-1:0]		i_hmp_valid,
	input wire [NUM_PORT*AWIDTH-1:0] i_hmp_addr,
	input wire	[NUM_PORT-1:0]		i_bf_free_flag

);

generate
    genvar i;
    for(i=0;i<NUM_PORT;i=i+1) begin: HW_MALLOC_GEN
		hw_malloc
		#(
			.MWIDTH(MWIDTH),		// multicast width = 4 output ports
			.MAX_PKT_LEN(MAX_PKT_LEN), 	// maximum packet lenght in terms of number of 16-byte cells
			.AWIDTH(AWIDTH),		// 2 BRAM = total 512 cells, each port is allocated 128 cells
			.HM_OFFSET(HM_OFFSET)		// offset for the multicast vectore
		) hw_malloc_inst0
		(
			// global
			.clk(clk_80M),
			.rst_n(rst_n),
			.clr(clr_80M),
		
			// ingress port
			.i_ingress_pkt_length(i_ingress_pkt_length[(i+1)*MAX_PKT_LEN-1:i*MAX_PKT_LEN]),
			.i_ingress_dest_ip(i_ingress_dest_ip[(i+1)*32-1:i*32]),
			.i_ingress_valid(i_ingress_valid[i]),
			.i_ingress_header(i_ingress_header[i]),
		
			// output to GSM 
			.o_gsm_multicast(o_gsm_multicast[(i+1)*MWIDTH-1:i*MWIDTH]),
			.o_gsm_cell_addr(o_gsm_cell_addr[(i+1)*AWIDTH-1:i*AWIDTH]),
			.o_gsm_wr_en(o_gsm_wr_en[i]),
		
			// input from GSM
			.o_hmp_rd(o_hmp_rd[i]),
			.i_hmp_valid(i_hmp_valid[i]),
			.i_hmp_addr(i_hmp_addr[(i+1)*AWIDTH-1:i*AWIDTH]),
			.i_bf_free_flag(i_bf_free_flag[i])
		);
    end
endgenerate

endmodule
