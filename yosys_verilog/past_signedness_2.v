module top(input clk);
    reg signed [3:0] value = -1;
    reg ready = 0;

    always @(posedge clk) begin
        if (ready)
            assert ($past(value + 4'b0000) == 15);
        ready <= 1;
    end
endmodule
