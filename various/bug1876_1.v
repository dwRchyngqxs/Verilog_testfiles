module expression_00032(b5, y15);
  input signed [5:0] b5;
  output [3:0] y15;
  assign y15 = (0 ? b5 : b5) > 0;
endmodule
