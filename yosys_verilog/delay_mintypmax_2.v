module test (input [7:0] a, b, c, d, output [7:0] x, y, z);
    assign #(20:20:25) x = a + b, y = b + c, z = c + d;
endmodule
