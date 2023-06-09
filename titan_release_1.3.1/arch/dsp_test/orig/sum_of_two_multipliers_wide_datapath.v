// Quartus II Verilog Template
// Sum of two multipliers with a wide datapath

module sum_of_two_multipliers_wide_datapath
#(parameter WIDTH_A=36, WIDTH_B=18)
(
	input clk, ena,
	input [WIDTH_A-1:0] a0, a1,
	input [WIDTH_B-1:0] b0, b1,
	output reg [WIDTH_A+WIDTH_B:0] dataout
);

	always @ (posedge clk)
	begin
		if (ena == 1)
		begin
			dataout <= a0 * b0 + a1 * b1;
		end
	end
endmodule
