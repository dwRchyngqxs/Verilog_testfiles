module dlatch(input E, D, (* init = 2'h0 *) output [1:0] Q);
\$_DLATCH_P_ ff0 (.E(E), .D(D), .Q(Q[0]));
\$_DLATCH_N_ ff1 (.E(E), .D(D), .Q(Q[1]));
endmodule
