module gold (y, clk, w);
  input clk;
  wire [1:0] i;
  input w;
  output y;
  reg y = 1'h0;
  always @(posedge clk)
      y <= w;
  assign i = 2'h0;
endmodule
