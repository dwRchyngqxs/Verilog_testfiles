module aldff(input C, L, AD, D, (* init = 3'b000 *) output [2:0] Q);
\$_ALDFF_PP_ ff0 (.C(C), .L(L), .AD(AD), .D(D), .Q(Q[0]));
\$_ALDFF_PN_ ff1 (.C(C), .L(L), .AD(AD), .D(D), .Q(Q[1]));
\$_ALDFF_NP_ ff2 (.C(C), .L(L), .AD(AD), .D(D), .Q(Q[2]));
endmodule

module aldffe(input C, E, L, AD, D, (* init = 4'b0000 *) output [3:0] Q);
\$_ALDFFE_PPP_ ff0 (.C(C), .L(L), .AD(AD), .E(E), .D(D), .Q(Q[0]));
\$_ALDFFE_PPN_ ff1 (.C(C), .L(L), .AD(AD), .E(E), .D(D), .Q(Q[1]));
\$_ALDFFE_PNP_ ff2 (.C(C), .L(L), .AD(AD), .E(E), .D(D), .Q(Q[2]));
\$_ALDFFE_NPP_ ff3 (.C(C), .L(L), .AD(AD), .E(E), .D(D), .Q(Q[3]));
endmodule

module top(input C, E, L, AD, D, output [6:0] Q);
aldff aldff_(.C(C), .L(L), .AD(AD), .D(D), .Q(Q[2:0]));
aldffe aldffe_(.C(C), .L(L), .AD(AD), .E(E), .D(D), .Q(Q[6:3]));
endmodule
