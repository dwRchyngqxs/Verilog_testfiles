module top;
logic [4:0] x;
logic z;
assign z = 1'b1;
always_comb begin : foo
    x = '0;
    if (z) begin : bar
        for (int i = 0; i < 5; i++)
            x[i] = 1'b1;
    end
end
endmodule
