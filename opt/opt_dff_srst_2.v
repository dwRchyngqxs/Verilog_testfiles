module top();

input CLK;
input [1:0] D;
output [5:0] Q;
input SRST;
input EN;

\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff0 (.CLK(CLK), .SRST(1'b0), .D(D), .Q(Q[1:0]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2), .WIDTH(2)) ff1 (.CLK(CLK), .SRST(1'b1), .EN(EN), .D(D), .Q(Q[3:2]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2), .WIDTH(2)) ff2 (.CLK(CLK), .SRST(1'b1), .EN(EN), .D(D), .Q(Q[5:4]));

endmodule
