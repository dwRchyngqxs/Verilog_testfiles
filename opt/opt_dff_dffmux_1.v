module opt_dffmuxext_unsigned(input clk, ce, input [1:0] i, output reg [3:0] o);
    always @(posedge clk) if (ce) o <= i;
endmodule
