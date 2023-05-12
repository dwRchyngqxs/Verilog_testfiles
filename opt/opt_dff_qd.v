module top();

input CLK;
input EN;
(* init = 24'h555555 *)
output [19:0] Q;
input SRST;
input ARST;
input [1:0] CLR;
input [1:0] SET;

\$dff #(.CLK_POLARITY(1'b1), .WIDTH(2)) ff0 (.CLK(CLK), .D(Q[1:0]), .Q(Q[1:0]));
\$dffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(2)) ff1 (.CLK(CLK), .EN(EN), .D(Q[3:2]), .Q(Q[3:2]));
\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff2 (.CLK(CLK), .ARST(ARST), .D(Q[5:4]), .Q(Q[5:4]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff3 (.CLK(CLK), .EN(EN), .ARST(ARST), .D(Q[7:6]), .Q(Q[7:6]));
\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff4 (.CLK(CLK), .SRST(SRST), .D(Q[9:8]), .Q(Q[9:8]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff5 (.CLK(CLK), .EN(EN), .SRST(SRST), .D(Q[11:10]), .Q(Q[11:10]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff6 (.CLK(CLK), .EN(EN), .SRST(SRST), .D(Q[13:12]), .Q(Q[13:12]));
\$dffsr #(.CLK_POLARITY(1'b1), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff7 (.CLK(CLK), .SET(SET), .CLR(CLR), .D(Q[15:14]), .Q(Q[15:14]));
\$dffsre #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff8 (.CLK(CLK), .EN(EN), .SET(SET), .CLR(CLR), .D(Q[17:16]), .Q(Q[17:16]));

\$dlatch #(.EN_POLARITY(1'b1), .WIDTH(2)) ff9 (.EN(EN), .D(Q[19:18]), .Q(Q[19:18]));
\$adlatch #(.EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff10 (.EN(EN), .ARST(ARST), .D(Q[21:20]), .Q(Q[21:20]));
\$dlatchsr #(.EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(2)) ff11 (.EN(EN), .SET(SET), .CLR(CLR), .D(Q[23:22]), .Q(Q[23:22]));

endmodule
