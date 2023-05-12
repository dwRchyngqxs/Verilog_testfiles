`timescale 1ns / 1ps
/* Testbench for FlitQueue
 */
`include "../../const.v"

module FlitQueue_tb;
    parameter HADDR = 45;
    parameter LOG_NVCS = 1;
    localparam NVCS = 1 << LOG_NVCS;

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

    // Flit interface (1 in, NVCS out)
    wire                [NVCS-1: 0] flit_full;
    reg           [`FLIT_WIDTH-1:0] flit_in;
    reg                             flit_in_valid;
    reg                             test;
    reg           [`ADDR_WIDTH-1:0] nexthop_in;
    wire                            flit_ack;

    wire     [NVCS*`FLIT_WIDTH-1:0] flit_out;
    wire                [NVCS-1: 0] flit_out_valid;
    reg                 [NVCS-1: 0] dequeue;

    // Credit interface (1 in, 1 out)
    wire                            credit_full;
    reg         [`CREDIT_WIDTH-1:0] credit_in;
    reg                             credit_in_valid;
    reg           [`ADDR_WIDTH-1:0] credit_nexthop_in;
    wire                            credit_ack;

    wire        [`CREDIT_WIDTH-1:0] credit_out;
    wire                            credit_out_valid;
    reg                             credit_dequeue;

    import "DPI-C" context task c_init ();
    import "DPI-C" context task test_fq (output reset,
                                         output enable,
                                         output [`TS_WIDTH-1:0] tsim,
                                         output tsim_tick,
                                         output config_in_valid,
                                         output [15: 0] config_in,
                                         output flit_in_valid,
                                         output [`FLIT_WIDTH-1:0] flit_in,
                                         output [`ADDR_WIDTH-1:0] nexthop_in,
                                         output [NVCS-1:0] dequeue,
                                         input hw_flit_ack,
                                         input [NVCS-1:0] hw_flit_out_valid,
                                         input [NVCS*`FLIT_WIDTH-1:0] hw_flit_out);
    import "DPI-C" context function void check_fq (
                                        input flit_ack,
                                        input [NVCS-1:0] hw_flit_out_valid);

    export "DPI-C" function v_disp;
    function void v_disp (input string s);
    begin
        $display ("%s", s);
    end
    endfunction

    // Unit under test
    FlitQueue #(.HADDR(HADDR), .LOG_NVCS(LOG_NVCS)) uut (
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
        .flit_full (flit_full),
        .flit_in_valid (flit_in_valid),
        .flit_in (flit_in),
        .nexthop_in (nexthop_in),
        .flit_ack (flit_ack),
        .flit_out (flit_out),
        .flit_out_valid (flit_out_valid),
        .dequeue (dequeue),
        .credit_full (credit_full),
        .credit_in (credit_in),
        .credit_in_valid (credit_in_valid),
        .credit_nexthop_in (credit_nexthop_in),
        .credit_out (credit_out),
        .credit_out_valid (credit_out_valid),
        .credit_dequeue (credit_dequeue),
        .credit_ack (credit_ack));

    
    initial begin
        clock = 0;
        reset = 0;
        
        credit_in = 0;
        credit_in_valid = 0;
        credit_nexthop_in = 0;
        credit_dequeue = 0;

        c_init ();
        v_disp ("After initialization");
    end

    always #5 clock = ~clock;

    always @(posedge clock)
    begin
        test_fq (reset, enable, sim_time, sim_time_tick, config_in_valid, config_in, 
                 flit_in_valid, flit_in, nexthop_in, dequeue,
                 flit_ack, flit_out_valid, flit_out);
    end

endmodule

