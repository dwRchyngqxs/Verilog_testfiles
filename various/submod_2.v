module top(input a, output [1:0] b);
(* submod="bar" *) sub s1(a, b[1]);
assign b[0] = 1'b0;
endmodule

module sub(input a, output c);
assign c = a;
endmodule
