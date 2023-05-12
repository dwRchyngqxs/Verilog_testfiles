module \$__XILINX_SHREG_ (input C, input D, input [31:0] L, input E, output Q, output SO);
  parameter DEPTH = 2;
  parameter [DEPTH-1:0] INIT = 0;
  parameter CLKPOL = 1;
  parameter ENPOL = 2;

  wire pos_clk = C == CLKPOL;
  reg pos_en;
  always @(E)
    if (ENPOL == 2) pos_en = 1'b1;
    else pos_en = (E == ENPOL[0]);

  reg [DEPTH-1:0] r;
  always @(posedge pos_clk)
    if (pos_en)
      r <= {r[DEPTH-2:0], D};

  assign Q = r[L];
  assign SO = r[DEPTH-1];
endmodule
