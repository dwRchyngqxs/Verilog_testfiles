module add #(parameter N=3) (input [N-1:0] a, input [N-1:0] b, output [N-1:0] q);
assign q = a + b;
endmodule

module top(input [7:0] a, output [7:0] q);
	add #(.N(8)) add_i(.*);
endmodule
