module top(input D, C, R, S, input [4:0] E, output [15:0] Q);
\$_DFFE_PP_ ff0(.D(D), .C(C), .E(E[0]), .Q(Q[0]));
\$_DFFE_PP0P_ ff1(.D(D), .C(C), .E(E[0]), .R(R), .Q(Q[1]));
\$_DFFE_PP1P_ ff2(.D(D), .C(C), .E(E[0]), .R(R), .Q(Q[2]));
\$_SDFFE_PP0P_ ff3(.D(D), .C(C), .E(E[0]), .R(R), .Q(Q[3]));
\$_SDFFE_PP1P_ ff4(.D(D), .C(C), .E(E[0]), .R(R), .Q(Q[4]));
\$_SDFFCE_PP0P_ ff5(.D(D), .C(C), .E(E[0]), .R(R), .Q(Q[5]));
\$_SDFFCE_PP1P_ ff6(.D(D), .C(C), .E(E[0]), .R(R), .Q(Q[6]));
\$_DFFSRE_PPPP_ ff7(.D(D), .C(C), .E(E[0]), .R(R), .S(S), .Q(Q[7]));
\$_DFFE_PP_ ff8(.D(D), .C(C), .E(E[1]), .Q(Q[8]));
\$_DFFE_PP0P_ ff9(.D(D), .C(C), .E(E[1]), .R(R), .Q(Q[9]));
\$_DFFE_PP1P_ ff10(.D(D), .C(C), .E(E[2]), .R(R), .Q(Q[10]));
\$_SDFFE_PP0P_ ff11(.D(D), .C(C), .E(E[2]), .R(R), .Q(Q[11]));
\$_SDFFE_PP1P_ ff12(.D(D), .C(C), .E(E[3]), .R(R), .Q(Q[12]));
\$_SDFFCE_PP0P_ ff13(.D(D), .C(C), .E(E[3]), .R(R), .Q(Q[13]));
\$_SDFFCE_PP1P_ ff14(.D(D), .C(C), .E(E[4]), .R(R), .Q(Q[14]));
\$_DFFSRE_PPPP_ ff15(.D(D), .C(C), .E(E[4]), .R(R), .S(S), .Q(Q[15]));
endmodule
