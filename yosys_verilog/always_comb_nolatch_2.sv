module top;
logic [4:0] x;
logic z;
assign z = 1'b1;
always_comb begin
    x = '0;
    if (z) begin
        int i;
        for (i = 0; i < 5; i++) begin
            x[i] = 1'b1;
        end
    end
end
endmodule
