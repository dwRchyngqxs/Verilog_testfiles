module adff0(input C, R, D, output [2:0] Q);
\$_DFF_PP0_ ff0 (.C(C), .R(R), .D(D), .Q(Q[0]));
\$_DFF_PN0_ ff1 (.C(C), .R(R), .D(D), .Q(Q[1]));
\$_DFF_NP0_ ff2 (.C(C), .R(R), .D(D), .Q(Q[2]));
endmodule

module adff1(input C, R, D, output [2:0] Q);
\$_DFF_PP1_ ff0 (.C(C), .R(R), .D(D), .Q(Q[0]));
\$_DFF_PN1_ ff1 (.C(C), .R(R), .D(D), .Q(Q[1]));
\$_DFF_NP1_ ff2 (.C(C), .R(R), .D(D), .Q(Q[2]));
endmodule

module adffe0(input C, E, R, D, output [3:0] Q);
\$_DFFE_PP0P_ ff0 (.C(C), .R(R), .E(E), .D(D), .Q(Q[0]));
\$_DFFE_PP0N_ ff1 (.C(C), .R(R), .E(E), .D(D), .Q(Q[1]));
\$_DFFE_PN0P_ ff2 (.C(C), .R(R), .E(E), .D(D), .Q(Q[2]));
\$_DFFE_NP0P_ ff3 (.C(C), .R(R), .E(E), .D(D), .Q(Q[3]));
endmodule

module adffe1(input C, E, R, D, output [3:0] Q);
\$_DFFE_PP1P_ ff0 (.C(C), .R(R), .E(E), .D(D), .Q(Q[0]));
\$_DFFE_PP1N_ ff1 (.C(C), .R(R), .E(E), .D(D), .Q(Q[1]));
\$_DFFE_PN1P_ ff2 (.C(C), .R(R), .E(E), .D(D), .Q(Q[2]));
\$_DFFE_NP1P_ ff3 (.C(C), .R(R), .E(E), .D(D), .Q(Q[3]));
endmodule

module top(input C, E, R, D, output [13:0] Q);
adff0 adff0_(.C(C), .R(R), .D(D), .Q(Q[2:0]));
adff1 adff1_(.C(C), .R(R), .D(D), .Q(Q[5:3]));
adffe0 adffe0_(.C(C), .R(R), .E(E), .D(D), .Q(Q[9:6]));
adffe1 adffe1_(.C(C), .R(R), .E(E), .D(D), .Q(Q[13:10]));
endmodule
