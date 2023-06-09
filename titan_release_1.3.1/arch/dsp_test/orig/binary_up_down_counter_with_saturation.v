// Quartus II Verilog Template
// Binary up/down counter with saturation

module binary_up_down_counter_with_saturation
#(parameter WIDTH=32)
(
	input clk, enable, count_up, reset,
	output reg [WIDTH-1:0] count
);

	reg [WIDTH-1:0] direction;
	reg [WIDTH-1:0] limit;

	// Reset if needed, increment or decrement if counter is not saturated
	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			count <= 0;
		else if (enable == 1'b1)
		begin
			if (count_up)
			begin
				direction <= 1;
				limit <= {WIDTH{1'b1}};	 // max value is all 1's
			end
			else
			begin
				direction <= -1; 
				limit <= {WIDTH{1'b0}};
			end

			if (count != limit)
				count <= count + direction;
		end
	end

endmodule
