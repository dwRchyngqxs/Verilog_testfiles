module top();

input CLK;
input [1:0] D;
(* init = 32'h55555555 *)
output [31:0] Q;
input SRST;
input ARST;
input [1:0] CLR;
input [1:0] SET;

\$dffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(2)) ff0 (.CLK(CLK), .EN(1'b0), .D(D), .Q(Q[1:0]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff1 (.CLK(CLK), .EN(1'b1), .ARST(ARST), .D(D), .Q(Q[3:2]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff2 (.CLK(CLK), .EN(1'b0), .SRST(SRST), .D(D), .Q(Q[5:4]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff3 (.CLK(CLK), .EN(1'b0), .SRST(SRST), .D(D), .Q(Q[7:6]));
\$dffsre #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff4 (.CLK(CLK), .EN(1'b1), .SET(SET), .CLR(CLR), .D(D), .Q(Q[9:8]));

\$dlatch #(.EN_POLARITY(1'b1), .WIDTH(2)) ff5 (.EN(1'b0), .D(D), .Q(Q[11:10]));
\$adlatch #(.EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff6 (.EN(1'b1), .ARST(ARST), .D(D), .Q(Q[13:12]));
\$dlatchsr #(.EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff7 (.EN(1'b1), .SET(SET), .CLR(CLR), .D(D), .Q(Q[15:14]));

\$dffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(2)) ff8 (.CLK(CLK), .EN(1'bx), .D(D), .Q(Q[17:16]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff9 (.CLK(CLK), .EN(1'bx), .ARST(ARST), .D(D), .Q(Q[19:18]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff10 (.CLK(CLK), .EN(1'bx), .SRST(SRST), .D(D), .Q(Q[21:20]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff11 (.CLK(CLK), .EN(1'bx), .SRST(SRST), .D(D), .Q(Q[23:22]));
\$dffsre #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff12 (.CLK(CLK), .EN(1'bx), .SET(SET), .CLR(CLR), .D(D), .Q(Q[25:24]));

\$dlatch #(.EN_POLARITY(1'b1), .WIDTH(2)) ff13 (.EN(1'bx), .D(D), .Q(Q[27:26]));
\$adlatch #(.EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff14 (.EN(1'bx), .ARST(ARST), .D(D), .Q(Q[29:28]));
\$dlatchsr #(.EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff15 (.EN(1'bx), .SET(SET), .CLR(CLR), .D(D), .Q(Q[31:30]));

endmodule
