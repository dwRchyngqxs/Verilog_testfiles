module top();

input [1:0] D;
input C, R;
output [1:0] Q;

always @(posedge C, posedge R)
  if (R)
    Q <= 0;
  else
    Q <= D;

endmodule
