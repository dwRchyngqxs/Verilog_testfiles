module top;
    wire x, y;
    always @*
        x: assert(y == 1);
endmodule
