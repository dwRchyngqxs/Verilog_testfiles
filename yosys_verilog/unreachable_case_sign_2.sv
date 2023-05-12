module top(input clk);
    reg good = 1;
    reg signed [1:0] case_value = -1;

    always @(posedge clk) begin
        case (4'sb1111) 4'b0000: ; case_value: good = 0; endcase
        assert (good);
    end
endmodule
