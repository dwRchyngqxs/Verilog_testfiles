module top(x);
    generate
        if (1) begin : blk
            output wire x;
            assign x = 1;
        end
    endgenerate
    output wire x;
endmodule
