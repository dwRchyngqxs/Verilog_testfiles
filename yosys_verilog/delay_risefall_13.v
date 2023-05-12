module test (clk, en, i, o);
    input clk, en, i;
    reg p;
    output o;
    always @ (posedge clk)
    begin
        if (en) begin
            p <= #(5:15:25) i;
        end else begin
            #(3:5:8) p <= i;
        end
    end
    assign #(10, 20, 15:20:30) o = p;
endmodule
