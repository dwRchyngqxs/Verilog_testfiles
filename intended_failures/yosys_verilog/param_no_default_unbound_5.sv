module Example #(
    parameter X, Y = 2
);
endmodule
module top;
    Example #(.Y(1)) e();
endmodule
