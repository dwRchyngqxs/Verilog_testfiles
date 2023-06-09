module top(input [3:0] A, B, C, input S, output [2:0] O);

wire [3:0] tb = A + B;
wire [3:0] tc = A + C;

assign O = S ? tb[3:1] : tc[3:1];

endmodule
