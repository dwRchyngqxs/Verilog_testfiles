module top();

input [3:0] A;
input S;
output [1:0] Y;

wire [3:0] A1 = A + 1;
wire [3:0] A2 = A + 2;
assign Y = S ? A1[3:2] : A2[3:2];

endmodule
