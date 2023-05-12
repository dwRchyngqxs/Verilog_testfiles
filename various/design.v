(* blackbox *)
module bb(input i, output o);
endmodule

(* whitebox *)
module wb(input i, output o);
assign o = ~i;
endmodule

module top(input i, output o);
assign o = ~i;
endmodule
