module top();

input clk;
input en;
input s;

output [15:0] rd;
input [3:0] wa;
input [15:0] wd;

reg [15:0] mem[0:15];

assign rd = s ? wd : mem[wa];

always @(posedge clk) begin
	if (en) begin
		mem[wa] <= rd;
	end
end

endmodule
