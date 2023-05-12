module sum_of_four_multiply_accumulate_chainout
#(parameter INPUT_WIDTH=18, parameter OUTPUT_WIDTH=44)
(
	input clk,
	input [INPUT_WIDTH-1:0] dataa, datab, datac, datad,
	input [INPUT_WIDTH-1:0] datae, dataf, datag, datah,
	output [OUTPUT_WIDTH-1:0] dataout
	
	
);

	wire [OUTPUT_WIDTH-1:0] chain_intermediate;
	
	mult_accum_chain        mult_accum_chain_inst0 (
        .chainin (/*unconnected*/),
        .clock0 ( clk ),
        .dataa_0 ( dataa),
        .dataa_1 ( datab),
        .dataa_2 ( datac),
        .dataa_3 ( datad),
        .datab_0 ( datae),
        .datab_1 ( dataf),
        .datab_2 ( datag),
        .datab_3 ( datah),
        .result ( chain_intermediate )
   );
	
	mult_accum_chain        mult_accum_chain_inst1 (
        .chainin ( chain_intermediate ),
        .clock0 ( clk ),
        .dataa_0 ( datae),
        .dataa_1 ( datab),
        .dataa_2 ( datah),
        .dataa_3 ( datad),
        .datab_0 ( dataa),
        .datab_1 ( dataf),
        .datab_2 ( datag),
        .datab_3 ( datac),
        .result ( dataout)
   );

endmodule
