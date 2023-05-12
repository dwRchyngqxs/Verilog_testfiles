`timescale 1ns / 1ps
/* RAMFIFO_wrapper.v
 * Wrapper for RAMFIFO.v to measure post PAR resource utilization
 * because otherwise MAP packs output registers into IOs
 */
module RAMFIFO_wrapper(
    clock,
    reset,
    wctx_id,
    rctx_id,
    data_in,
    data_out,
    write,
    read,
    full,
    empty    
);
    parameter WIDTH = 36;
    parameter LOG_DEP = 6;
    parameter LOG_CTX = 3;
    localparam DEPTH = 1 << LOG_DEP;
    localparam NUM_CTX = 1 << LOG_CTX;
    
    input                       clock;
    input                       reset;
    input         [LOG_CTX-1:0] wctx_id;
    input         [LOG_CTX-1:0] rctx_id;
    input           [WIDTH-1:0] data_in;
    input                       write;
    input                       read;
    
    output          [WIDTH-1:0] data_out;
    output                      full;
    output                      empty;
    
    wire    [NUM_CTX*WIDTH-1:0] w_dout_all;
    wire          [NUM_CTX-1:0] w_full_all;
    wire          [NUM_CTX-1:0] w_empty_all;
    
    mux_Nto1 #(.WIDTH(WIDTH), .SIZE(NUM_CTX)) dout_mux (
        .in (w_dout_all),
        .sel (wctx_id),
        .out (data_out));
    
    mux_Nto1 #(.WIDTH(1), .SIZE(NUM_CTX)) full_mux (
        .in (w_full_all),
        .sel (rctx_id),
        .out (full));
        
    mux_Nto1 #(.WIDTH(1), .SIZE(NUM_CTX)) empty_mux (
        .in (w_empty_all),
        .sel (rctx_id),
        .out (empty));

    RAMFIFO #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP), .LOG_CTX(LOG_CTX)) ut (
            .clock (clock),
            .reset (reset),
            .wcc_id (wctx_id),
            .rcc_id (rctx_id),
            .data_in (data_in),
            .data_out (w_dout_all),
            .write (write),
            .read (read),
            .full (w_full_all),
            .empty (w_empty_all));

endmodule
