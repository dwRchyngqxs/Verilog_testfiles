module top(input clk, clr, pre, output reg q0 = 1'b0, output reg q1 = 1'b1);
always @(posedge clk or posedge clr)
    if (clr)
        q0 <= 1'b0;
    else
        q0 <= ~q0;
always @(posedge clk or posedge pre)
    if (pre)
        q1 <= 1'b1;
    else
        q1 <= ~q1;
endmodule
