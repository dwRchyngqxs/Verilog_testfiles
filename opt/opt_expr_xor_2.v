module top(input a, output [1:0] y);
\$_XNOR_ u0(.A(a), .B(1'b0), .Y(y[0]));
\$_XNOR_ u1(.A(1'b1), .B(a), .Y(y[1]));
endmodule
