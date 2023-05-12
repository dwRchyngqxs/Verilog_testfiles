module top(input clk);
    reg [-1:-1] x;
    reg good = 0;
    reg signed [31:0] zero = 0;

    always @(posedge clk) begin
        case ($left(x) + zero) 36'shfffffffff: good = 1; endcase
        assert (good);
    end
endmodule
