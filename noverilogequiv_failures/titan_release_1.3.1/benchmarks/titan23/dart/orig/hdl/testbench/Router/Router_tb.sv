`timescale 1ns / 1ps
/* Testbench for FlitQueue
 */
`include "../../const.v"
`include "../../math.h"

module Router_tb;
    parameter HADDR = 45;
    parameter NPORTS = 5;
    parameter NVCS = 2;

    localparam LOG_NPORTS = CLogB2(NPORTS-1);
    localparam LOG_NVCS = CLogB2(NVCS-1);
    localparam NINPUTS = NPORTS * NVCS;

	// Inputs / Outputs
	reg                             clock;
	reg                             reset;
	reg                             enable;
	reg            [`TS_WIDTH-1: 0] sim_time;
    reg                             sim_time_tick;
    wire                            error;
    wire                            is_quiescent;
    wire                            can_increment;

    // RAM config interface
    wire                    [15: 0] ram_config_out;
    wire                            ram_config_out_valid;

    // Config interface
    reg                     [15: 0] config_in;
    reg                             config_in_valid;
    wire                    [15: 0] config_out;
    wire                            config_out_valid;

    // Flit interface
    reg  [`FLIT_WIDTH*NINPUTS-1: 0] flit_in;
    reg              [NINPUTS-1: 0] flit_in_valid;
    wire             [NINPUTS-1: 0] flit_ack;

    wire         [`FLIT_WIDTH-1: 0] flit_out;
    wire                            flit_out_valid;
    wire            [`A_WIDTH-1: 0] nexthop_out;
    reg                             dequeue;

    // Credit interface
    reg     [`CREDIT_WIDTH*NPORTS-1: 0] credit_in;
    reg                   [NPORTS-1: 0] credit_in_valid;
    wire                  [NPORTS-1: 0] credit_ack;

    wire           [`CREDIT_WIDTH-1: 0] credit_out;
    wire                                credit_out_valid;
    wire                [`A_WIDTH-1: 0] credit_out_nexthop;
    reg                                 credit_dequeue;

    // Routing table interface
    wire             [`ADDR_WIDTH-1: 0] rtable_dest;
    wire              [LOG_NPORTS-1: 0] rtable_oport;
    

    import "DPI-C" context task c_init ();
    import "DPI-C" context task test    (output reset,
                                         output enable,
                                         output [`TS_WIDTH-1:0] tsim,
                                         output tsim_tick,
                                         output config_in_valid,
                                         output [15: 0] config_in,
                                         
                                         output [`FLIT_WIDTH*NINPUTS-1:0] flit_in,
                                         output [NINPUTS-1:0] flit_in_valid,
                                         input flit_ack,

                                         input [`FLIT_WIDTH-1:0] flit_out,
                                         input flit_out_valid,
                                         input [`A_WIDTH-1:0] nexthop_out,
                                         output dequeue,

                                         output [`CREDIT_WIDTH*NPORTS-1:0] credit_in,
                                         output [NPORTS-1:0] credit_in_valid,
                                         input credit_ack,

                                         input [`CREDIT_WIDTH-1:0] credit_out,
                                         input credit_out_valid,
                                         input [`A_WIDTH-1:0] credit_out_nexthop,
                                         output credit_dequeue);

    export "DPI-C" function v_disp;
    function void v_disp (input string s);
    begin
        $display ("%s", s);
    end
    endfunction

    wire    [15: 0] w_rtable_ram_config_in;
    wire            w_rtable_ram_config_in_valid;

    // Unit under test
    Router #(.HADDR(HADDR), .NPORTS(NPORTS), .NVCS(NVCS)) uut (
        .clock (clock),
        .clock_2x (1'b0),
        .reset (reset),
        .enable (enable),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (error),
        .is_quiescent (is_quiescent),
        .can_increment (can_increment),
        .ram_config_in (config_in),
        .ram_config_in_valid (config_in_valid),
        .ram_config_out (w_rtable_ram_config_in),
        .ram_config_out_valid (w_rtable_ram_config_in_valid),
        .config_in (config_in),
        .config_in_valid (config_in_valid),
        .config_out (config_out),
        .config_out_valid (config_out_valid),
        .flit_in (flit_in),
        .flit_in_valid (flit_in_valid),
        .flit_ack (flit_ack),
        .flit_out (flit_out),
        .flit_out_valid (flit_out_valid),
        .nexthop_out (nexthop_out),
        .dequeue (dequeue),
        .credit_in (credit_in),
        .credit_in_valid (credit_in_valid),
        .credit_ack (credit_ack),
        .credit_out (credit_out),
        .credit_out_valid (credit_out_valid),
        .credit_out_nexthop (credit_out_nexthop),
        .credit_dequeue (credit_dequeue),
        .rtable_dest (rtable_dest),
        .rtable_oport (rtable_oport));

    // Routing Table
    wire [`ADDR_WIDTH-LOG_NPORTS:0] w_temp;
    RoutingTable_single rtable (
        .clock (clock),
        .reset (reset),
        .enable (enable | w_rtable_ram_config_in_valid),
        .ram_config_in (w_rtable_ram_config_in),
        .ram_config_in_valid (w_rtable_ram_config_in_valid),
        .ram_config_out (ram_config_out),
        .ram_config_out_valid (ram_config_out_valid),
        .dest_ina (rtable_dest),
        .nexthop_outa ({w_temp, rtable_oport}),
        .dest_inb (8'h00),
        .nexthop_outb ());

    initial begin
        clock = 0;
        reset = 0;

        c_init ();
        v_disp ("After initialization");
    end

    always #5 clock = ~clock;

    always @(posedge clock)
    begin
        #1;
        test    ( .reset (reset),
                  .enable (enable),
                  .tsim (sim_time),
                  .tsim_tick (sim_time_tick),
                  .config_in (config_in),
                  .config_in_valid (config_in_valid),

                  .flit_in (flit_in),
                  .flit_in_valid (flit_in_valid),
                  .flit_ack (flit_ack),

                  .flit_out (flit_out),
                  .flit_out_valid (flit_out_valid),
                  .nexthop_out (nexthop_out),
                  .dequeue (dequeue),

                  .credit_in (credit_in),
                  .credit_in_valid (credit_in_valid),
                  .credit_ack (credit_ack),

                  .credit_out (credit_out),
                  .credit_out_valid (credit_out_valid),
                  .credit_out_nexthop (credit_out_nexthop),
                  .credit_dequeue (credit_dequeue));
    end

endmodule

