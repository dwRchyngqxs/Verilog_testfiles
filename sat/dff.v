module top();

input C, D, R, E;
output [4:0] Q;

\$dff #(.WIDTH(1), .CLK_POLARITY(1'b1)) ff0 (.CLK(C), .D(D), .Q(Q[0]));
\$dffe #(.WIDTH(1), .CLK_POLARITY(1'b1), .EN_POLARITY(1'b1)) ff1 (.CLK(C), .D(D), .EN(E), .Q(Q[1]));
\$sdff #(.WIDTH(1), .CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(1'b0)) ff2 (.CLK(C), .D(D), .SRST(R), .Q(Q[2]));
\$sdffe #(.WIDTH(1), .CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(1'b0), .EN_POLARITY(1'b1)) ff3 (.CLK(C), .D(D), .EN(E), .SRST(R), .Q(Q[3]));
\$sdffce #(.WIDTH(1), .CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(1'b0), .EN_POLARITY(1'b1)) ff4 (.CLK(C), .D(D), .EN(E), .SRST(R), .Q(Q[4]));

endmodule
