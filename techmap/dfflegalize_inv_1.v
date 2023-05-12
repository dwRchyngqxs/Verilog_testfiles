module top(input C, E, R, S, D, L, AD, output [71:0] Q);

\$_DFF_P_ ff0 (.C(C), .D(D), .Q(Q[0]));
\$_DFF_N_ ff1 (.C(C), .D(D), .Q(Q[1]));

\$_DFFE_PP_ ff2 (.C(C), .E(E), .D(D), .Q(Q[2]));
\$_DFFE_PN_ ff3 (.C(C), .E(E), .D(D), .Q(Q[3]));
\$_DFFE_NP_ ff4 (.C(C), .E(E), .D(D), .Q(Q[4]));

\$_DFF_PP0_ ff5 (.C(C), .R(R), .D(D), .Q(Q[5]));
\$_DFF_PN0_ ff6 (.C(C), .R(R), .D(D), .Q(Q[6]));
\$_DFF_NP0_ ff7 (.C(C), .R(R), .D(D), .Q(Q[7]));

\$_DFF_PP1_ ff8 (.C(C), .R(R), .D(D), .Q(Q[8]));
\$_DFF_PN1_ ff9 (.C(C), .R(R), .D(D), .Q(Q[9]));
\$_DFF_NP1_ ff10 (.C(C), .R(R), .D(D), .Q(Q[10]));

\$_DFFE_PP0P_ ff11 (.C(C), .R(R), .E(E), .D(D), .Q(Q[11]));
\$_DFFE_PP0N_ ff12 (.C(C), .R(R), .E(E), .D(D), .Q(Q[12]));
\$_DFFE_PN0P_ ff13 (.C(C), .R(R), .E(E), .D(D), .Q(Q[13]));
\$_DFFE_NP0P_ ff14 (.C(C), .R(R), .E(E), .D(D), .Q(Q[14]));

\$_DFFE_PP1P_ ff15 (.C(C), .R(R), .E(E), .D(D), .Q(Q[15]));
\$_DFFE_PP1N_ ff16 (.C(C), .R(R), .E(E), .D(D), .Q(Q[16]));
\$_DFFE_PN1P_ ff17 (.C(C), .R(R), .E(E), .D(D), .Q(Q[17]));
\$_DFFE_NP1P_ ff18 (.C(C), .R(R), .E(E), .D(D), .Q(Q[18]));

\$_DFFSR_PPP_ ff19 (.C(C), .R(R), .S(S), .D(D), .Q(Q[19]));
\$_DFFSR_PPN_ ff20 (.C(C), .R(R), .S(S), .D(D), .Q(Q[20]));
\$_DFFSR_PNP_ ff21 (.C(C), .R(R), .S(S), .D(D), .Q(Q[21]));
\$_DFFSR_NPP_ ff22 (.C(C), .R(R), .S(S), .D(D), .Q(Q[22]));

\$_DFFSRE_PPPP_ ff23 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[23]));
\$_DFFSRE_PPPN_ ff24 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[24]));
\$_DFFSRE_PPNP_ ff25 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[25]));
\$_DFFSRE_PNPP_ ff26 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[26]));
\$_DFFSRE_NPPP_ ff27 (.C(C), .R(R), .S(S), .E(E), .D(D), .Q(Q[27]));

\$_SDFF_PP0_ ff28 (.C(C), .R(R), .D(D), .Q(Q[28]));
\$_SDFF_PN0_ ff29 (.C(C), .R(R), .D(D), .Q(Q[29]));
\$_SDFF_NP0_ ff30 (.C(C), .R(R), .D(D), .Q(Q[30]));

\$_SDFF_PP1_ ff31 (.C(C), .R(R), .D(D), .Q(Q[31]));
\$_SDFF_PN1_ ff32 (.C(C), .R(R), .D(D), .Q(Q[32]));
\$_SDFF_NP1_ ff33 (.C(C), .R(R), .D(D), .Q(Q[33]));

\$_SDFFE_PP0P_ ff34 (.C(C), .R(R), .E(E), .D(D), .Q(Q[34]));
\$_SDFFE_PP0N_ ff35 (.C(C), .R(R), .E(E), .D(D), .Q(Q[35]));
\$_SDFFE_PN0P_ ff36 (.C(C), .R(R), .E(E), .D(D), .Q(Q[36]));
\$_SDFFE_NP0P_ ff37 (.C(C), .R(R), .E(E), .D(D), .Q(Q[37]));

