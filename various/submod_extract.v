  module test(input [7:0] a, b, c, d, output [7:0] x, y, z);
    assign x = a + b, y = b + c, z = c + d;
  endmodule
