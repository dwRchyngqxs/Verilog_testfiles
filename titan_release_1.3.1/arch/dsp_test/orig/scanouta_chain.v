module scanouta_chain
#(parameter INPUT_WIDTH=18, parameter OUTPUT_WIDTH=44)
(
	input clk,
	input [INPUT_WIDTH-1:0] dataa, datab, datac, datad, datae,
	output [OUTPUT_WIDTH-1:0] dataout,
	output [INPUT_WIDTH-1:0] shiftouta
);

	scanout_chain_megafn    scanout_chain_megafn_inst (
        .clock0 ( clk ),
        .dataa_0 ( dataa ),
        .datab_0 ( datab ),
        .datab_1 ( datac ),
        .datab_2 ( datad ),
        .datab_3 ( datate ),
        .result ( dataout ),
        .shiftouta ( shiftouta )
	);


endmodule
