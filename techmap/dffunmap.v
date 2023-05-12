module top();

input C, R, E, S;
input [1:0] D;
output [17:0] Q;

\$dff #(.CLK_POLARITY(1'b0), .WIDTH(2)) ff0 (.CLK(C), .D(D), .Q(Q[1:0]));
\$dffe #(.CLK_POLARITY(1'b0), .EN_POLARITY(1'b0), .WIDTH(2)) ff1 (.CLK(C), .EN(E), .D(D), .Q(Q[3:2]));
\$sdff #(.CLK_POLARITY(1'b0), .WIDTH(2), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2)) ff2 (.CLK(C), .SRST(R), .D(D), .Q(Q[5:4]));
\$sdffe #(.CLK_POLARITY(1'b0), .EN_POLARITY(1'b1), .WIDTH(2), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2)) ff3 (.CLK(C), .EN(E), .SRST(R), .D(D), .Q(Q[7:6]));
\$sdffce #(.CLK_POLARITY(1'b0), .EN_POLARITY(1'b1), .WIDTH(2), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2)) ff4 (.CLK(C), .EN(E), .SRST(R), .D(D), .Q(Q[9:8]));
\$adff #(.CLK_POLARITY(1'b0), .WIDTH(2), .ARST_POLARITY(1'b0), .ARST_VALUE(2'h2)) ff5 (.CLK(C), .ARST(R), .D(D), .Q(Q[11:10]));
\$adffe #(.CLK_POLARITY(1'b0), .EN_POLARITY(1'b1), .WIDTH(2), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2)) ff6 (.CLK(C), .EN(E), .ARST(R), .D(D), .Q(Q[13:12]));
\$dffsr #(.CLK_POLARITY(1'b0), .WIDTH(2), .CLR_POLARITY(1'b0), .SET_POLARITY(1'b1)) ff7 (.CLK(C), .CLR({R, S}), .SET({S, R}), .D(D), .Q(Q[15:14]));
\$dffsre #(.CLK_POLARITY(1'b0), .EN_POLARITY(1'b1), .WIDTH(2), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0)) ff8 (.CLK(C), .EN(E), .CLR({R, R}), .SET({S, S}), .D(D), .Q(Q[17:16]));

endmodule
