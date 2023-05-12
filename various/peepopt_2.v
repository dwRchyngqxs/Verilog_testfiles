module peepopt_shiftmul_1 (output [7:0] y, input [2:0] w);
assign y = 1'b1 >> (w * (3'b110));
endmodule
