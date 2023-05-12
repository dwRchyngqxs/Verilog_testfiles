module top ();

input clk, rst, d1, d2;
output q1, q2;

always @(posedge clk)
	if (clk)
		q1 <= d1;

always @(posedge clk, posedge rst)
	if (rst)
		q2 <= 0;
	else if (clk)
		q2 <= d2;

endmodule
