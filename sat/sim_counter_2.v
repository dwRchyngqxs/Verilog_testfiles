module top (clk, reset, cnt);

input		clk;
input		reset;
output	[7:0]	cnt;

reg	[7:0]	cnt;

always @(posedge clk)
	if (!reset)
		cnt = cnt + 1;
	else
		cnt = 0;

endmodule
