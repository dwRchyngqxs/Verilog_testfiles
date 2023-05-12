module sr0(input R, S, (* init = 3'h0 *) output [2:0] Q);
\$_SR_PP_ ff0 (.R(R), .S(S), .Q(Q[0]));
\$_SR_PN_ ff1 (.R(R), .S(S), .Q(Q[1]));
\$_SR_NP_ ff2 (.R(R), .S(S), .Q(Q[2]));
endmodule

module sr1(input R, S, (* init = 3'h7 *) output [2:0] Q);
\$_SR_PP_ ff0 (.R(R), .S(S), .Q(Q[0]));
\$_SR_PN_ ff1 (.R(R), .S(S), .Q(Q[1]));
\$_SR_NP_ ff2 (.R(R), .S(S), .Q(Q[2]));
endmodule

module top(input R, S, output [5:0] Q);
sr0 sr0_(.S(S), .R(R), .Q(Q[2:0]));
sr1 sr1_(.S(S), .R(R), .Q(Q[5:3]));
endmodule
