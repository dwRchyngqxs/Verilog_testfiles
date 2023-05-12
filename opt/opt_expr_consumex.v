module top(input a, b, output o);
wire tmp;
assign o = tmp | 1'bx;
assign tmp = a & 1'b0;
endmodule
