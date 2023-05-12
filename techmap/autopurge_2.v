(* blackbox *)
module sub(input i, output o, input j);
endmodule

(* blackbox *)
module foobar(input i, output o, input j);
endmodule

module top(input i, output o);
sub s0(i, o);
endmodule
