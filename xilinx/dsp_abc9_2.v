module top(input signed [24:0] A, input signed [17:0] B, output [47:0] P);
assign P = A * B;
endmodule
