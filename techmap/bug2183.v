module foo(inout a, b);
  assign a = b;
endmodule
module bar(output c);
  foo f(c, 1'b0);
endmodule
