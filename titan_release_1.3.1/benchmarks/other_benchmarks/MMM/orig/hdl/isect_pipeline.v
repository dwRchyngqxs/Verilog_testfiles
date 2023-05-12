`include "defs.vh"

module isect_pipeline
(
	input i_clk,
	input i_reset,
	
	input i_go,
	output reg o_done,
	
	input i_mode,
	input i_nocliques,
	input [`MAX_VERTSBITS-1:0] i_start,
	input [`MAX_VERTSBITS-1:0] i_end,
	input [`MAX_CLIQUESIZEBITS-1:0] i_local_maxsize,
	input [`MAX_CLIQUESIZEBITS-1:0] i_cur_size,
	
	output reg [`MAX_VERTSBITS-1:0] o_first_vertex,
	output reg [`STACK_WIDTHAD-1:0] o_write_ptr,
	output reg [`STACK_WIDTHAD-1:0] o_lastread_ptr,
	output reg o_no_children,
	
	output reg [`MAX_VERTSBITS-1:0] o_mspv_raddr,
	input [`MAX_CLIQUESIZEBITS-1:0] i_mspv_q,
	output reg o_mspv_enable,
	
	output reg o_matrix_req,
	output reg [`MAX_VERTSBITS-1:0] o_matrix_i,
	output reg [`MAX_VERTSBITS-1:0] o_matrix_j,
	input i_matrix_valid,
	input i_matrix_isconn,
	output reg o_matrix_squash,
	input i_matrix_stalled
);

localparam VERTEX_MODE = 1'b0, STACK_MODE = 1'b1;

//
// Pipeline control
//

reg pipeline_enable;
reg pipeline_squash;

always @* begin
	pipeline_enable = ~i_matrix_stalled;
end


//
// Read/write pointer control
//

reg [`MAX_VERTSBITS-1:0] read_ptr, read_ptr_din;
reg [`STACK_WIDTHAD-1:0] write_ptr, write_ptr_din;
reg [`STACK_WIDTHAD-1:0] write_ptr_minus_1, write_ptr_minus_1_din;
reg [`STACK_WIDTHAD-1:0] lastread_ptr, lastread_ptr_din;
reg read_ptr_load;
reg read_ptr_inc;
reg write_ptr_load;
reg write_ptr_inc;
reg lastread_ptr_load;
reg lastread_ptr_inc;

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		read_ptr <= 'd0;
	end
	else if (pipeline_enable) begin
		if (read_ptr_load) read_ptr <= read_ptr_din;
		else if (read_ptr_inc) read_ptr <= read_ptr + 1;
	end
end

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		write_ptr <= 'd0;
		write_ptr_minus_1 <= -1;
	end
	else if (pipeline_enable) begin
		if (write_ptr_load) begin
			write_ptr <= write_ptr_din;
			write_ptr_minus_1 <= write_ptr_minus_1_din;
		end
		else if (write_ptr_inc) begin
			write_ptr <= write_ptr + 1;
			write_ptr_minus_1 <= write_ptr_minus_1 + 1;
		end
	end
end

//
// Vstack
//

reg [`STACK_WIDTHAD-1:0] vstack_raddr;
reg [`STACK_WIDTHAD-1:0] vstack_waddr;
reg [`STACK_WIDTH-1:0] vstack_din;
wire [`STACK_WIDTH-1:0] vstack_q;
reg vstack_we;
altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(`STACK_WIDTH),
	.width_b(`STACK_WIDTH),
	.widthad_a(`STACK_WIDTHAD),
	.widthad_b(`STACK_WIDTHAD)
) vstack
(
	.clock0(i_clk),
	.clock1(i_clk),
	.address_a(vstack_waddr),
	.address_b(vstack_raddr),
	.data_a(vstack_din),
	.q_b(vstack_q),
	.wren_a(vstack_we),
	.clocken1(pipeline_enable),
	.clocken0(pipeline_enable)
);


//
// Vars
//

reg test1_nochildren, test1_nochildren_set, test1_nochildren_clear;
reg test2_nochildren, test2_nochildren_set, test2_nochildren_clear;
reg done, done_set, done_clear;

reg vspan_done;

reg mode; reg mode_load;
reg [`MAX_VERTSBITS-1:0] end_ptr; reg end_ptr_load;
reg [`STACK_WIDTHAD-1:0] start_ptr; reg start_ptr_load;

reg firstflag, firstflag_set, firstflag_clear;
reg lastflag;
reg [`MAX_VERTSBITS-1:0] vcount;
reg valid;

reg stage1_firstflag;
reg stage1_lastflag;
reg [`MAX_VERTSBITS-1:0] stage1_vcount;
reg stage1_valid;

