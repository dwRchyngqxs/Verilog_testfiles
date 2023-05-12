module top();

input CLK;
input [5:0] D;
output [23:0] Q;
input ARST;
input EN;

\$dffsr #(.CLK_POLARITY(1'b1), .SET_POLARITY(1'b1), .CLR_POLARITY(1'b1), .WIDTH(6)) ff0 (.CLK(CLK), .CLR({ARST, 5'h00}), .SET({1'b0, {5{ARST}}}), .D(D), .Q(Q[5:0]));
\$dffsre #(.CLK_POLARITY(1'b1), .SET_POLARITY(1'b0), .CLR_POLARITY(1'b0), .EN_POLARITY(1'b1), .WIDTH(6)) ff1 (.CLK(CLK), .EN(EN), .D(D), .CLR({ARST, 5'h1f}), .SET({1'b1, {5{ARST}}}), .Q(Q[11:6]));
\$dlatchsr #(.SET_POLARITY(1'b0), .CLR_POLARITY(1'b1), .EN_POLARITY(1'b1), .WIDTH(6)) ff2 (.EN(EN), .D(D), .CLR({ARST, 5'h00}), .SET({1'b1, {5{ARST}}}), .Q(Q[17:12]));
\$sr #(.SET_POLARITY(1'b1), .CLR_POLARITY(1'b0), .WIDTH(6)) ff3 (.CLR({ARST, 5'h1f}), .SET({1'b0, {5{ARST}}}), .Q(Q[23:18]));

endmodule
