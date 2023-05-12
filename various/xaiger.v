module top(input a, b, output c);
bb #(1) bb();
endmodule

module bb(input a, b, output c);
parameter p = 0;
assign c = a ^ b;
endmodule
