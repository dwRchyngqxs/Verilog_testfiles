// Quartus II Verilog Template
// Unsigned Adder/Subtractor

module unsigned_adder_subtractor
#(parameter WIDTH=16)
(
	input [WIDTH-1:0] dataa,
	input [WIDTH-1:0] datab,
	input add_sub,	  // if this is 1, add; else subtract
	input clk,
	output reg [WIDTH:0] result
);

	always @ (posedge clk)
	begin
		if (add_sub)
			result <= dataa + datab;
		else
			result <= dataa - datab;
	end

endmodule
