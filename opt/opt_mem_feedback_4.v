module top();

input clk;
input sel;
input [3:0] wa1;
input [3:0] wa2;
input [15:0] wd1;
input [3:0] ra;
output [15:0] rd;

reg [15:0] mem [0:15];

always @(posedge clk) begin
	mem[wa1] <= sel ? wd1 : mem[wa1];
	mem[wa2] <= mem[wa2];
end

assign rd = mem[ra];

endmodule
