(* blackbox *)
module sub (input i, output o);
endmodule

(* blackbox *)
module namedsub (input i, output o);
parameter name = "";
endmodule

module top(input [3:0] i, output [3:0] o);

sub s1 (i[0], o[0]);
sub subsubsub (i[1], o[1]);
sub s2 (i[2], o[2]);
sub xxx (i[3], o[3]);

endmodule
