module foo;
logic a [6:0][4:0][1:0];
logic b [1:0];

assign a[0][0][0] = 1'b0;
assign a[0][0][1] = 1'b1;
assign b = a[0][0];

endmodule
