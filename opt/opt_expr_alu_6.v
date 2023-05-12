module test(input [1:0] a, output [3:0] y);
assign y = -{a[1], 2'b10, a[0]};
endmodule
