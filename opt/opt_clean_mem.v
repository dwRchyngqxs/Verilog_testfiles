module top();

input [7:0] wa;
input [7:0] ra1;
input [7:0] ra2;
input [7:0] wd;
input clk;
wire [7:0] rd1;
wire [7:0] rd2;

reg [7:0] mem[0:7];

always @(posedge clk)
	mem[wa] <= wd;
assign rd1 = mem[ra1];
assign rd2 = mem[ra2];

initial mem[8'h12] = 8'h34;

endmodule
