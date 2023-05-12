module top();

input CLK;
input [1:0] D;
output [5:0] Q;
input ARST;
input EN;

\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff0 (.CLK(CLK), .ARST(1'b0), .D(D), .Q(Q[1:0]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .ARST_POLARITY(1'b0), .ARST_VALUE(2'h2), .WIDTH(2)) ff1 (.CLK(CLK), .ARST(1'b1), .EN(EN), .D(D), .Q(Q[3:2]));
\$adlatch #(.EN_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff2 (.EN(EN), .ARST(1'b0), .D(D), .Q(Q[5:4]));

endmodule
