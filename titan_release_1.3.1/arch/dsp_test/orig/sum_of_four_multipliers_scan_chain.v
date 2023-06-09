// Quartus II Verilog Template
// Sum of four multipliers in scan chain mode

module sum_of_four_multipliers_scan_chain
#(parameter WIDTH=18)
(
	input clk, ena,
	input [WIDTH-1:0] dataa, 
	input [WIDTH-1:0] datab0, datab1, datab2, datab3,
	output reg [2*WIDTH+1:0] dataout
);

	// Four scan chain registers
	reg [WIDTH-1:0] a0, a1, a2, a3;

	always @ (posedge clk)
	begin
		if (ena == 1)
		begin

			// The scan chain (which mimics the behavior of a shift register)
			a0 <= dataa;
			a1 <= a0;
			a2 <= a1;
			a3 <= a2;

			// The order of the operands is important for correct inference
			dataout <= (a3 * datab3 + a2 * datab2) + (a1 * datab1 + a0 * datab0);
		end
	end
endmodule
