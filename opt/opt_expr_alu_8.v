module test(input [3:0] a, input [3:0] b, output [5:0] y);
assign y = {a[3:2], 1'b0, a[1:0]} + {b[3:2], 1'b0, b[1:0]};
endmodule
