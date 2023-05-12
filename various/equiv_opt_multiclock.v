module top(input clk, pre, d, output reg q);
	always @(posedge clk, posedge pre)
		if (pre)
			q <= 1'b1;
		else
			q <= d;
endmodule
