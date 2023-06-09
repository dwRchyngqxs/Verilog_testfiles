// Quartus II Verilog Template
// Pipelined binary adder tree

module pipelined_binary_adder_tree
#(parameter WIDTH=16)
(
	input [WIDTH-1:0] A, B, C, D, E,
	input clk,
	output [WIDTH-1:0] out
);

	wire [WIDTH-1:0] sum1, sum2, sum3, sum4;
	reg [WIDTH-1:0] sumreg1, sumreg2, sumreg3, sumreg4;

	always @ (posedge clk)
	begin
		sumreg1 <= sum1;
		sumreg2 <= sum2; 
		sumreg3 <= sum3;
		sumreg4 <= sum4;
	end

	// 2-bit additions
	assign sum1 = A + B;
	assign sum2 = C + D;
	assign sum3 = sumreg1 + sumreg2;
	assign sum4 = sumreg3 + E;
	assign out = sumreg4;

endmodule
