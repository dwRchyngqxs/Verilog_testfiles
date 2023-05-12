module top();

input CLK;
input NE, NS;
input EN;
output [17:0] Q;
input [23:0] D;
input SRST;
input ARST;
input [1:0] CLR;
input [1:0] SET;

\$dff #(.CLK_POLARITY(1'b1), .WIDTH(2)) ff0 (.CLK(CLK), .D(NS ? 2'h2 : NE ? D[1:0] : Q[1:0]), .Q(Q[1:0]));
\$dffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(2)) ff1 (.CLK(CLK), .EN(EN), .D(NS ? 2'h2 : NE ? D[3:2] : Q[3:2]), .Q(Q[3:2]));
\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff2 (.CLK(CLK), .ARST(ARST), .D(NS ? 2'h2 : NE ? D[5:4] : Q[5:4]), .Q(Q[5:4]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff3 (.CLK(CLK), .EN(EN), .ARST(ARST), .D(NS ? 2'h2 : NE ? D[7:6] : Q[7:6]), .Q(Q[7:6]));
\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff4 (.CLK(CLK), .SRST(SRST), .D(NS ? 2'h2 : NE ? D[9:8] : Q[9:8]), .Q(Q[9:8]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff5 (.CLK(CLK), .EN(EN), .SRST(SRST), .D(NS ? 2'h2 : NE ? D[11:10] : Q[11:10]), .Q(Q[11:10]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff6 (.CLK(CLK), .EN(EN), .SRST(SRST), .D(NS ? 2'h2 : NE ? D[13:12] : Q[13:12]), .Q(Q[13:12]));
\$dffsr #(.CLK_POLARITY(1'b1), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff7 (.CLK(CLK), .SET(SET), .CLR(CLR), .D(NS ? 2'h2 : NE ? D[15:14] : Q[15:14]), .Q(Q[15:14]));
\$dffsre #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff8 (.CLK(CLK), .EN(EN), .SET(SET), .CLR(CLR), .D(NS ? 2'h2 : NE ? D[17:16] : Q[17:16]), .Q(Q[17:16]));

endmodule
