module top(input clk);
    reg [-1:-1] x;
    reg good = 0;

    always @(posedge clk) begin
        case ($left(x)) 36'sh0ffffffff: good = 1; (32'h0 + $left(good)): ; endcase
        assert (good);
    end

endmodule
