module dffsr(input C, R, S, D, output [3:0] Q);
\$_DFFSR_PPP_ ff0 (.C(C), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DFFSR_PPN_ ff1 (.C(C), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DFFSR_PNP_ ff2 (.C(C), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DFFSR_NPP_ ff3 (.C(C), .R(R), .S(S), .D(D), .Q(Q[3]));
endmodule

module dffsre(input C, R, S, E, D, output [4:0] Q);
\$_DFFSRE_PPPP_ ff0 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[0]));
\$_DFFSRE_PPPN_ ff1 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[1]));
\$_DFFSRE_PPNP_ ff2 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[2]));
\$_DFFSRE_PNPP_ ff3 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[3]));
\$_DFFSRE_NPPP_ ff4 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[4]));
endmodule

module top(input C, E, R, S, D, output [8:0] Q);
dffsr dffsr_(.C(C), .R(R), .S(S), .D(D), .Q(Q[3:0]));
dffsre dffsre_(.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[8:4]));
endmodule
