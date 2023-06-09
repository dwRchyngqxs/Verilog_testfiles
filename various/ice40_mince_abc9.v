module top(input clk, ce, input [2:0] a, b, output reg [2:0] q);

	reg [2:0] aa, bb;

	always @(posedge clk) begin
		if (ce) begin
			aa <= a;
		end
		bb <= b;
		q <= aa + bb;
	end
endmodule
