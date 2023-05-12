module top(
	input [3:0] addr,
	input [1:0] mode,
	input [3:0] wd1,
	input [3:0] wd2,
	input we1, we2,
	input re,
	input clk,
	output reg [3:0] rd
);

reg [3:0] wa1, wa2, ra;

always @* begin
	case (mode)
	0: begin
		wa1 = addr+1;
		wa2 = addr;
		ra = addr;
	end
	1: begin
		wa1 = addr;
		wa2 = addr+1;
		ra = addr;
	end
	2: begin
		wa1 = addr;
		wa2 = addr;
		ra = addr+1;
	end
	3: begin
		wa1 = addr;
		wa2 = addr+1;
		ra = addr+2;
	end
	endcase
end

reg [3:0] mem[0:15];

always @(posedge clk) begin
	if (we1)
		mem[wa1] <= wd1;
	if (we2)
		mem[wa2] <= wd2;
	if (re) begin
		rd <= mem[ra];
		if (we2 && wa2 == ra)
			rd <= wd2;
		if (we1 && wa1 == ra)
			rd <= wd1;
	end
end

endmodule
