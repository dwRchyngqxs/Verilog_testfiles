module RAM_LUT(
	input [3:0] PORT_R_ADDR,
	input [3:0] PORT_RW_ADDR,
	input PORT_RW_CLK,
	input PORT_RW_WR_EN,
	input [3:0] PORT_RW_WR_DATA,
	output [3:0] PORT_R_RD_DATA,
	output [3:0] PORT_RW_RD_DATA
);

parameter INIT = 0;
parameter OPTION_INIT = "UNDEFINED";
parameter PORT_RW_CLK_POL = 1;

reg [3:0] mem [0:15];

integer i;
initial
	for (i = 0; i < 16; i += 1)
		case (OPTION_INIT)
		"NONE": mem[i] = mem[i]; //?
		"ZERO": mem[i] = 4'h0;
		"ANY": mem[i] = INIT[i*4+:4];
		"NO_UNDEF": mem[i] = INIT[i*4+:4];
		"UNDEFINED": mem[i] = 4'hx;
		endcase

assign PORT_R_RD_DATA = mem[PORT_R_ADDR];
assign PORT_RW_RD_DATA = mem[PORT_RW_ADDR];

wire CLK = PORT_RW_CLK ~^ PORT_RW_CLK_POL;

always @(posedge CLK)
	if (PORT_RW_WR_EN)
		mem[PORT_RW_ADDR] <= PORT_RW_WR_DATA;

endmodule