\$_SDFFE_PP1P_ ff38 (.C(C), .R(R), .E(E), .D(D), .Q(Q[38]));
\$_SDFFE_PP1N_ ff39 (.C(C), .R(R), .E(E), .D(D), .Q(Q[39]));
\$_SDFFE_PN1P_ ff40 (.C(C), .R(R), .E(E), .D(D), .Q(Q[40]));
\$_SDFFE_NP1P_ ff41 (.C(C), .R(R), .E(E), .D(D), .Q(Q[41]));

\$_SDFFCE_PP0P_ ff42 (.C(C), .R(R), .E(E), .D(D), .Q(Q[42]));
\$_SDFFCE_PP0N_ ff43 (.C(C), .R(R), .E(E), .D(D), .Q(Q[43]));
\$_SDFFCE_PN0P_ ff44 (.C(C), .R(R), .E(E), .D(D), .Q(Q[44]));
\$_SDFFCE_NP0P_ ff45 (.C(C), .R(R), .E(E), .D(D), .Q(Q[45]));

\$_SDFFCE_PP1P_ ff46 (.C(C), .R(R), .E(E), .D(D), .Q(Q[46]));
\$_SDFFCE_PP1N_ ff47 (.C(C), .R(R), .E(E), .D(D), .Q(Q[47]));
\$_SDFFCE_PN1P_ ff48 (.C(C), .R(R), .E(E), .D(D), .Q(Q[48]));
\$_SDFFCE_NP1P_ ff49 (.C(C), .R(R), .E(E), .D(D), .Q(Q[49]));

\$_DLATCH_P_ ff50 (.E(E), .D(D), .Q(Q[50]));
\$_DLATCH_N_ ff51 (.E(E), .D(D), .Q(Q[51]));

\$_DLATCH_PP0_ ff52 (.E(E), .R(R), .D(D), .Q(Q[52]));
\$_DLATCH_PN0_ ff53 (.E(E), .R(R), .D(D), .Q(Q[53]));
\$_DLATCH_NP0_ ff54 (.E(E), .R(R), .D(D), .Q(Q[54]));

\$_DLATCH_PP1_ ff55 (.E(E), .R(R), .D(D), .Q(Q[55]));
\$_DLATCH_PN1_ ff56 (.E(E), .R(R), .D(D), .Q(Q[56]));
\$_DLATCH_NP1_ ff57 (.E(E), .R(R), .D(D), .Q(Q[57]));

\$_DLATCHSR_PPP_ ff58 (.E(E), .R(R), .S(S), .D(D), .Q(Q[58]));
\$_DLATCHSR_PPN_ ff59 (.E(E), .R(R), .S(S), .D(D), .Q(Q[59]));
\$_DLATCHSR_PNP_ ff60 (.E(E), .R(R), .S(S), .D(D), .Q(Q[60]));
\$_DLATCHSR_NPP_ ff61 (.E(E), .R(R), .S(S), .D(D), .Q(Q[61]));

\$_SR_PP_ ff62 (.R(R), .S(S), .Q(Q[62]));
\$_SR_PN_ ff63 (.R(R), .S(S), .Q(Q[63]));
\$_SR_NP_ ff64 (.R(R), .S(S), .Q(Q[64]));

\$_ALDFF_PP_ ff65 (.C(C), .L(L), .AD(AD), .D(D), .Q(Q[65]));
\$_ALDFF_PN_ ff66 (.C(C), .L(L), .AD(AD), .D(D), .Q(Q[66]));
\$_ALDFF_NP_ ff67 (.C(C), .L(L), .AD(AD), .D(D), .Q(Q[67]));

\$_ALDFFE_PPP_ ff68 (.C(C), .L(L), .AD(AD), .D(D), .E(E), .Q(Q[68]));
\$_ALDFFE_PPN_ ff69 (.C(C), .L(L), .AD(AD), .D(D), .E(E), .Q(Q[69]));
\$_ALDFFE_PNP_ ff70 (.C(C), .L(L), .AD(AD), .D(D), .E(E), .Q(Q[70]));
\$_ALDFFE_NPP_ ff71 (.C(C), .L(L), .AD(AD), .D(D), .E(E), .Q(Q[71]));

endmodule
