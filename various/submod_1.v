module top(input a, output b);
wire c;
(* submod="bar" *) sub s1(a, c);
assign b = c;
endmodule

module sub(input a, output c);
assign c = a;
endmodule
