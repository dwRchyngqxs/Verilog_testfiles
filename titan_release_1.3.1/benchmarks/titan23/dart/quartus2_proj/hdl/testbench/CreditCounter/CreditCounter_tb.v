`timescale 1ns / 1ps
/* Testbench for CreditCounter
 */
module CreditCounter_tb;
    parameter WIDTH = 4;        // Width of credit counter

    reg             clock;
    reg             reset;
    reg             enable;
    reg             sim_time_tick;

    reg    [WIDTH-1: 0] config_in;
    reg                 config_in_valid;
    wire   [WIDTH-1: 0] config_out;
    wire                config_out_valid;

    reg                 credit_in_valid;
    wire                credit_ack;

    reg                 decrement;
    wire   [WIDTH-1: 0] count_out;

    // Unit-under-test
    CreditCounter #(.WIDTH(WIDTH)) uut (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .sim_time_tick (sim_time_tick),
        .config_in (config_in),
        .config_in_valid (config_in_valid),
        .config_out (config_out),
        .config_out_valid (config_out_valid),
        .credit_in_valid (credit_in_valid),
        .credit_ack (credit_ack),
        .decrement (decrement),
        .count_out (count_out));

    initial begin
        clock = 0;
        reset = 0;
        enable = 0;
        sim_time_tick = 0;
        config_in = 0;
        config_in_valid = 0;
        credit_in_valid = 0;
        decrement = 0;

        #1 reset = 1;
        #20 reset = 0;

        #20 // Start configuration
        config_in_valid = 1;
        config_in = 4'h5;
        #10
        config_in_valid = 0;
        #10 enable = 1;

        // Use credit
        #10 decrement = 1;
        #10 decrement = 1;
        #10 decrement = 1;
        #10 decrement = 0;

        // Add credit
        #10 credit_in_valid = 1;
        #10 credit_in_valid = 1;
        #10 credit_in_valid = 0;
        sim_time_tick = 1;
        #10 sim_time_tick = 0;

        // Add and use at the same time
        #10 credit_in_valid = 1; decrement = 1;
        #10 credit_in_valid = 0;
        #10 decrement = 0;
        
        #10 sim_time_tick = 1;
        #10 sim_time_tick = 0;

    end

    always #5 clock = ~clock;

endmodule

