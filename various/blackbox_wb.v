(* whitebox *)
module box(input a, output q);
assign q = ~a;
endmodule

module top(input a, output q);
box box_i(.a(a), .q(q));
endmodule
