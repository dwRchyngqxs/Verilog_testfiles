module two_mult_loopback
#(parameter INPUT_WIDTH=18, parameter OUTPUT_WIDTH=36)
(
	input clk,
	input [INPUT_WIDTH-1:0] dataa, datab, datac,
	output [OUTPUT_WIDTH-1:0] dataout
);

	mult_loopback   mult_loopback_inst (
        .clock0 ( clk ),
        .dataa_0 ( dataa),
        .dataa_1 ( datab),
        .datab_1 ( datac),
        .result ( dataout)
   );

endmodule
