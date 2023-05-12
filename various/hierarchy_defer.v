module first;
endmodule

(* top *)
module top(input i, output o);
sub s0(i, o);
endmodule

(* constant_expression=1+1?2*2:3/3 *)
module sub(input i, output o);
assign o = ~i;
endmodule
