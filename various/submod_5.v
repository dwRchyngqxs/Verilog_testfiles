module top(input d, c, output reg [2:0] q);
(* submod="bar" *) DFF s1(.D(d), .C(c), .Q(q[1]));
DFF s2(.D(d), .C(c), .Q(q[0]));
DFF s3(.D(d), .C(c), .Q(q[2]));
endmodule