reg tests_load;
reg [`MAX_CLIQUESIZEBITS-1:0] test1; reg test1_dec1, test1_dec2;
reg [`MAX_CLIQUESIZEBITS-1:0] test2; reg test2_dec;

//
// Producer state machine
//

localparam [2:0] S_IDLE=3'd0, S_VMODE=3'd1, S_SMODE = 3'd2, S_DRAIN = 3'd3, S_DONE = 3'd4;
reg [2:0] state, nextstate;

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		state <= S_IDLE;
	
		done <= 1'b0;
	end
	else if (pipeline_enable) begin
		state <= nextstate;
		
		if (test1_nochildren_set) test1_nochildren <= 1'b1;
		else if (test1_nochildren_clear) test1_nochildren <= 1'b0;
		
		if (test2_nochildren_set) test2_nochildren <= 1'b1;
		else if (test2_nochildren_clear) test2_nochildren <= 1'b0;
		
		if (done_clear) done <= 1'b0;
		else if (done_set) done <= 1'b1;
		
		if (firstflag_clear) firstflag <= 1'b0;
		else if (firstflag_set) firstflag <= 1'b1;
		
		if (mode_load) mode <= i_mode;
		if (end_ptr_load) end_ptr <= i_end;
		
		if (tests_load) test1 <= i_local_maxsize - i_cur_size;
		else if (test1_dec1 || test1_dec2) test1 <= test1 - 1;
		
		if (tests_load) test2 <= i_local_maxsize - i_cur_size;
		else if (test2_dec) test2 <= test2 - 1;
		
		if (lastread_ptr_load) lastread_ptr <= lastread_ptr_din;
		else if (lastread_ptr_inc) lastread_ptr <= lastread_ptr + 1;
		
		stage1_firstflag <= firstflag;
		stage1_lastflag <= lastflag;
		stage1_vcount <= vcount;
		stage1_valid <= valid & ~pipeline_squash;
	end
end


always @* begin
	nextstate = state;
	
	read_ptr_din = 'bx; read_ptr_load = 1'b0; read_ptr_inc = 1'b0;
	lastread_ptr_din = 'bx; lastread_ptr_load = 1'b0;
	write_ptr_din = 'bx; write_ptr_load = 1'b0;
	write_ptr_minus_1_din = 'bx;
	
	firstflag_set = 1'b0; firstflag_clear = 1'b0;
	done_set = 1'b0; done_clear = 1'b0;
	test1_nochildren_set = 1'b0;
	test2_nochildren_set = 1'b0;
	valid = 1'b0;
	vcount = 'bx;
	lastflag = 1'b0;
	mode_load = 1'b0;
	end_ptr_load = 1'b0;
	tests_load = 1'b0;
	
	vstack_raddr = 'bx;
	
	o_done = done;
		
	case (state)
		S_IDLE: begin
			if (i_go) begin
				write_ptr_din = (i_mode == VERTEX_MODE)? 'b0 : i_end + 1;
				write_ptr_minus_1_din = (i_mode == VERTEX_MODE)? -1 : i_end;
				write_ptr_load = 1'b1;
				lastread_ptr_din = (i_mode == VERTEX_MODE)? -1 : i_end; lastread_ptr_load = 1'b1;
				read_ptr_din = i_start;
				firstflag_set = 1'b1;
				read_ptr_load = 1'b1;
				end_ptr_load = 1'b1;
				mode_load = 1'b1;
				tests_load = 1'b1;
				test1_nochildren_set = 1'b1;
				test2_nochildren_set = 1'b1;
				done_clear = 1'b1;
				
				if (i_start == i_end && i_mode == VERTEX_MODE) begin
					nextstate = S_IDLE;
					done_clear = 1'b0;
					done_set = 1'b1;
				end
				else begin
					nextstate = (i_mode == VERTEX_MODE)? S_VMODE : S_SMODE;
				end
			end
		end
		
		S_VMODE: begin
			valid = ~pipeline_squash;
			firstflag_clear = 1'b1;
			vcount = read_ptr;
			read_ptr_inc = 1'b1;
			
			if (vspan_done) begin
				done_set = 1'b1;
				nextstate = S_IDLE;
			end
			else if (read_ptr == end_ptr) begin
				lastflag = 1'b1;
				nextstate = S_DRAIN;
			end
		end
		
		S_SMODE: begin
			firstflag_clear = 1'b1;
			vstack_raddr = read_ptr[`STACK_WIDTHAD-1:0];
			
			if (read_ptr != write_ptr) begin
				valid = ~pipeline_squash;
				read_ptr_inc = 1'b1;
			end
			
			if (vspan_done) begin
				done_set = 1'b1;
				nextstate = S_IDLE;
			end
			else if (read_ptr == end_ptr) begin
				lastflag = 1'b1;
				
				if (firstflag) begin
					done_set = 1'b1;
					nextstate = S_IDLE;
				end
				else begin
					nextstate = S_DRAIN;
				end
			end
		end
		
		S_DRAIN: begin
			if (vspan_done) begin
				done_set = 1'b1;
				nextstate = S_IDLE;
			end
		end
		
		default: begin
		end
	endcase
end
	
//
// Stage 1
//

reg [`MAX_VERTSBITS-1:0] stage1_v; reg stage1_v_load;
reg [`MAX_VERTSBITS-1:0] stage1_cur_v;

reg [`MAX_VERTSBITS-1:0] test2stage1_v;

