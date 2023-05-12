module adlatch0(input E, R, D, output [2:0] Q);
\$_DLATCH_PP0_ ff0 (.E(E), .R(R), .D(D), .Q(Q[0]));
\$_DLATCH_PN0_ ff1 (.E(E), .R(R), .D(D), .Q(Q[1]));
\$_DLATCH_NP0_ ff2 (.E(E), .R(R), .D(D), .Q(Q[2]));
endmodule

module adlatch1(input E, R, D, output [2:0] Q);
\$_DLATCH_PP1_ ff0 (.E(E), .R(R), .D(D), .Q(Q[0]));
\$_DLATCH_PN1_ ff1 (.E(E), .R(R), .D(D), .Q(Q[1]));
\$_DLATCH_NP1_ ff2 (.E(E), .R(R), .D(D), .Q(Q[2]));
endmodule

module top(input C, E, R, D, output [5:0] Q);
adlatch0 adlatch0_(.E(E), .R(R), .D(D), .Q(Q[2:0]));
adlatch1 adlatch1_(.E(E), .R(R), .D(D), .Q(Q[5:3]));
endmodule
