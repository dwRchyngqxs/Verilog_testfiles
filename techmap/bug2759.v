(* abc9_box, whitebox *)
module box(input [1:0] i, output o);
specify
(i *> o) = 1;
endspecify
assign o = ^i;
endmodule

module top(input [1:0] i, output o);
box i1(i, o);
endmodule
