// Quartus II Verilog Template
// Sum-of-four multiply-accumulate with asynchronous reset
// For use with the Stratix III device family

module sum_of_four_multiply_accumulate_with_asynchronous_reset
#(parameter INPUT_WIDTH=18, parameter OUTPUT_WIDTH=44)
(
	input clk, ena, aclr,
	input [INPUT_WIDTH-1:0] dataa, datab, datac, datad,
	input [INPUT_WIDTH-1:0] datae, dataf, datag, datah,
	output reg [OUTPUT_WIDTH-1:0] dataout
);

	// Each product can be up to 2*INPUT_WIDTH bits wide.
	// The sum of four of these products can be up to 2 bits wider.
	wire [2*INPUT_WIDTH+1:0] mult_sum;

	// Store the results of the operations on the current inputs
	assign mult_sum = (dataa * datab + datac * datad) + (datae * dataf + datag * datah);

	// Store the value of the accumulation
	always @ (posedge clk)
	begin
		if (ena == 1)
		begin
        	    dataout <= ((aclr == 1) ? 0 : dataout) + mult_sum;
		end
	end
endmodule
