module top();
  input [3:0] a;

  output integer o1_1 = 4'b0000 >  a;
  output time o1_2 = 4'b0000 <= a;
  output reg signed o1_3 = 4'b1111 <  a;
  output reg [0:0] o1_4 = 4'b1111 >= a;
  output reg signed [0:0] o1_5 = a <  4'b0000;
  output reg o1_6 = a >= 4'b0000;
  output reg o1_7 = a >  4'b1111;
  output reg o1_8 = a <= 4'b1111;

  output reg o2_1 = 4'sb0000 >  $signed(a);
  output reg o2_2 = 4'sb0000 <= $signed(a);
  output reg o2_3 = $signed(a) <  4'sb0000;
  output reg o2_4 = $signed(a) >= 4'sb0000;

  output reg o3_1 = 4'b0100 >  a;
  output reg o3_2 = 4'b0100 <= a;
  output reg o3_3 = a <  4'b0100;
  output reg o3_4 = a >= 4'b0100;

  output reg o4_1 = 5'b10000 >  a;
  output reg o4_2 = 5'b10000 >= a;
  output reg o4_3 = 5'b10000 <  a;
  output reg o4_4 = 5'b10000 <= a;
  output reg o4_5 = a <  5'b10000;
  output reg o4_6 = a <= 5'b10000;
  output reg o4_7 = a >  5'b10000;
  output reg o4_8 = a >= 5'b10000;

  output reg o5_1 = 5'b10100 >  a;
  output reg o5_2 = 5'b10100 >= a;
  output reg o5_3 = 5'b10100 <  a;
  output reg o5_4 = 5'b10100 <= a;
  output reg o5_5 = a <  5'b10100;
  output reg o5_6 = a <= 5'b10100;
  output reg o5_7 = a >  5'b10100;
  output reg o5_8 = a >= 5'b10100;
endmodule
