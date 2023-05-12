module test (a, b, c, y);
    input a;
    input signed [1:0] b;
    input signed [2:0] c;
    output y;
    assign #(12.5, 14.5) y = ^(a ? b : c);
endmodule
