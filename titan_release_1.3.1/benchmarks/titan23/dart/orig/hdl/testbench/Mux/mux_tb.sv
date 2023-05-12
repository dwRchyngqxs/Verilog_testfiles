`timescale 1ns / 1ps
/* Testbench for mux_Nto1.v and mux_Nto1_decoded.v
 */
module mux_tb;

    // Try 4-bit 8-to-1 mux

	// Inputs
    reg             [31: 0] in;
    reg             [ 2: 0] esel;
    wire            [ 7: 0] dsel;

	// Outputs
    wire     [ 1: 0][ 3: 0] mux_out;

    
    // Decoder
    decoder_N #(.LOG_SIZE(3)) test_dec (
        .encoded (esel),
        .decoded (dsel));

    // Encoded 8-to-1 MUX
    mux_Nto1 #(.SIZE(8)) muxe (
        .in (in),
        .sel (esel),
        .out (mux_out[0]));

    // Decoded 8-to-1 MUX
    mux_Nto1_decoded #(.SIZE(8)) muxd (
        .in (in),
        .sel (dsel),
        .out (mux_out[1]));

    integer i;
    initial begin
        in = 32'hABCDEF12;
        
        for (i = 0; i < 8; i = i + 1)
        begin
            #20 esel = i;
        end
    end

endmodule
