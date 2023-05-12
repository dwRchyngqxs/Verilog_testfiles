module expression_00057(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y8);
  input [3:0] a0;
  input [4:0] a1;
  input [5:0] a2;
  input signed [3:0] a3;
  input signed [4:0] a4;
  input signed [5:0] a5;

  input [3:0] b0;
  input [4:0] b1;
  input [5:0] b2;
  input signed [3:0] b3;
  input signed [4:0] b4;
  input signed [5:0] b5;

  output [5:0] y8;

  localparam signed [4:0] p4 = ((2'd3)||(-4'sd1));
  localparam signed [3:0] p9 = {3{(((2'sd0)^~(5'd20))>((-3'sd0)>>(4'sd2)))}};

  assign y8 = (-(!($signed({3{p9}})<(p4?b4:b5))));
endmodule
