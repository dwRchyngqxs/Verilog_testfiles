parameter P = 1;
module example(
    output integer out
);
    assign out = P;
endmodule
module top(
    output integer out
);
    example #(2) e1(out);
endmodule
