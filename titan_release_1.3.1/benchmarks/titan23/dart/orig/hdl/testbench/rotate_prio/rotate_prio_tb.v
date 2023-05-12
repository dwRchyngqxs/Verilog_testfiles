`timescale 1ns / 1ps
/* Testbench for rotate_prio.v
 */
module rotate_prio_tb;

    parameter SIZE = 10;

    reg             [SIZE-1: 0] in_valid;
    reg   [CLogB2(SIZE-1)-1: 0] prio;
    wire            [SIZE-1: 0] out_sel;

    // Unit under test
    rotate_prio #(.SIZE(SIZE)) uut (
        .in_valid (in_valid),
        .prio (prio),
        .out_sel (out_sel));

    // Ceil of log base 2
    function integer CLogB2;
        input   [31:0] size;
        integer i;
        begin
            i = size;
            for (CLogB2 = 0; i > 0; CLogB2 = CLogB2 + 1)
                i = i >> 1;
        end
    endfunction

    initial begin
        in_valid = 0;
        prio = 0;

        #10 in_valid = 10'b0000111101;
        
        #10 prio = 1;
        #10 prio = 2;
        #10 prio = 3;
        #10 prio = 4;
        #10 prio = 5;
        #10 prio = 6;
        #10 prio = 7;
        #10 prio = 8;
        #10 prio = 9;
        #10 prio = 10;
    end
endmodule
