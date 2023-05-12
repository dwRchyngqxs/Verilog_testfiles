module prim_test(input [7:0] a, b, output [7:0] q);
	AND and_i (.A(a), .B(b), .Y(q));
endmodule
