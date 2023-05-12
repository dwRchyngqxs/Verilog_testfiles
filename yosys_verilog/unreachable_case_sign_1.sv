module top(input clk);
    reg good = 0;

    always @(posedge clk) begin
        case (4'sb1111) 15: good = 1; 4'b0000: ; endcase
        assert (good);
    end
endmodule
