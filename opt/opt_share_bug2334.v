module t(input [3:0] A, input [3:0] B, input [3:0] C, input S, output [3:0] Y);

wire [3:0] t = A + C;

assign Y = S ? A + B : {4{t[0]}};

endmodule
