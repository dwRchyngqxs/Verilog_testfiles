module top();

input [1:0] D;
input C;
output [1:0] Q;

always @(posedge C)
  Q <= D;

endmodule
