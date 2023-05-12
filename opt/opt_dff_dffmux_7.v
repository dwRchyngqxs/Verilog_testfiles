module opt_dffmuxext_signed_rst_init(input clk, ce, rstn, input signed [1:0] i, output reg signed [3:0] o);
    initial o <= 4'b0010;
    always @(posedge clk) begin
        if (ce) o <= i;
        if (!rstn) o <= 4'b1111;
    end
endmodule
