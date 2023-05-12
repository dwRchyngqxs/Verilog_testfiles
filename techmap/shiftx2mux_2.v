module top(input [6:0] A, input [1:0] B, output [1:0] Y);
wire [7:0] AA = {1'bx, A};
assign Y = AA[B*2 +: 2];
endmodule
