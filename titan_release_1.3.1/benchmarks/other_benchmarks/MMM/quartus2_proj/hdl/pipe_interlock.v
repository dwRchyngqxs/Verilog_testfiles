module pipe_interlock #
(
	parameter WIDTH = 1,
	parameter REGISTERED = 1
)
(
	input i_clk,
	input i_reset,
	
	input [WIDTH-1:0] i_in,
	input i_have,
	output reg o_want,
	
	output reg [WIDTH-1:0] o_out,
	output reg o_have,
	input i_want
);

reg [WIDTH-1:0] i2o_saved_data;
reg [WIDTH-1:0] i2o_data;
reg i2o_have;

generate
	if (REGISTERED) begin : registered
		always @ (posedge i_clk or posedge i_reset) begin
			if (i_reset) begin
				i2o_have <= 1'b0;
			end
			else if (o_want) begin
				i2o_have <= i_have;
				i2o_data <= i_in;
			end
		end
	end
	else begin
		always @* begin
			i2o_have = i_have;
			i2o_data = i_in;
		end
	end
endgenerate

	
always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		i2o_saved_data <= 'bx;
	end
	else if (o_want) begin
		i2o_saved_data <= i2o_data;
	end
end

reg blocked;
always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		blocked <= 1'b0;
	end
	else begin
		case (blocked)
			1'b0: begin
				if (i2o_have && !i_want) blocked <= 1'b1;
			end
			
			1'b1: begin
				if (i_want) blocked <= 1'b0;
			end
		endcase
	end
end

always @* begin
	case (blocked)
		1'b0: begin
			o_have = i2o_have;
			o_out = i2o_data;
			o_want = 1'b1;
		end
		
		1'b1: begin
			o_have = 1'b1;
			o_out = i2o_saved_data;
			o_want = 1'b0;
		end
	endcase
end


endmodule
