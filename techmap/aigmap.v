module top(input i, j, s, output o, p);
assign o = s ? j : i;
assign p = ~i;
endmodule
