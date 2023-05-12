// zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
// File Name	: gsm_test.v
// Description	: test bench for gsm system
// Author		: Zefu Dai
// -------------------------------------------------------------------------------
// Version		: 
//	-- 2011-07-02 created by Zefu Dai
// fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff


`include "../timescale.h"

module gsm_test;

`define DAT_PKT_PAD 	16'hE00F
`define FLAG_HEAD_PKT	16'hABCD
`define FLAG_DAT_PKT	16'h0800
localparam	DWIDTH = 256;
localparam	MWIDTH = 4;
localparam	GSIZE = 4;
localparam	SWITCH_SIZE = MWIDTH*GSIZE;
localparam	LOG_MWIDTH = 2;
localparam	LOG_GSIZE = 2;
localparam	AWIDTH = 7;
localparam	LOC_PKT_LEN = 24; // the bit location of packet length field in the 16-byte data cell
localparam	LOC_DEST_IP = 31; // the bit location of the destination ip field in the data cell
localparam	LOC_SOURCE_ID = 16;
//-------------------------------------------------
// clk and reset signal generation
//-------------------------------------------------
wire clk_320M, clk_80M, clr_320M, clr_80M;
wire rst_n;

reg clk_33M, extern_rst_n;

initial begin
	clk_33M <= 0;
	extern_rst_n <= 0;
	
	extern_rst_n <= #(300) 1'b1;
end

always @(clk_33M)begin
	clk_33M <= #(25) ~clk_33M;
end


//-------------------------------------------------
// ingress port data generation
//-------------------------------------------------
reg [15:0] pkt_header;
reg ingress_valid, ingress_header;
integer i;
genvar igp;
reg [7:0] sourceID[GSIZE*MWIDTH-1:0];
reg [7:0] pkt_length;
reg [31:0] destIP[GSIZE*MWIDTH-1:0];
reg [GSIZE*MWIDTH*DWIDTH-1:0] ingress_data;
reg [GSIZE*MWIDTH-1:0] egress_stall;

reg [7:0] pkt_cnt;


initial begin
	for(i=0;i<GSIZE*MWIDTH;i=i+1)begin
		sourceID[i] = i;
		destIP[i] = (1 << i) | (1<<(i+1));

	end
	egress_stall = 0;	

end

always@(*)begin
	if(ingress_header)begin
		pkt_header = {pkt_cnt,8'hEF};
	end
	else begin
		pkt_header = {pkt_cnt,8'hCD};
	end
end

always@(posedge clk_80M)begin
	if(clr_80M)begin
		ingress_valid <= 0;
		pkt_length <= 2;
		ingress_header <= 0;
	end
	else begin
		ingress_valid <= 1'b1;
		pkt_length <= 2;
		ingress_header <= ~ingress_header;
	end
end

always@(posedge clk_80M)begin
	if(clr_80M)
		pkt_cnt <= 0;
	else if(ingress_header)
		pkt_cnt <= pkt_cnt + 1;
end

generate
	for(igp = 0; igp < GSIZE * MWIDTH; igp=igp+1)begin : INGRESS_DATA_GEN
		always@(*)begin
			ingress_data[(igp+1)*DWIDTH-1:igp*DWIDTH] = {64'hDDDD,destIP[igp],pkt_length,sourceID[igp],pkt_header};
		end
	end
endgenerate


gsm_sys
#(
	.MWIDTH(MWIDTH),	// multicast width = 4 output ports
	.GSIZE(GSIZE),	// group size, number of gsm_unit in each group
	.DWIDTH(DWIDTH),	// data width = 16 bytes
	.AWIDTH(AWIDTH)	// 2 BRAM = total 512 cells, each port is allocated 128 cells
) gsm_sys_inst
(
	//** global
	.clk_33M(clk_33M),
	.extern_rst_n(extern_rst_n),

	.clk_320M(clk_320M),
	.clk_80M(clk_80M),
	.clr_320M(clr_320M),
	.clr_80M(clr_80M),
	.rst_n(rst_n),
	//** 16 ingress ports
	// group 0
	.i_ingress_valid({SWITCH_SIZE{ingress_valid}}),
	.i_ingress_header({SWITCH_SIZE{ingress_header}}),
	.i_ingress_data(ingress_data),


	//** 16 egress ports
	// group 0
	.i_egress_stall(egress_stall),
	.o_egress_valid(),
	.o_egress_data()

);

endmodule
