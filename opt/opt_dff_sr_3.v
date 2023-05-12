module top();

input CLK;
input [5:0] D;
output [23:0] Q;
input CLR;
input SET;
input ALT;
input EN;

\$dffsr #(.CLK_POLARITY(1'b1), .SET_POLARITY(1'b1), .CLR_POLARITY(1'b1), .WIDTH(6)) ff0 (.CLK(CLK), .CLR(6'h00), .SET({{5{SET}}, ALT}), .D(D), .Q(Q[5:0]));
\$dffsre #(.CLK_POLARITY(1'b1), .SET_POLARITY(1'b0), .CLR_POLARITY(1'b0), .EN_POLARITY(1'b1), .WIDTH(6)) ff1 (.CLK(CLK), .EN(EN), .D(D), .CLR(6'h3f), .SET({{5{SET}}, ALT}), .Q(Q[11:6]));
\$dlatchsr #(.SET_POLARITY(1'b0), .CLR_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(6)) ff2 (.EN(EN), .D(D), .CLR(6'h00), .SET({{5{SET}}, ALT}), .Q(Q[17:12]));
\$sr #(.SET_POLARITY(1'b1), .CLR_POLARITY(1'b0), .WIDTH(6)) ff3 (.CLR(6'h3f), .SET({{5{SET}}, ALT}), .Q(Q[23:18]));

endmodule
