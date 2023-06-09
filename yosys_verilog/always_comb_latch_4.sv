module top;
parameter AVOID_LATCH = 0;
logic x, z;
assign z = 1'b1;
always_comb begin
    logic y;
    if (z)
        y = 0;
    for (int i = 1; i == AVOID_LATCH; i++)
        y = 1;
    x = z ? y : 1'b0;
end
endmodule
