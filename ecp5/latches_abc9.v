module top(input e, d, output q);
reg l;
always @*
    if (e)
        l = ~d;
assign q = ~l;
endmodule
