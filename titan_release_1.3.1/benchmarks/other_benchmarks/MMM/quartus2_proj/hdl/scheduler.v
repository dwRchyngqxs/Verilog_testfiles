`include "defs.vh"

module scheduler
(
	input i_clk150,
	input i_clk300,
	input i_reset,
	
	// Main control
	input [`MAX_PROBSBITS-1:0] i_mc_prob_no,
	input [`MAX_VERTSBITS-1:0] i_mc_nverts,
	output reg o_mc_can_alloc,
	output reg o_mc_can_commit,
	input i_mc_commit,
	output reg o_mc_pending,
	
	// Work units
	output reg [`N_UNITS-1:0] o_wu_go,
	input [`N_UNITS-1:0] i_wu_busy,
	output reg [`MAX_VERTSBITS-1:0] o_wu_nverts,
	output reg [`MAX_PROBSBITS-1:0] o_wu_prob_no
);

reg [`MAX_PROBSBITS + `MAX_VERTSBITS - 1:0] task_fifo_din;
wire [`MAX_PROBSBITS + `MAX_VERTSBITS - 1:0] task_fifo_q;
reg task_fifo_rdreq;
reg task_fifo_wrreq;
wire task_fifo_empty;
wire task_fifo_full;
wire task_fifo_wrempty;
dcfifo #
(
	.lpm_width(`MAX_PROBSBITS + `MAX_VERTSBITS),
	.lpm_widthu(3),
	.lpm_numwords(8),
	.lpm_showahead("ON"),
	.overflow_checking("OFF"),
	.underflow_checking("OFF"),
	.clocks_are_synchronized("TRUE")
) task_fifo
(
	.data(task_fifo_din),
	.rdclk(i_clk300),
	.wrclk(i_clk150),
	.wrreq(task_fifo_wrreq),
	.rdreq(task_fifo_rdreq),
	.aclr(i_reset),
	.q(task_fifo_q),
	.rdempty(task_fifo_empty),
	.wrempty(task_fifo_wrempty),
	.wrfull(task_fifo_full)
);

//
// Slow domain stuff (MC end)
//

reg [3:0] pending_reg;

always @ (posedge i_clk150 or posedge i_reset) begin
	if (i_reset) begin
		pending_reg <= 4'b0;
	end
	else begin
		pending_reg <= {pending_reg[2:0], i_mc_commit};
	end
end

always @* begin
	o_mc_can_alloc = 1'b1;
	o_mc_can_commit = !task_fifo_full;
	
	task_fifo_wrreq = i_mc_commit;
	task_fifo_din = {i_mc_nverts, i_mc_prob_no};
	
	o_mc_pending = !task_fifo_wrempty | (| pending_reg) | (| i_wu_busy);
end


//
// Fast domain
//
	
localparam [2:0] S_SCHED_PROBLEM = 3'd1, S_WAIT_PROBLEM = 3'd2;
reg [2:0] state, nextstate;

reg [`N_UNITS-1:0] first_avail, first_avail_din;	
reg [`MAX_PROBSBITS + `MAX_VERTSBITS - 1:0] delayed_q;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		state <= S_WAIT_PROBLEM;
		first_avail <= 'b0;
	end
	else begin
		state <= nextstate;
		
		delayed_q <= task_fifo_q;
		first_avail <= first_avail_din;
	end
end

reg [`N_UNITS-1:0] i, j, k;
reg and_tree[`N_UNITSBITS-1:0][`N_UNITS-1:0];

always @* begin
	for (i = 0; i < `N_UNITS; i = i + 1) begin : input_assignment
		and_tree[0][i] = i_wu_busy[i];
	end
	
	for (i = 1; i < `N_UNITSBITS; i = i + 1) begin: levels
		for (j = 0; j < (`N_UNITS >> i); j = j + 1) begin : ands
			and_tree[i][j] = and_tree[i-1][j*2] & and_tree[i-1][j*2+1];
		end
	end

	first_avail_din[0] = ~i_wu_busy[0];
	for (i = 1; i < `N_UNITS; i = i + 1) begin : calc_first_avail
		first_avail_din[i] = ~i_wu_busy[i];
		for (j = 0; j < `N_UNITSBITS; j = j + 1) begin
			if (i[j]) first_avail_din[i] = first_avail_din[i] & and_tree[j][ (i >> (j+1)) << 1 ];
		end
	end
end

always @* begin
	nextstate = state;
	
	task_fifo_rdreq = 1'b0;	
	o_wu_go = 'b0;
	{o_wu_nverts, o_wu_prob_no} = delayed_q;
	
	case (state)
		S_WAIT_PROBLEM: begin
			if ((i_wu_busy != {`N_UNITS{1'b1}}) && !task_fifo_empty) begin
				nextstate = S_SCHED_PROBLEM;
			end
		end
		
		S_SCHED_PROBLEM: begin
			o_wu_go = first_avail;
			task_fifo_rdreq = 1'b1;
			nextstate = S_WAIT_PROBLEM;
		end
			
		default: begin
		end
	endcase
end


endmodule
