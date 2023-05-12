module dsp_shift
#(parameter INPUT_WIDTH=32, parameter OUTPUT_WIDTH=32)
(
	input clk, rotate, shift_right,
	input [INPUT_WIDTH-1:0] dataa, datab,
	output [OUTPUT_WIDTH-1:0] result
);
	dsp_shift_megafn        dsp_shift_megafn_inst (
        .clock0 ( clk ),
        .dataa_0 ( dataa ),
        .datab_0 ( datab ),
        .rotate ( rotate ),
        .shift_right ( shift_right ),
        .result ( result )
	  );

endmodule
