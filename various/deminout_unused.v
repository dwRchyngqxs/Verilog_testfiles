module top(input clk, inout [7:0] x);

reg [3:0] ctr;
always @(posedge clk) ctr <= ctr + 1'b1;

assign x[7:4] = ctr;
endmodule
