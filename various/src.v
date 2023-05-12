module top(input i, output o, p);
always @* o <= i;
always @* p = i;
endmodule
