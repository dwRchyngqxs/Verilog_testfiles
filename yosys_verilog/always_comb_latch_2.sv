module top;
logic x;
always_comb begin
    logic y;
    if (x)
        x = 1;
    else
        y = 1;
    x = y;
end
endmodule
