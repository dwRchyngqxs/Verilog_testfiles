module top(input a, output [3:0] y);
assign y[0] = a^1'b0;
assign y[1] = 1'b1^a;
assign y[2] = a~^1'b0;
assign y[3] = 1'b1^~a;
endmodule
