module top();

input [3:0] ra;
input [3:0] wa;

input [15:0] wd;
output reg [15:0] rd;
input en, clk;

reg [15:0] \mem[3] ;
reg [15:0] \mem[4] ;
reg [15:0] \mem[5] ;
reg [15:0] \mem[6] ;
reg [15:0] \mem[7] ;
reg [15:0] \mem[8] ;
reg [15:0] \mem[9] ;

always @(posedge clk) begin
	if (en && wa == 3)
		\mem[3] <= wd;
	if (en && wa == 4)
		\mem[4] <= wd;
	if (en && wa == 5)
		\mem[5] <= wd;
	if (en && wa == 6)
		\mem[6] <= wd;
	if (en && wa == 7)
		\mem[7] <= wd;
	if (en && wa == 8)
		\mem[8] <= wd;
	if (en && wa == 9)
		\mem[9] <= wd;
end

always @* begin
	rd = 16'bx;
	if (ra == 3)
		rd = \mem[3] ;
	if (ra == 4)
		rd = \mem[4] ;
	if (ra == 5)
		rd = \mem[5] ;
	if (ra == 6)
		rd = \mem[6] ;
	if (ra == 7)
		rd = \mem[7] ;
	if (ra == 8)
		rd = \mem[8] ;
	if (ra == 9)
		rd = \mem[9] ;
end

endmodule
