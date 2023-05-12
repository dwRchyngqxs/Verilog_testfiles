module dlatchsr(input E, R, S, D, output [3:0] Q);
\$_DLATCHSR_PPP_ ff0 (.E(E), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DLATCHSR_PPN_ ff1 (.E(E), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DLATCHSR_PNP_ ff2 (.E(E), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DLATCHSR_NPP_ ff3 (.E(E), .R(R), .S(S), .D(D), .Q(Q[3]));
endmodule
