module top #(
	parameter [31:0] X = 0
) (
	input [31:0] din,
	output [31:0] dout
);
	assign dout = X-din;
	always @* assert (dout != 123456789);
endmodule
