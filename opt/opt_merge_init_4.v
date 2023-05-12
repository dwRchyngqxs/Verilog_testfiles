module top(input clk, i, (* init = 1'b0 *) output o, p);
  \$dff  #(
    .CLK_POLARITY(1'h1),
    .WIDTH(32'd1)
  ) ffo  (
    .CLK(clk),
    .D(i),
    .Q(o)
  );
  \$dff  #(
    .CLK_POLARITY(1'h1),
    .WIDTH(32'd1)
  ) ffp  (
    .CLK(clk),
    .D(i),
    .Q(p)
  );
endmodule
