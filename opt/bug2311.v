module top();

input A;
output Y;

\$_XNOR_ x (.A(A), .B(A), .Y(Y));

endmodule
