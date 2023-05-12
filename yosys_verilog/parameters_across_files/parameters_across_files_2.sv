parameter P = Q;
module top(
    output integer out
);
    assign out = P;
    always @*
        assert (out == 1);
endmodule
