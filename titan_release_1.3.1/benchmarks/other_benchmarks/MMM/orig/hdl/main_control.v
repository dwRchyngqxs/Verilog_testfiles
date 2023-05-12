`include "defs.vh"

module main_control
(
	input i_clk150,
	input i_reset,
	
	// Host input data
	input [31:0] i_indata,
	input i_indata_have,
	output reg o_indata_want,
	
	// Memory filler
	output reg [31:0] o_fillmem_data,
	output reg o_fillmem_have,
	input i_fillmem_want,
	output reg o_fillmem_go,
	input i_fillmem_done,
	output reg [`MAX_PROBSBITS-1:0] o_fillmem_prob_no,
	output reg [`MAX_VERTSBITS-1:0] o_fillmem_nverts,
	output reg o_fillmem_ignore_prob,
	
	// Output buffer
	output reg o_buf_clear,
	input i_buf_clear_done,
	output reg o_buf_dump,
	input i_buf_dump_done,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_buf_init_maxsize,
	input [`MAX_CLIQUESIZEBITS-1:0] i_buf_cur_maxsize,
	
	// Scheduler
	output reg [`MAX_PROBSBITS-1:0] o_sched_prob_no,
	output reg [`MAX_VERTSBITS-1:0] o_sched_nverts,
	input i_sched_can_alloc,
	input i_sched_can_commit,
	output reg o_sched_commit,
	input i_sched_pending,
	
	output reg o_nocliques,
	
	// Debug
	output reg o_dbg_working
);


reg [`MAX_VERTSBITS-1:0] n_verts, n_verts_din; reg n_verts_load;
reg lastprob, lastprob_din, lastprob_load;
reg [`MAX_CLIQUESIZEBITS-1:0] init_maxsize, init_maxsize_din; reg init_maxsize_load;
reg nocliques, nocliques_din, nocliques_load;
reg [`MAX_PROBSBITS-1:0] prob_no; reg prob_no_inc, prob_no_reset;

reg [3:0] state, nextstate;
localparam S_GLOBAL_HEADER = 4'd0, S_PROBLEM_HEADER = 4'd1, S_IGNORE_PROBLEM = 4'd2, S_FILLMEM = 4'd3,
			S_COMMIT_PROBLEM = 4'd4, S_DUMP = 4'd5, S_WAIT_CLEAR = 4'd6, S_CLEAR = 4'd7, S_WAIT_COMPLETE = 4'd8;

always @ (posedge i_clk150 or posedge i_reset) begin
	if (i_reset) begin
		state <= S_GLOBAL_HEADER;
		
		n_verts <= 'bx;
		nocliques <= 1'bx;
		lastprob <= 1'b0;
		prob_no <= 'd0;
	end
	else begin
		state <= nextstate;
		
		if (n_verts_load) n_verts <= n_verts_din;
		if (lastprob_load) lastprob <= lastprob_din;
		if (init_maxsize_load) init_maxsize <= i_indata[`MAX_CLIQUESIZEBITS-1:0];
		if (nocliques_load) nocliques <= nocliques_din;
		
		if (prob_no_reset) prob_no <= 'd0;
		else if (prob_no_inc) prob_no <= prob_no + 1;
	end
end

always @* begin
	nextstate = state;

	n_verts_din = 'bx; n_verts_load = 1'b0;
	lastprob_din = 1'bx; lastprob_load = 1'b0;
	init_maxsize_din = 'bx; init_maxsize_load = 1'b0;
	nocliques_din = 1'bx; nocliques_load = 1'b0;
	prob_no_reset = 1'b0; prob_no_inc = 1'b0;
	
	o_indata_want = 1'b0;
	
	o_fillmem_go = 1'b0;
	o_fillmem_data = 32'bx;
	o_fillmem_have = 1'b0;
	o_fillmem_prob_no = 'bx;
	o_fillmem_nverts = 'bx;
	o_fillmem_ignore_prob = 1'bx;
	
	o_buf_clear = 1'b0;
	o_buf_dump = 1'b0;
	o_buf_init_maxsize = 'bx;

	o_sched_prob_no = prob_no;
	o_sched_nverts = 'bx;
	o_sched_commit = 1'b0;
	
	o_nocliques = nocliques;
	
	o_dbg_working = (state != S_GLOBAL_HEADER);
	
	case (state)
		S_GLOBAL_HEADER: begin
			o_indata_want = 1'b1;
			init_maxsize_din = i_indata[`MAX_CLIQUESIZEBITS-1:0]; init_maxsize_load = 1'b1;
			nocliques_din = i_indata[31]; nocliques_load = 1'b1;
			o_buf_init_maxsize = init_maxsize_din;
			
			if (i_indata_have) begin
				nextstate = S_CLEAR;
			end
		end

		S_CLEAR: begin
			o_buf_clear = 1'b1;
			o_buf_init_maxsize = init_maxsize;
			
			if (i_buf_clear_done) begin
				nextstate = S_WAIT_CLEAR;
			end
		end
		
		S_WAIT_CLEAR: begin
			o_buf_clear = 1'b0;
			o_buf_init_maxsize = init_maxsize;
			
			if (!i_buf_clear_done) begin
				nextstate = S_PROBLEM_HEADER;
			end
		end
		
		S_PROBLEM_HEADER: begin
			o_indata_want = 1'b1;
			n_verts_din = i_indata[`MAX_VERTSBITS-1:0];
			n_verts_load = 1'b1;
			lastprob_din = i_indata[31];
			lastprob_load = 1'b1;
			
			if (i_indata_have) begin
				if (n_verts_din < i_buf_cur_maxsize) begin
					nextstate = S_IGNORE_PROBLEM;
				end
				else begin
					nextstate = S_FILLMEM;
				end
			end
		end
		
		S_IGNORE_PROBLEM: begin
			o_fillmem_go = 1'b1;
			o_fillmem_ignore_prob = 1'b1;
			o_fillmem_nverts = n_verts;
			o_fillmem_data = i_indata;
			o_fillmem_have = i_indata_have;
			o_indata_want = i_fillmem_want;
			
			if (i_fillmem_done) begin
				prob_no_inc = 1'b1;
				if (lastprob) begin
					nextstate = S_WAIT_COMPLETE;
				end
				else begin
					nextstate = S_PROBLEM_HEADER;
				end
			end
		end
		
		S_FILLMEM: begin
			o_fillmem_go = i_sched_can_alloc;
			o_fillmem_ignore_prob = 1'b0;
			o_fillmem_nverts = n_verts;
			o_fillmem_data = i_indata;
			o_fillmem_have = i_indata_have;
			o_fillmem_prob_no = prob_no;
			o_indata_want = i_fillmem_want;
			
			if (i_fillmem_done) begin
				nextstate = S_COMMIT_PROBLEM;
			end
		end
		
		S_COMMIT_PROBLEM: begin
			o_sched_nverts = n_verts;
			
			if (i_sched_can_commit) begin
				o_sched_commit = 1'b1;
				prob_no_inc = 1'b1;
				
				if (lastprob) begin
					nextstate = S_WAIT_COMPLETE;
				end
				else begin
					nextstate = S_PROBLEM_HEADER;
				end
			end
		end

		S_WAIT_COMPLETE: begin
			if (!i_sched_pending) begin
				prob_no_reset = 1'b1;
				nextstate = S_DUMP;
			end
		end
		
		S_DUMP: begin
			o_buf_dump = 1'b1;
			if (i_buf_dump_done) begin
				nextstate = S_GLOBAL_HEADER;
			end
		end
	endcase
end

endmodule
