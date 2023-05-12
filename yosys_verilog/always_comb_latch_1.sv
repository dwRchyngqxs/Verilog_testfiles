module top;
logic x;
always_comb begin
    logic y;
    if (x)
        y = 1;
    x = y;
end
endmodule
