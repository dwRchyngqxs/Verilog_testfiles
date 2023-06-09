module t(input [3:0] A, input [3:0] B, output signed [3:0] Y);

wire [7:0] P = A * B;
wire signed [7:0] SP = P;
wire signed [3:0] SB = B;
assign Y = SP / SB;

endmodule
