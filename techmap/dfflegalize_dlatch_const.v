module dlatch(input E, D, (* init = 8'hf0 *) output [7:0] Q);
\$_DLATCH_P_ ff0 (.E(E), .D(1'b0), .Q(Q[0]));
\$_DLATCH_N_ ff1 (.E(E), .D(1'b0), .Q(Q[1]));
\$_DLATCH_P_ ff2 (.E(E), .D(1'b1), .Q(Q[2]));
\$_DLATCH_N_ ff3 (.E(E), .D(1'b1), .Q(Q[3]));
\$_DLATCH_P_ ff4 (.E(E), .D(1'b0), .Q(Q[4]));
\$_DLATCH_N_ ff5 (.E(E), .D(1'b0), .Q(Q[5]));
\$_DLATCH_P_ ff6 (.E(E), .D(1'b1), .Q(Q[6]));
\$_DLATCH_N_ ff7 (.E(E), .D(1'b1), .Q(Q[7]));
endmodule
