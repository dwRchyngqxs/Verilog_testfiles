module peepopt_shiftmul_0 #(parameter N=3, parameter W=3) (input [N*W-1:0] i, input [$clog2(N)-1:0] s, output [W-1:0] o);
assign o = i[s*W+:W];
endmodule
