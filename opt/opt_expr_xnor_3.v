module gold(input i, output [1:0] o, p, q);
assign o =  i ~^ i;
assign p =  1'b0 ~^ i;
assign q =  1'b1 ~^ i;
endmodule
