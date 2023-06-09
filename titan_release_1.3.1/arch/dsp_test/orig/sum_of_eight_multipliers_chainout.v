// Quartus II Verilog Template
// Sum of eight multipliers in chainout mode

module sum_of_eight_multipliers_chainout
#(parameter WIDTH=18)
(
	input clk, ena,
	input [WIDTH-1:0] a0, a1, a2, a3, a4, a5, a6, a7,
	input [WIDTH-1:0] b0, b1, b2, b3, b4, b5, b6, b7,
	output reg [2*WIDTH+1:0] dataout
);

	// Declare wires
	wire [2*WIDTH+1:0] sum1, sum2;

	// Store the results of the first two sums
	assign	sum1 = (a0 * b0 + a1 * b1) + (a2 * b2 + a3 * b3);
	assign	sum2 = (a4 * b4 + a5 * b5) + (a6 * b6 + a7 * b7);

	always @ (posedge clk)
	begin
		if (ena == 1)
		begin
			dataout <= sum1 + sum2;
		end
	end
endmodule 
