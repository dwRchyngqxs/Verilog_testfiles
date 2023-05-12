module top(input C, D, S, R, output [9:0] Q);

\$_DFF_P_ ff0 (.C(C), .D(D), .Q(Q[0]));
\$_DFF_PP0_ ff1 (.C(C), .D(D), .R(R), .Q(Q[1]));
\$_DFF_PP1_ ff2 (.C(C), .D(D), .R(R), .Q(Q[2]));
\$_DFFSR_PPP_ ff3 (.C(C), .D(D), .R(R), .S(S), .Q(Q[3]));
\$_DFFSR_NNN_ ff4 (.C(C), .D(D), .R(R), .S(S), .Q(Q[4]));

assign Q[9:5] = ~Q[4:0];

endmodule
