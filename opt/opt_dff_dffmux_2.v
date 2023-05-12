module opt_dffmuxext_signed(input clk, ce, input signed [1:0] i, output reg signed [3:0] o);
    always @(posedge clk) if (ce) o <= i;
endmodule
