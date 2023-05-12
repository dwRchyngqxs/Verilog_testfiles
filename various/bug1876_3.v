module expression_00354(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y4);
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

  output wire signed [4:0] y4;

  localparam signed [4:0] p10 = ((3'd0)?(2'd1):(-2'sd1));

  assign y4 = ((p10?a4:b4)&$signed(b3));
endmodule
