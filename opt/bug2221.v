module test (
        input [1:0] a,
        input [1:0] b,
        output [5:0] y
);

wire [5:0] aa = {a, 4'h0};
wire [5:0] bb = {b, 4'h0};

assign y = aa * bb;

endmodule
