module top();

input D1, D2, R, CLK;
output reg Q1, Q2;

always @(posedge CLK, posedge R) begin
	Q1 <= 0;
	if (!R) begin
		Q1 <= D1;
		Q2 <= D2;
	end
end

endmodule
