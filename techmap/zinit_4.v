module top(input C, R, D, E, (* init = {24{1'b0}} *) output [23:0] Q);

\$_DFFE_NN0P_ dff0 (.C(C), .D(D), .E(E), .R(R), .Q(Q[0]));
\$_DFFE_NN1P_ dff1 (.C(C), .D(D), .E(E), .R(R), .Q(Q[1]));
\$_DFFE_NP0P_ dff2 (.C(C), .D(D), .E(E), .R(R), .Q(Q[2]));
\$_DFFE_NP1P_ dff3 (.C(C), .D(D), .E(E), .R(R), .Q(Q[3]));
\$_DFFE_PN0P_ dff4 (.C(C), .D(D), .E(E), .R(R), .Q(Q[4]));
\$_DFFE_PN1P_ dff5 (.C(C), .D(D), .E(E), .R(R), .Q(Q[5]));
\$_DFFE_PP0P_ dff6 (.C(C), .D(D), .E(E), .R(R), .Q(Q[6]));
\$_DFFE_PP1P_ dff7 (.C(C), .D(D), .E(E), .R(R), .Q(Q[7]));

\$_SDFF_NN0_ dff8 (.C(C), .D(D[0]), .R(R), .Q(Q[8]));
\$_SDFF_NN1_ dff9 (.C(C), .D(D[0]), .R(R), .Q(Q[9]));
\$_SDFF_NP0_ dff10(.C(C), .D(D[0]), .R(R), .Q(Q[10]));
\$_SDFF_NP1_ dff11(.C(C), .D(D[0]), .R(R), .Q(Q[11]));
\$_SDFF_PN0_ dff12(.C(C), .D(D[0]), .R(R), .Q(Q[12]));
\$_SDFF_PN1_ dff13(.C(C), .D(D[0]), .R(R), .Q(Q[13]));
\$_SDFF_PP0_ dff14(.C(C), .D(D[0]), .R(R), .Q(Q[14]));
\$_SDFF_PP1_ dff15(.C(C), .D(D[0]), .R(R), .Q(Q[15]));

\$_SDFFE_NN0P_ dff16(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[16]));
\$_SDFFE_NN1P_ dff17(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[17]));
\$_SDFFE_NP0P_ dff18(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[18]));
\$_SDFFE_NP1P_ dff19(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[19]));
\$_SDFFE_PN0P_ dff20(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[20]));
\$_SDFFE_PN1P_ dff21(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[21]));
\$_SDFFE_PP0P_ dff22(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[22]));
\$_SDFFE_PP1P_ dff23(.C(C), .D(D[0]),.E(E),  .R(R), .Q(Q[23]));

endmodule
