module top(input a, output [1:0] b, c);
(* submod="bar" *) sub s1(a, b[0]);
(* submod="bar" *) sub s2(a, c[1]);
assign c = b;
endmodule

module sub(input a, output c);
assign c = a;
endmodule
