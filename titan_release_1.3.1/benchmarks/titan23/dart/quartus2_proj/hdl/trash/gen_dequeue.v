`timescale 1ns / 1ps
/* gen_dequeue.v
 * Generate the dequeue signal for double-pumped BRAM output queues
 *
 * Basically make dequeue happen at the 2nd half (neg half) of the clock cycle
 */
module gen_dequeue (
    clock_2x,
    reset,
    dequeue_in,
    dequeue_out
);

    parameter N = 1;
    
    input           clock_2x;
    input           reset;
    input   [N-1:0] dequeue_in;
    output  [N-1:0] dequeue_out;
    
    reg dequeue_cycle;
    
    always @(posedge clock_2x or posedge reset)
    begin
        if (reset)
            dequeue_cycle = 1'b0;
        else
            dequeue_cycle = ~dequeue_cycle;
    end
    
    assign dequeue_out = {(N){dequeue_cycle}} & dequeue_in;
endmodule

