`default_nettype none
module top1;
    wire x;
    generate
        if (1) wire y;
    endgenerate
    assign x = y;
endmodule
