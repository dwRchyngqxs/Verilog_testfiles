module top(input clk, input a, b, output reg q1, output q2);
reg r;
always @(posedge clk) begin
    q1 <= a | b;
    r <= ~(~a & ~b);
end
assign q2 = r;
endmodule
