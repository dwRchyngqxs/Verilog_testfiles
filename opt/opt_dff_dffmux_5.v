module opt_dffmuxext_unsigned_rst(input clk, ce, rst, input [1:0] i, output reg [3:0] o);
    always @(posedge clk) if (rst) o <= 0; else if (ce) o <= i;
endmodule
