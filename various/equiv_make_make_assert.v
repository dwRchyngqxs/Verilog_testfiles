module gold(
	input wire [7:0] a,
	input wire [7:0] b,
	output wire [7:0] c
);

wire [7:0] b_neg;
assign b_neg = -b;
assign c = a + b_neg;
endmodule

module gate(
	input wire [7:0] a,
	input wire [7:0] b,
	output wire [7:0] c
);

wire [7:0] b_neg;
assign b_neg = ~b + 1;
assign c = a + b_neg;
endmodule
