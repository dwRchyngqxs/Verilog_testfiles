module top(input a, b, output [5:0] y);
and (y[0], a, b);
nand (y[1], a, b);
or (y[2], a, b);
nor (y[3], a, b);
xor (y[4], a, b);
xnor (y[5], a, b);
endmodule
