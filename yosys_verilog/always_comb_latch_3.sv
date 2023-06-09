module top;
logic x;
logic z;
assign z = 1'b1;
always_comb begin
    logic y;
    case (x)
    1'b0:
        y = 1;
    endcase
    if (z)
        x = y;
    else
        x = 1'b0;
end
endmodule
