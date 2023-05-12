module opt_dffmuxext_const_init(input clk, ce, input [1:0] i, (* init=6'b0x00x1 *) output reg [5:0] o);
    always @(posedge clk) if (ce) o <= {1'b0, i[1], 2'b1x, i[0], 1'bz};
endmodule
