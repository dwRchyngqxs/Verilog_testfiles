module top();

input [3:0] ra;
input [3:0] wa;

input [15:0] wd;
output [15:0] rd;
input en, clk;

reg [15:0] mem[3:9];

always @(posedge clk)
	if (en)
		mem[wa] <= wd;

assign rd = mem[ra];

endmodule
