module top();

input CLK;
input EN;
(* init=84'haaaaaaaaaaaaaaaaaaaaa *)
output [83:0] Q;
input SRST;
input ARST;
input [3:0] CLR;
input [3:0] SET;

\$dff #(.CLK_POLARITY(1'b1), .WIDTH(4)) ff0 (.CLK(CLK), .D(4'hc), .Q(Q[3:0]));
\$dffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(4)) ff1 (.CLK(CLK), .EN(EN), .D(4'hc), .Q(Q[7:4]));
\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(8'hf0), .WIDTH(8)) ff2 (.CLK(CLK), .ARST(ARST), .D(8'hcc), .Q(Q[15:8]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(8'hf0), .WIDTH(8)) ff3 (.CLK(CLK), .EN(EN), .ARST(ARST), .D(8'hcc), .Q(Q[23:16]));
\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(8'hf0), .WIDTH(8)) ff4 (.CLK(CLK), .SRST(SRST), .D(8'hcc), .Q(Q[31:24]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(8'hf0), .WIDTH(8)) ff5 (.CLK(CLK), .EN(EN), .SRST(SRST), .D(8'hcc), .Q(Q[39:32]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(8'hf0), .WIDTH(8)) ff6 (.CLK(CLK), .EN(EN), .SRST(SRST), .D(8'hcc), .Q(Q[47:40]));
\$dffsr #(.CLK_POLARITY(1'b1), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b0), .WIDTH(8)) ff7 (.CLK(CLK), .SET({SET, 4'hf}), .CLR({4'h0, CLR}), .D(8'hcc), .Q(Q[55:48]));
\$dffsre #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b0), .CLR_POLARITY(1'b0), .SET_POLARITY(1'b1), .WIDTH(8)) ff8 (.CLK(CLK), .EN(EN), .SET({SET, 4'h0}), .CLR({4'hf, CLR}), .D(8'hcc), .Q(Q[63:56]));

\$dlatch #(.EN_POLARITY(1'b1), .WIDTH(4)) ff9 (.EN(EN), .D(4'hc), .Q(Q[67:64]));
\$adlatch #(.EN_POLARITY(1'b0), .ARST_POLARITY(1'b1), .ARST_VALUE(8'hf0), .WIDTH(8)) ff10 (.EN(EN), .ARST(ARST), .D(8'hcc), .Q(Q[75:68]));
\$dlatchsr #(.EN_POLARITY(1'b0), .CLR_POLARITY(1'b1), .SET_POLARITY(1'b1), .WIDTH(8)) ff11 (.EN(EN), .SET({SET, 4'h0}), .CLR({4'h0, CLR}), .D(8'hcc), .Q(Q[83:76]));

endmodule
