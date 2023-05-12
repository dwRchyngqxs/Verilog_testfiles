`timescale 1ns / 1ps
/* Testbench for FlitQueue
 */
`include "../../const.v"

module TrafficGen_tb;
    parameter HADDR = 45;
    parameter LOG_NVCS = 1;
    localparam NVCS = 1 << LOG_NVCS;
    localparam FULL_ADDR_WIDTH = `ADDR_WIDTH + LOG_NVCS;

	// Inputs / Outputs
	reg                             clock;
	reg                             reset;
	reg                             enable;
	reg            [`TS_WIDTH-1: 0] sim_time;
    reg                             sim_time_tick;
    wire                            error;

    // Config interface
    reg                     [15: 0] config_in;
    reg                             config_in_valid;
    wire                    [15: 0] config_out;
    wire                            config_out_valid;

    // Stats interface
    reg                             stats_shift;
    reg                     [15: 0] stats_in;
    wire                    [15: 0] stats_out;

    // Flit interface
    reg           [`FLIT_WIDTH-1:0] flit_in;
    reg                             flit_in_valid;
    reg       [FULL_ADDR_WIDTH-1:0] nexthop_in;
    wire                            flit_ack;

    reg                 [NVCS-1: 0] dequeue;
    wire    [NVCS*`FLIT_WIDTH-1: 0] flit_out;
    wire                [NVCS-1: 0] flit_out_valid;
    reg                             measure;

    import "DPI-C" context task c_init ();
    import "DPI-C" context task test_tg (output reset,
                                         output enable,
                                         output [`TS_WIDTH-1:0] tsim,
                                         output tsim_tick,
                                         output config_in_valid,
                                         output [15: 0] config_in,
                                         output stats_shift,
                                         input [15: 0] hw_stats_out,
                                         output flit_in_valid,
                                         output [`FLIT_WIDTH-1:0] flit_in,
                                         output [FULL_ADDR_WIDTH-1:0] nexthop_in,
                                         output [NVCS-1:0] dequeue,
                                         output measure,
                                         input  hw_flit_ack,
                                         input  [NVCS-1:0] hw_flit_out_valid,
                                         input  [NVCS*`FLIT_WIDTH-1:0] hw_flit_out);

    export "DPI-C" function v_disp;
    function void v_disp (input string s);
    begin
        $display ("%s", s);
    end
    endfunction

    // Unit under test
    TrafficGen #(.HADDR(HADDR), .LOG_NVCS(LOG_NVCS)) uut (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (error),
        .config_in (config_in),
        .config_in_valid (config_in_valid),
        .config_out (config_out),
        .config_out_valid (config_out_valid),
        .stats_shift (stats_shift),
        .stats_in (stats_in),
        .stats_out (stats_out),
        .flit_in (flit_in),
        .flit_in_valid (flit_in_valid),
        .nexthop_in (nexthop_in),
        .flit_ack (flit_ack),
        .flit_out (flit_out),
        .flit_out_valid (flit_out_valid),
        .dequeue (dequeue),
        .measure (measure));
    
    initial begin
        clock = 0;
        reset = 0;

        enable = 0;
        sim_time = 0;
        sim_time_tick = 0;
        config_in = 0;
        config_in_valid = 0;
        stats_shift = 0;
        stats_in = 0;
        flit_in = 0;
        flit_in_valid = 0;
        nexthop_in = 0;
        dequeue = 0;
        measure = 0;
        
        c_init ();
        v_disp ("After initialization");
    end

    always #5 clock = ~clock;

    always @(posedge clock)
    begin
        #1 test_tg (reset, enable, sim_time, sim_time_tick,
                 config_in_valid, config_in, stats_shift, stats_out,
                 flit_in_valid, flit_in, nexthop_in, dequeue, measure,
                 flit_ack, flit_out_valid, flit_out);
    end

endmodule

