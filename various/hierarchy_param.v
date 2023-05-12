module bb ();
parameter A = "abc";
parameter B = 1;
parameter C = 2;
input a;
output b;
endmodule

module top ();
input a;
output b;
bb #("def", 3) my_bb (a, b);
endmodule
