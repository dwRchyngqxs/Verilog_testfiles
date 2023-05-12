module top(input clk, input d, output q);
reg r;
always @(posedge clk) begin
r <= d;
end
assign q = ~r;
endmodule
