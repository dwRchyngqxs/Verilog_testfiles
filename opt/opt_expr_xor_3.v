module top(input a, output [1:0] w, x, y, z);
assign w = a^1'b0;
assign x = a^1'b1;
assign y = a~^1'b0;
assign z = a~^1'b1;
endmodule
