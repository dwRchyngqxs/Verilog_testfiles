module top();
	parameter LUT_WIDTH = 4; // Multiples of 2 only
	input [LUT_WIDTH-1:0] a;

	output o1_1;
  assign o1_1 = {(LUT_WIDTH/2){2'b10}} <= a;
	output o1_2;
  assign o1_2 = {(LUT_WIDTH/2){2'b10}} <  a;
	output o1_3;
  assign o1_3 = {(LUT_WIDTH/2){2'b10}} >= a;
	output o1_4;
  assign o1_4 = {(LUT_WIDTH/2){2'b10}} >  a;
	output o1_5;
  assign o1_5 = {(LUT_WIDTH/2){2'b10}} == a;
	output o1_6;
  assign o1_6 = {(LUT_WIDTH/2){2'b10}} != a;

	output o2_1;
  assign o2_1 = a <= {(LUT_WIDTH/2){2'b10}};
	output o2_2;
  assign o2_2 = a <  {(LUT_WIDTH/2){2'b10}};
	output o2_3;
  assign o2_3 = a >= {(LUT_WIDTH/2){2'b10}};
	output o2_4;
  assign o2_4 = a >  {(LUT_WIDTH/2){2'b10}};
	output o2_5;
  assign o2_5 = a == {(LUT_WIDTH/2){2'b10}};
	output o2_6;
  assign o2_6 = a != {(LUT_WIDTH/2){2'b10}};

	output o3_1;
  assign o3_1 = {(LUT_WIDTH/2){2'sb01}} <= $signed(a);
	output o3_2;
  assign o3_2 = {(LUT_WIDTH/2){2'sb01}} <  $signed(a);
	output o3_3;
  assign o3_3 = {(LUT_WIDTH/2){2'sb01}} >= $signed(a);
	output o3_4;
  assign o3_4 = {(LUT_WIDTH/2){2'sb01}} >  $signed(a);
	output o3_5;
  assign o3_5 = {(LUT_WIDTH/2){2'sb01}} == $signed(a);
	output o3_6;
  assign o3_6 = {(LUT_WIDTH/2){2'sb01}} != $signed(a);

	output o4_1;
  assign o4_1 = $signed(a) <= {LUT_WIDTH{1'sb0}};
	output o4_2;
  assign o4_2 = $signed(a) <  {LUT_WIDTH{1'sb0}};
	output o4_3;
  assign o4_3 = $signed(a) >= {LUT_WIDTH{1'sb0}};
	output o4_4;
  assign o4_4 = $signed(a) >  {LUT_WIDTH{1'sb0}};
endmodule
