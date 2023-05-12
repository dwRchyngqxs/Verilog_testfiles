module top(input clk, output reg [1:0] q);
	wire [1:0] x = 2'b10;
	always @(posedge clk)
		q <= x & 2'b11;
endmodule
