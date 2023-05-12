module top(input clk);
    reg [-1:-1] x;
    reg good = 1;

    always @(posedge clk) begin
        case (36'sh100000000 + $left(x)) -1: good = 0; endcase
        assert (good);
    end
endmodule
