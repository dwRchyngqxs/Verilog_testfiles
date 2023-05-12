module abc9_test038(input clk, output w, x, y, z);
(* init=1'b1 *) wire w;
\$_DFF_N_ ff1(.C(clk), .D(1'b1), .Q(w));
(* init=1'bx *) wire x;
\$_DFF_N_ ff2(.C(clk), .D(1'b0), .Q(x));
(* init=1'b0 *) wire y;
\$_DFF_N_ ff3(.C(clk), .D(1'b0), .Q(y));
(* init=1'b0 *) wire z;
\$_DFF_N_ ff4(.C(clk), .D(1'b1), .Q(z));
endmodule
