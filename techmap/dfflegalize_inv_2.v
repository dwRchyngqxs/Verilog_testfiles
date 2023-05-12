module top(input C, E, R, S, D, output [3:0] Q);

\$_DFFSRE_PPPP_ ff0 (.C(C), .E(E), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DFFSRE_NPPP_ ff1 (.C(C), .E(E), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DFFSRE_PNNN_ ff2 (.C(C), .E(E), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DFFSRE_NNNN_ ff3 (.C(C), .E(E), .R(R), .S(S), .D(D), .Q(Q[3]));

endmodule
