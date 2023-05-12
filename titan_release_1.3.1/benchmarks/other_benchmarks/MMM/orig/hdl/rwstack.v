module rwstack #
(
	parameter WIDTH = 1,
	parameter DEPTHBITS = 8
)
(
	input i_clk,
	input i_reset,
	input i_sreset,
	input i_enable,
	
	input [WIDTH-1:0] i_din,
	output reg [WIDTH-1:0] o_top,
	input i_push,
	input i_pop,
	output reg o_empty,
	output reg o_full
);

reg [DEPTHBITS:0] waddr;
reg [DEPTHBITS-1:0] raddr;
reg [WIDTH-1:0] top;
reg [WIDTH-1:0] din;
wire [WIDTH-1:0] q;
reg we;
reg top_filled;

altsyncram #
(
	.width_a(WIDTH),
	.widthad_a(DEPTHBITS),
	.width_b(WIDTH),
	.widthad_b(DEPTHBITS),
	.operation_mode("DUAL_PORT"),
	.ram_block_type("AUTO")
) mem
(
	.clock0(i_clk),
	.clock1(i_clk),
	.address_a(waddr[DEPTHBITS-1:0]),
	.address_b(raddr),
	.wren_a(we),
	.data_a(din),
	.q_b(q)
);

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		waddr <= 'b0;
		raddr <= -1;
		top <= 'd0;
		top_filled <= 1'b0;
	end
	else if (i_sreset) begin
		waddr <= 'b0;
		raddr <= -1;
		top <= 'd0;
		top_filled <= 1'b0;
	end
	else if (i_enable) begin
		if (i_push && !i_pop) begin
			top <= i_din;
			top_filled <= 1'b1;
			
			if (top_filled) begin
				raddr <= raddr + 1;
				waddr <= waddr + 1;
			end
		end
		else if (i_pop) begin
			top <= q;
			
			if (waddr == 'd0) begin
				top_filled <= 1'b0;
			end
			else begin
				raddr <= raddr - 1;
				waddr <= waddr - 1;
			end
		end
	end
end

always @* begin
	o_top = top;
	o_empty = !top_filled;
	o_full = (waddr == (2**DEPTHBITS));
	we = i_push;
	din = top;
end
	

endmodule
