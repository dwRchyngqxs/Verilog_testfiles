module sr(input R, S, output [2:0] Q);
\$_SR_PP_ ff0 (.R(R), .S(S), .Q(Q[0]));
\$_SR_PN_ ff1 (.R(R), .S(S), .Q(Q[1]));
\$_SR_NP_ ff2 (.R(R), .S(S), .Q(Q[2]));
endmodule
