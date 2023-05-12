module peepopt_muldiv_0(input [1:0] i, output [1:0] o);
wire [3:0] t;
assign t = i * 3;
assign o = t / 3;
endmodule
