module test(input [3:0] a, input [2:0] b, output [5:0] y);
assign y = {a[3:2], 1'b1, a[1:0]} + {b[2], 2'b11, b[1:0]};
endmodule
