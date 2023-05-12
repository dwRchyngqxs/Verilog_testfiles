module test(input [3:0] a, output [3:0] y, output [3:0] x, output [3:0] co);
\$alu #(
	.A_WIDTH(4), .B_WIDTH(4), .Y_WIDTH(4),
	.A_SIGNED(0), .B_SIGNED(0)
) alu (
	.A(a), .B(4'h0),
	.BI(1'b1), .CI(1'b1),
	.Y(y), .X(x), .CO(co)
);
endmodule
