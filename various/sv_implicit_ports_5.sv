module add(input [7:0] a, input [7:0] b, output [7:0] q);
assign q = a + b;
endmodule

module top(input [7:0] a, output [7:0] q);
	add add_i(.*);
endmodule