wire [`MAX_VERTSBITS-1:0] stage2_u;
wire stage2_lastflag;
pipe_delay #
(
	.WIDTH(1 + `MAX_VERTSBITS),
	.CYCLES(`CACHE_HIT_LATENCY)
) stage1_stage2_delay
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_in({stage1_lastflag, stage1_cur_v}),
	.o_out({stage2_lastflag, stage2_u}),
	.i_enable(pipeline_enable)
);

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		stage1_v <= 'd0;
	end
	else if (pipeline_enable) begin
		if (stage1_v_load) stage1_v <= stage1_cur_v;
		test2stage1_v <= stage1_cur_v;
	end
end

always @* begin
	stage1_cur_v = (mode == VERTEX_MODE)? stage1_vcount : vstack_q;	
	stage1_v_load = 1'b0;
	
	test1_dec2 = 1'b0;
	test2_dec = 1'b0;
	
	o_matrix_i = 'bx;
	o_matrix_j = 'bx;
	o_matrix_req = 1'b0;
	o_matrix_squash = pipeline_squash;
	
	o_first_vertex = stage1_v;
	
	if (stage1_valid) begin
		if (stage1_firstflag) begin
			stage1_v_load = 1'b1;
			o_first_vertex = stage1_cur_v;
			test2_dec = ~i_nocliques;
			test1_dec2 = ~i_nocliques;
		end
		else begin
			o_matrix_i = stage1_v;
			o_matrix_j = stage1_cur_v;
			o_matrix_req = 1'b1;
		end
	end
end

// Test2 Stage 1

always @* begin
	o_mspv_raddr = test2stage1_v;
	o_mspv_enable = pipeline_enable;
end

//
// Test2 Stage 2
//

reg stage2_test2_pass_din;
wire stage2_test2_pass;
pipe_delay #
(
	.WIDTH(1),
	.CYCLES(`CACHE_HIT_LATENCY - `MSPV_LATENCY - 1)
) test2stage1_stage2_delay
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_enable(pipeline_enable),
	.i_in(stage2_test2_pass_din),
	.o_out(stage2_test2_pass)
);

always @* begin
	stage2_test2_pass_din = (i_mspv_q >= test2);
end

//
// Stage 2
//

always @* begin
	vstack_we = 1'b0;
	vstack_waddr = 'bx;
	vstack_din = 'bx;
	
	write_ptr_inc = 1'b0;
	lastread_ptr_inc = 1'b0;
	test1_dec1 = 1'b0;
	
	vspan_done = 1'b0;
	pipeline_squash = 1'b0;
	
	test1_nochildren_clear = 1'b0;
	test2_nochildren_clear = 1'b0;
	o_no_children = test1_nochildren || test2_nochildren;
	o_write_ptr = write_ptr_minus_1;
	o_lastread_ptr = lastread_ptr;
	
	if (i_matrix_valid) begin
		if (i_matrix_isconn) begin
			// local_maxsize - cur_size - n_children < 2 ON THE NEXT CYCLE
			if (test1 < 3) begin
				test1_nochildren_clear = 1'b1;
			end
			test1_dec1 = 1'b1;
		
			if (stage2_test2_pass) begin
				test2_nochildren_clear = 1'b1;
				lastread_ptr_inc = 1'b1;
			end
			
			vstack_waddr = write_ptr;
			vstack_din = stage2_u;
			vstack_we = 1'b1;
			write_ptr_inc = 1'b1;
		end	
		
		if (test2_nochildren && !stage2_test2_pass) begin
			vspan_done = 1'b1;
			pipeline_squash = 1'b1;
		end
		
		if (stage2_lastflag) begin
			vspan_done = 1'b1;
		end
	end
end		


endmodule
