module ff();
input d;
output q;

endmodule

module top();
input d;
output q1;
(* init = 1'b1 *)
output q2;

ff my_ff1(.d(d), .q(q1));
ff my_ff2(.d(d), .q(q2));

endmodule
