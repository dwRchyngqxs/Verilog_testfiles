// Quartus II Verilog Template
// Sum of four multipliers

module sum_of_four_multipliers
#(parameter WIDTH=18)
(
	input clk, ena,
	input [WIDTH-1:0] dataa, datab, datac, datad,
	input [WIDTH-1:0] datae, dataf, datag, datah,
	output reg [2*WIDTH+1:0] dataout
);

	always @ (posedge clk)
	begin
		if (ena == 1)
		begin
			dataout <= (dataa * datab + datac * datad) + (datae * dataf + datag * datah);
		end
	end
endmodule
