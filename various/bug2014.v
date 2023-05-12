module test (
        input signed [1:0] n,
        output [3:0] dout
);
        assign dout = n + 4'sd 4;
endmodule
