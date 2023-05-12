module dlatchsr0(input E, R, S, D, (* init = 4'h0 *) output [3:0] Q);
\$_DLATCHSR_PPP_ ff0 (.E(E), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DLATCHSR_PPN_ ff1 (.E(E), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DLATCHSR_PNP_ ff2 (.E(E), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DLATCHSR_NPP_ ff3 (.E(E), .R(R), .S(S), .D(D), .Q(Q[3]));
endmodule

module dlatchsr1(input E, R, S, D, (* init = 4'hf *) output [3:0] Q);
\$_DLATCHSR_PPP_ ff0 (.E(E), .R(R), .S(S), .D(D), .Q(Q[0]));
\$_DLATCHSR_PPN_ ff1 (.E(E), .R(R), .S(S), .D(D), .Q(Q[1]));
\$_DLATCHSR_PNP_ ff2 (.E(E), .R(R), .S(S), .D(D), .Q(Q[2]));
\$_DLATCHSR_NPP_ ff3 (.E(E), .R(R), .S(S), .D(D), .Q(Q[3]));
endmodule

module top(input C, E, R, S, D, output [7:0] Q);
dlatchsr0 dlatchsr0_(.E(E), .R(R), .S(S), .D(D), .Q(Q[3:0]));
dlatchsr1 dlatchsr1_(.E(E), .R(R), .S(S), .D(D), .Q(Q[7:4]));
endmodule
