module top();

input EN;
input [1:0] D;
(* init = 18'h15555 *)
output [17:0] Q;
input SRST;
input ARST;
input [1:0] CLR;
input [1:0] SET;

\$dff #(.CLK_POLARITY(1'b1), .WIDTH(2)) ff0 (.CLK(1'b0), .D(D), .Q(Q[1:0]));
\$dffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(2)) ff1 (.CLK(1'b1), .EN(EN), .D(D), .Q(Q[3:2]));
\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff2 (.CLK(1'bx), .ARST(ARST), .D(D), .Q(Q[5:4]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff3 (.CLK(1'b0), .EN(EN), .ARST(ARST), .D(D), .Q(Q[7:6]));
\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff4 (.CLK(1'b1), .SRST(SRST), .D(D), .Q(Q[9:8]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff5 (.CLK(1'bx), .EN(EN), .SRST(SRST), .D(D), .Q(Q[11:10]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff6 (.CLK(1'bx), .EN(EN), .SRST(SRST), .D(D), .Q(Q[13:12]));
\$dffsr #(.CLK_POLARITY(1'b1), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff7 (.CLK(1'b1), .SET(SET), .CLR(CLR), .D(D), .Q(Q[15:14]));
\$dffsre #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff8 (.CLK(1'bx), .EN(EN), .SET(SET), .CLR(CLR), .D(D), .Q(Q[17:16]));

endmodule
