module top();

input CLK;
input [1:0] D;
(* init=12'h555 *)
output [11:0] Q;
input SRST;
input EN;

\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff0 (.CLK(CLK), .SRST(1'b1), .D(D), .Q(Q[1:0]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2), .WIDTH(2)) ff1 (.CLK(CLK), .SRST(1'b0), .EN(EN), .D(D), .Q(Q[3:2]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2), .WIDTH(2)) ff2 (.CLK(CLK), .SRST(1'b0), .EN(EN), .D(D), .Q(Q[5:4]));
\$sdff #(.CLK_POLARITY(1'b1), .SRST_POLARITY(1'b1), .SRST_VALUE(2'h2), .WIDTH(2)) ff3 (.CLK(CLK), .SRST(1'bx), .D(D), .Q(Q[7:6]));
\$sdffe #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2), .WIDTH(2)) ff4 (.CLK(CLK), .SRST(1'bx), .EN(EN), .D(D), .Q(Q[9:8]));
\$sdffce #(.CLK_POLARITY(1'b1), .EN_POLARITY(1'b1), .SRST_POLARITY(1'b0), .SRST_VALUE(2'h2), .WIDTH(2)) ff5 (.CLK(CLK), .SRST(1'bx), .EN(EN), .D(D), .Q(Q[11:10]));


endmodule
