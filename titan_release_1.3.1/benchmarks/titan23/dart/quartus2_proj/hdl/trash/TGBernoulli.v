`timescale 1ns / 1ps
/* TGBernoulli.v
 * Bernoulli traffic injection engine
 * Injections a packet when 1) rand_wire < threshold
 *                          2) current time >= lag time
 * Spits out a flit every clock cycle if there is a flit
 * to inject and this unit is enabled
 */
`include "../const.v"
module TGBernoulli(
    clock,
    reset,
    enable,
    sim_time,
    measure,            // Approximation: global inject measurement flag
    psize,
    sendto,
    obuf_full,          // Output buffer is full
    rand_below_threshold,
    flit_out,
    ready,
    tick_rng
);
    parameter HADDR = 1;      // Hardware node address
    parameter PSIZE_WIDTH = 10;
    
    input                       clock;
    input                       reset;
    input                       enable;
    input       [`TS_WIDTH-1:0] sim_time;
    input                       measure;
    input     [PSIZE_WIDTH-1:0] psize;
    input     [`ADDR_WIDTH-1:0] sendto;
    input                       obuf_full;
    input                       rand_below_threshold;
    
    output    [`FLIT_WIDTH-1:0] flit_out;
    output                      ready;
    output                      tick_rng;

    // Internal states
    reg        [`TS_WIDTH-1: 0] lag_ts; // Current timestamp of the lagging injection process
    reg      [PSIZE_WIDTH-1: 0] flits_injected;
    
    // Wires
    wire            [ 9: 0] w_src_or_injection;
    wire                    w_not_lagging;
    wire                    w_complete_pkt;

    wire                    w_try_inject_flit;
    wire                    w_inject;
    wire                    w_inject_head;
    wire                    w_inject_normal;
    wire                    w_inject_tail;
    wire                    w_inject_flit;
    
    wire                    w_tick_rng;
    wire                    w_inc_lag_ts;
    
    wire                    w_clear_flits_injected;
    wire  [PSIZE_WIDTH-1:0] w_flits_injected;
    
    // Output
    assign flit_out = {w_inject_head, w_inject_tail, measure, lag_ts, sendto, w_src_or_injection, 5'h0};
    assign ready = w_inject_flit;
    assign tick_rng = w_tick_rng;
    
    assign w_src_or_injection = (w_inject_head) ? HADDR : lag_ts;

    
    // Lagging Injection Process
    
    is_less_than #(.N(`TS_WIDTH)) u0 (.a(sim_time), .b(lag_ts), .a_lt_b(w_not_lagging));
    is_less_than #(.N(PSIZE_WIDTH)) u1 (.a(psize), .b(flits_injected), .a_lt_b(w_complete_pkt));
    
    assign w_try_inject_flit = ~w_not_lagging & ~w_complete_pkt & measure;
    assign w_inject = w_try_inject_flit & (~obuf_full);
    assign w_tick_rng = (flits_injected == 0) ? w_inject : 1'b0;
    
    assign w_inject_head = w_tick_rng & rand_below_threshold;
    assign w_inject_normal = (flits_injected != 0) ? w_inject : 1'b0;
    assign w_inject_tail = (flits_injected == psize) ? w_inject : 1'b0;
    assign w_inject_flit = w_inject_head | w_inject_normal;
    
    assign w_inc_lag_ts = (w_tick_rng & ~rand_below_threshold) | w_inject_tail;
    assign w_clear_flits_injected = w_inject_tail;
    
`ifdef SIMULATION
    always @(*)
    begin
        if (w_try_inject_flit & obuf_full)
            $display ("TG (%u) can't inject. lag_ts 0x%h flits_injected 0x%h", HADDR, lag_ts, flits_injected);
    end
`endif
    
    assign w_flits_injected = flits_injected + w_inject_flit;
    
    // Update states
    always @(posedge clock or posedge reset)
    begin
        if (reset)
        begin
            lag_ts              <= {(`TS_WIDTH){1'b0}};
            flits_injected      <= {(PSIZE_WIDTH){1'b0}};
        end
        else if (enable)
        begin
            if (w_inc_lag_ts)
                lag_ts <= lag_ts + 1;
            
            if (w_clear_flits_injected)
                flits_injected <= 0;
            else
                flits_injected <= w_flits_injected;
        end
    end
   

endmodule
