module top();

input [3:0] A;
input [3:0] B0;
input [3:0] B1;
input [1:0] S;
output [3:0] O;

\$pmux #(.WIDTH(4), .S_WIDTH(2)) pm (.A(A), .B({B1, B0}), .S(S), .Y(O));

endmodule
