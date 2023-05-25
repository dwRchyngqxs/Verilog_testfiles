module top(input C, R, input [1:0] D, (* init = {2'bx0, 2'b0x, 1'b1, {8{1'b0}}} *) output [12:0] Q);

(* init = 1'b1 *)
wire unused;

\$_DFF_NN0_ dff0 (.C(C), .D(D[0]), .R(R), .Q(Q[0]));
\$_DFF_NN1_ dff1 (.C(C), .D(D[0]), .R(R), .Q(Q[1]));
\$_DFF_NP0_ dff2 (.C(C), .D(D[0]), .R(R), .Q(Q[2]));
\$_DFF_NP1_ dff3 (.C(C), .D(D[0]), .R(R), .Q(Q[3]));
\$_DFF_PN0_ dff4 (.C(C), .D(D[0]), .R(R), .Q(Q[4]));
\$_DFF_PN1_ dff5 (.C(C), .D(D[0]), .R(R), .Q(Q[5]));
\$_DFF_PP0_ dff6 (.C(C), .D(D[0]), .R(R), .Q(Q[6]));
\$_DFF_PP1_ dff7 (.C(C), .D(D[0]), .R(R), .Q(Q[7]));

assign Q[8] = 0;

\$adff #(.WIDTH(2), .CLK_POLARITY(1), .ARST_POLARITY(1'b0), .ARST_VALUE(2'b10)) dff8 (.CLK(C), .ARST(R), .D(D), .Q(Q[10:9]));
\$adff #(.WIDTH(2), .CLK_POLARITY(0), .ARST_POLARITY(1'b1), .ARST_VALUE(2'b01)) dff9 (.CLK(C), .ARST(R), .D(D), .Q(Q[12:11]));
endmodule
