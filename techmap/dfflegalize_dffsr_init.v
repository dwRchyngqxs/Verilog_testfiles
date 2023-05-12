module dffsr0(input C, R, S, D, (* init = 4'h0 *) output [3:0] Q);
\$_DFFSR_PPP_ ff0 (.C(C), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DFFSR_PPN_ ff1 (.C(C), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DFFSR_PNP_ ff2 (.C(C), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DFFSR_NPP_ ff3 (.C(C), .R(R), .S(S), .D(D), .Q(Q[3]));
endmodule

module dffsr1(input C, R, S, D, (* init = 4'hf *) output [3:0] Q);
\$_DFFSR_PPP_ ff0 (.C(C), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DFFSR_PPN_ ff1 (.C(C), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DFFSR_PNP_ ff2 (.C(C), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DFFSR_NPP_ ff3 (.C(C), .R(R), .S(S), .D(D), .Q(Q[3]));
endmodule

module dffsre0(input C, R, S, E, D, (* init = 5'h0 *) output [4:0] Q);
\$_DFFSRE_PPPP_ ff0 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[0]));
\$_DFFSRE_PPPN_ ff1 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[1]));
\$_DFFSRE_PPNP_ ff2 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[2]));
\$_DFFSRE_PNPP_ ff3 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[3]));
\$_DFFSRE_NPPP_ ff4 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[4]));
endmodule

module dffsre1(input C, R, S, E, D, (* init = 5'h1f *) output [4:0] Q);
\$_DFFSRE_PPPP_ ff0 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[0]));
\$_DFFSRE_PPPN_ ff1 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[1]));
\$_DFFSRE_PPNP_ ff2 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[2]));
\$_DFFSRE_PNPP_ ff3 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[3]));
\$_DFFSRE_NPPP_ ff4 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[4]));
endmodule

module top(input C, E, R, S, D, output [17:0] Q);
dffsr0 dffsr0_(.C(C), .R(R), .S(S), .D(D), .Q(Q[3:0]));
dffsr1 dffsr1_(.C(C), .R(R), .S(S), .D(D), .Q(Q[7:4]));
dffsre0 dffsre0_(.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[12:8]));
dffsre1 dffsre1_(.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[17:13]));
endmodule
