module gold(input i, output [6:0] o);
assign o = {1'bx, 1'b0, 1'b0, 1'b1, 1'bx, 1'b1, i} ~^ {7{i}};
endmodule
