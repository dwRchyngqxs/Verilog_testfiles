module abc9_test036(input clk, d, output q);
(* keep, init=1'b0 *) wire w;
\$_DFF_P_ ff(.C(clk), .D(d), .Q(w));
assign q = w;
endmodule
