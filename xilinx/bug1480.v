module top();

input signed [17:0] A;
input signed [17:0] B;
output X;
output Y;

wire [35:0] P;
assign P = A * B;

assign X = P[0];
assign Y = P[35];

endmodule
