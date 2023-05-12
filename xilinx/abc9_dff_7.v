module top(input clk, input a, b, output o);
reg r1, r2;
always @(posedge clk) begin
    r1 <= a | b;
    r2 <= ~(~a & ~b);
end
assign o = r1 | r2;
endmodule
