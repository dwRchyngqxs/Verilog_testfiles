module top(input [31:0] a, input signed [2:0] x, output [2:0] o);

wire [5:0] t = x * 3;
assign o = a >> t;

endmodule
