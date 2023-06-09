// Quartus II Verilog Template
// Multiplier for complex numbers

module multiplier_for_complex_numbers
#(parameter WIDTH=18)
(
	input clk, ena,
	input signed [WIDTH-1:0] dataa_real, dataa_img,
	input signed [WIDTH-1:0] datab_real, datab_img,
	output reg signed [2*WIDTH-1:0] dataout_real, dataout_img
);

	always @ (posedge clk)
	begin
		if (ena == 1)
		begin
			dataout_real = dataa_real * datab_real - dataa_img * datab_img;
			dataout_img  = dataa_real * datab_img  + datab_real * dataa_img;
		end
	end

endmodule
