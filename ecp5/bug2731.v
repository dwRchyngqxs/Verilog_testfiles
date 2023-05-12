module top(input c, r, input [1:0] d, output reg [1:0] q);
TRELLIS_FF #(.REGSET("SET")) ff1(.CLK(c), .LSR(r), .DI(d[0]), .Q(q[0]));
TRELLIS_FF #(.REGSET("SET")) ff2(.CLK(c), .LSR(r), .DI(d[1]), .Q(q[1]));
endmodule
