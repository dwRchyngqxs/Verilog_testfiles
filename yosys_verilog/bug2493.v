module top1;
    wire x;
    generate
        if (1) begin
            mod y();
            assign x = y;
        end
    endgenerate
endmodule
