`timescale 1ns / 1ps
/* Testbench for FlitQueue
 */
`include "../../const.v"

module sim_tb;
    parameter HADDR = 45;
    parameter LOG_NVCS = 1;
    localparam NVCS = 1 << LOG_NVCS;

	// Inputs / Outputs
    reg                     clock;
    reg                     clock_2x;
    reg                     reset;
    reg                     enable;
    
    wire                    sim_time_tick;
    wire    [`TS_WIDTH-1:0] sim_time;
    wire                    error;
    wire                    quiescent;

    // Configuration and stats interfaces
    reg             [15: 0] config_in;
    reg                     config_in_valid;
    wire            [15: 0] config_out;
    wire                    config_out_valid;

    reg                     stats_shift;
    wire            [15: 0] stats_out;

    import "DPI-C" context task c_init ();
    import "DPI-C" context task test_sim (  output reset,
                                            output enable,
                                            output config_in_valid,
                                            output [15:0] config_in,
                                            output stats_shift,
                                            input  [15:0] stats_out,
                                            input  quiescent,
                                            input [9:0] sim_time);

    export "DPI-C" function v_disp;
    function void v_disp (input string s);
    begin
        $display ("%s", s);
    end
    endfunction

    // 9-node (9x4 interconnect) simulator
    sim9_8x8 sim (
        .clock (clock),
        .clock_2x (clock_2x),
        .reset (reset),
        .enable (enable),
        .stop_injection (1'b0),
        .measure (1'b1),
        .sim_time_tick (sim_time_tick),
        .sim_time (sim_time),
        .error (error),
        .quiescent (quiescent),
        .config_in (config_in),
        .config_in_valid (config_in_valid),
        .config_out (config_out),
        .config_out_valid (config_out_valid),
        .stats_out (stats_out),
        .stats_shift (stats_shift));

    
    // Testbench setup
    initial begin
        clock = 0;
        clock_2x = 1;
        reset = 0;
        enable = 0;
        
        config_in = 0;
        config_in_valid = 0;
        stats_shift = 0;

        c_init ();
        v_disp ("After initialization");
    end

    always #10 clock = ~clock;
    always #5 clock_2x = ~clock_2x;

    always @(posedge clock)
    begin
        #1 test_sim (
            .reset (reset),
            .enable (enable),
            .config_in_valid (config_in_valid),
            .config_in (config_in),
            .stats_shift (stats_shift),
            .stats_out (stats_out),
            .quiescent (quiescent),
            .sim_time (sim_time));
    end

endmodule

