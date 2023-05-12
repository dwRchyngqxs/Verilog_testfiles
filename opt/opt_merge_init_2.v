module top(input clk, i, (* init = 2'b11 *) output [1:0] o);
  \$dff  #(
    .CLK_POLARITY(1'h1),
    .WIDTH(32'd1)
  ) ff1  (
    .CLK(clk),
    .D(i),
    .Q(o[1])
  );
  \$dff  #(
    .CLK_POLARITY(1'h1),
    .WIDTH(32'd1)
  ) ff0  (
    .CLK(clk),
    .D(i),
    .Q(o[0])
  );
endmodule
