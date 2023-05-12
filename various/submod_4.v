module top(input d, c, (* init = 3'b011 *) output reg [2:0] q);
(* submod="bar" *) DFF s1(.D(d), .C(c), .Q(q[1]));
DFF s2(.D(d), .C(c), .Q(q[0]));
DFF s3(.D(d), .C(c), .Q(q[2]));
endmodule

module DFF(input D, C, output Q);
parameter INIT = 1'b0;
endmodule
