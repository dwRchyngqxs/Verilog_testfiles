module dff(input C, D, (* init = 2'b00 *) output [1:0] Q);
\$_DFF_P_ ff0 (.C(C), .D(D), .Q(Q[0]));
\$_DFF_N_ ff1 (.C(C), .D(D), .Q(Q[1]));
endmodule

module dffe(input C, E, D, (* init = 3'b000 *) output [2:0] Q);
\$_DFFE_PP_ ff0 (.C(C), .E(E), .D(D), .Q(Q[0]));
\$_DFFE_PN_ ff1 (.C(C), .E(E), .D(D), .Q(Q[1]));
\$_DFFE_NP_ ff2 (.C(C), .E(E), .D(D), .Q(Q[2]));
endmodule

module sdff0(input C, R, D, (* init = 3'b000 *) output [2:0] Q);
\$_SDFF_PP0_ ff0 (.C(C), .R(R), .D(D), .Q(Q[0]));
\$_SDFF_PN0_ ff1 (.C(C), .R(R), .D(D), .Q(Q[1]));
\$_SDFF_NP0_ ff2 (.C(C), .R(R), .D(D), .Q(Q[2]));
endmodule

module sdff1(input C, R, D, (* init = 3'b000 *) output [2:0] Q);
\$_SDFF_PP1_ ff0 (.C(C), .R(R), .D(D), .Q(Q[0]));
\$_SDFF_PN1_ ff1 (.C(C), .R(R), .D(D), .Q(Q[1]));
\$_SDFF_NP1_ ff2 (.C(C), .R(R), .D(D), .Q(Q[2]));
endmodule

module sdffe0(input C, E, R, D, (* init = 4'b0000 *) output [3:0] Q);
\$_SDFFE_PP0P_ ff0 (.C(C), .R(R), .E(E), .D(D), .Q(Q[0]));
\$_SDFFE_PP0N_ ff1 (.C(C), .R(R), .E(E), .D(D), .Q(Q[1]));
\$_SDFFE_PN0P_ ff2 (.C(C), .R(R), .E(E), .D(D), .Q(Q[2]));
\$_SDFFE_NP0P_ ff3 (.C(C), .R(R), .E(E), .D(D), .Q(Q[3]));
endmodule

module sdffe1(input C, E, R, D, (* init = 4'b0000 *) output [3:0] Q);
\$_SDFFE_PP1P_ ff0 (.C(C), .R(R), .E(E), .D(D), .Q(Q[0]));
\$_SDFFE_PP1N_ ff1 (.C(C), .R(R), .E(E), .D(D), .Q(Q[1]));
\$_SDFFE_PN1P_ ff2 (.C(C), .R(R), .E(E), .D(D), .Q(Q[2]));
\$_SDFFE_NP1P_ ff3 (.C(C), .R(R), .E(E), .D(D), .Q(Q[3]));
endmodule

module sdffce0(input C, E, R, D, (* init = 4'b0000 *) output [3:0] Q);
\$_SDFFCE_PP0P_ ff0 (.C(C), .R(R), .E(E), .D(D), .Q(Q[0]));
\$_SDFFCE_PP0N_ ff1 (.C(C), .R(R), .E(E), .D(D), .Q(Q[1]));
\$_SDFFCE_PN0P_ ff2 (.C(C), .R(R), .E(E), .D(D), .Q(Q[2]));
\$_SDFFCE_NP0P_ ff3 (.C(C), .R(R), .E(E), .D(D), .Q(Q[3]));
endmodule

module sdffce1(input C, E, R, D, (* init = 4'b0000 *) output [3:0] Q);
\$_SDFFCE_PP1P_ ff0 (.C(C), .R(R), .E(E), .D(D), .Q(Q[0]));
\$_SDFFCE_PP1N_ ff1 (.C(C), .R(R), .E(E), .D(D), .Q(Q[1]));
\$_SDFFCE_PN1P_ ff2 (.C(C), .R(R), .E(E), .D(D), .Q(Q[2]));
\$_SDFFCE_NP1P_ ff3 (.C(C), .R(R), .E(E), .D(D), .Q(Q[3]));
endmodule

module top(input C, E, R, D, output [26:0] Q);
dff dff_(.C(C), .D(D), .Q(Q[1:0]));
dffe dffe_(.C(C), .E(E), .D(D), .Q(Q[4:2]));
sdff0 sdff0_(.C(C), .R(R), .D(D), .Q(Q[7:5]));
sdff1 sdff1_(.C(C), .R(R), .D(D), .Q(Q[10:8]));
sdffe0 sdffe0_(.C(C), .R(R), .E(E), .D(D), .Q(Q[14:11]));
sdffe1 sdffe1_(.C(C), .R(R), .E(E), .D(D), .Q(Q[18:15]));
sdffce0 sdffce0_(.C(C), .R(R), .E(E), .D(D), .Q(Q[22:19]));
sdffce1 sdffce1_(.C(C), .R(R), .E(E), .D(D), .Q(Q[26:23]));
endmodule
