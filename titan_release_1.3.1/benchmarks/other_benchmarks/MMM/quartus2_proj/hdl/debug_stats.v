`include "defs.vh"

module big_counter #
(
	parameter WIDTH = 64
)
(
	input i_clk150,
	input i_reset,
	input i_enable,
	input i_sreset,
	output [WIDTH-1:0] o_count
);

reg en_delayed;
always @ (posedge i_clk150) en_delayed <= i_enable;

lpm_counter #
(
	.lpm_width(WIDTH)
) the_counter
(
	.clock(i_clk150),
	.aclr(i_reset),
	.q(o_count),
	.sclr(i_sreset),
	.cnt_en(en_delayed)
);
	
endmodule
	

module debug_stats
(
	input i_clk150,
	input i_reset,
	
	input [31:0] i_dbg_indata,
	input i_dbg_indata_have,
	output reg o_dbg_indata_want,
	
	output reg [63:0] o_dbg_outdata,
	input i_dbg_outdata_want,
	output reg o_dbg_outdata_have,
	
	input i_set_running,
	input [`N_UNITS-1:0] i_wu_busy
);

localparam CMD_READ = 16'd0, CMD_RESET = 16'd1;

wire [63:0] total_ticks;
wire [63:0] wu_ticks;
wire [63:0] wu_lb_ticks;
reg reset_counters;
reg load_value;

reg set_running;

reg [`N_UNITS-1:0] wu_busy;
reg [`N_UNITS-1:0] wu_busy_sr;
reg [`N_UNITSBITS-1:0] wu_busy_sr_counter;
reg wu_any_busy;

big_counter c0 (i_clk150, i_reset, set_running, reset_counters, total_ticks);
big_counter c1 (i_clk150, i_reset, wu_any_busy, reset_counters, wu_ticks);
big_counter c2 (i_clk150, i_reset, wu_busy_sr[0], reset_counters, wu_lb_ticks);

always @ (posedge i_clk150) begin
	if (load_value) begin
		case (i_dbg_indata[31:16])
			16'd0: o_dbg_outdata <= total_ticks;
			16'd1: o_dbg_outdata <= wu_ticks;
			16'd2: o_dbg_outdata <= wu_lb_ticks;
			default: o_dbg_outdata <= 64'hDEADBEEFBAADF00D;
		endcase
	end
end

always @ (posedge i_clk150 or posedge i_reset) begin
	if (i_reset) begin
		wu_busy <= 'd0;
		wu_busy_sr_counter <= 'd0;
		wu_busy_sr <= 'd0;
		wu_any_busy <= 'd0;
	end
	else begin
		wu_busy <= i_wu_busy;
		wu_busy_sr_counter <= wu_busy_sr_counter + 1;
		set_running <= i_set_running;
		
		if (wu_busy_sr_counter == 'd0) begin
			wu_busy_sr <= wu_busy;
			wu_any_busy <= (|wu_busy);
		end
		else begin
			wu_busy_sr <= {1'b0, wu_busy_sr[`N_UNITS-1:1]};
		end
	end
end	

always @* begin
	o_dbg_indata_want = 1'b1;
	reset_counters = 1'b0;
	load_value = 1'b0;
	
	if (i_dbg_indata_have) begin
		case (i_dbg_indata[15:0])
			CMD_RESET: begin
				reset_counters = 1'b1;
			end
			
			CMD_READ: begin
				load_value = 1'b1;
			end
			
			default: begin
			end
		endcase
	end
end	

endmodule
