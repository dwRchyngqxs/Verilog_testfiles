module top();

input CLK;
input [1:0] D;
output [11:0] Q;
input ARST;
input EN;

\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff0 (.CLK(CLK), .ARST(1'b1), .D(D), .Q(Q[1:0]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .ARST_POLARITY(1'b0), .ARST_VALUE(2'h2), .WIDTH(2)) ff1 (.CLK(CLK), .ARST(1'b0), .EN(EN), .D(D), .Q(Q[3:2]));
\$adlatch #(.EN_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff2 (.EN(EN), .ARST(1'b1), .D(D), .Q(Q[5:4]));
\$adff #(.CLK_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff3 (.CLK(CLK), .ARST(1'bx), .D(D), .Q(Q[7:6]));
\$adffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .ARST_POLARITY(1'b0), .ARST_VALUE(2'h2), .WIDTH(2)) ff4 (.CLK(CLK), .ARST(1'bx), .EN(EN), .D(D), .Q(Q[9:8]));
\$adlatch #(.EN_POLARITY(1'b1), .ARST_POLARITY(1'b1), .ARST_VALUE(2'h2), .WIDTH(2)) ff5 (.EN(EN), .ARST(1'bx), .D(D), .Q(Q[11:10]));


endmodule
