module top(input clk, d, output q);
\$_DFF_N_ dffn(.C(clk), .D(d), .Q(q));
endmodule
