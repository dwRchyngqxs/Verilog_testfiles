module top(input D, C, E, input [3:0] R, output [11:0] Q);
\$_SDFF_PP0_ ff0(.D(D), .C(C), .R(R[0]), .Q(Q[0]));
\$_SDFF_PP1_ ff1(.D(D), .C(C), .R(R[0]), .Q(Q[1]));
\$_SDFFE_PP0P_ ff2(.D(D), .C(C), .R(R[0]), .E(E), .Q(Q[2]));
\$_SDFFE_PP1P_ ff3(.D(D), .C(C), .R(R[0]), .E(E), .Q(Q[3]));
\$_SDFFCE_PP0P_ ff4(.D(D), .C(C), .R(R[0]), .E(E), .Q(Q[4]));
\$_SDFFCE_PP1P_ ff5(.D(D), .C(C), .R(R[0]), .E(E), .Q(Q[5]));
\$_SDFF_PP0_ ff6(.D(D), .C(C), .R(R[1]), .Q(Q[6]));
\$_SDFF_PP1_ ff7(.D(D), .C(C), .R(R[1]), .Q(Q[7]));
\$_SDFFE_PP0P_ ff8(.D(D), .C(C), .R(R[2]), .E(E), .Q(Q[8]));
\$_SDFFE_PP1P_ ff9(.D(D), .C(C), .R(R[2]), .E(E), .Q(Q[9]));
\$_SDFFCE_PP0P_ ff10(.D(D), .C(C), .R(R[3]), .E(E), .Q(Q[10]));
\$_SDFFCE_PP1P_ ff11(.D(D), .C(C), .R(R[3]), .E(E), .Q(Q[11]));
endmodule
