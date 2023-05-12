`include "defs.vh"

module work_unit
(
	input i_clk,
	input i_reset,
	
	input i_go,
	output reg o_busy,
	input [`MAX_VERTSBITS-1:0] i_nverts,
	input [`MAX_PROBSBITS-1:0] i_prob_no,
	input [`MAX_CLIQUESIZEBITS-1:0] i_global_maxsize,
	input i_nocliques,
	
	output [`MAX_CLIQUESIZEBITS-1:0] o_clq_size,
	output [15:0] o_clq_v,
	output o_clq_strobe,
	output o_clq_valid,
	input i_clq_accept,
	
	output [`MEM_ADDRBITS-1:0] o_ddr_raddr,
	input [`MEM_WIDTH-1:0] i_ddr_rdata,
	output o_ddr_rdata_req,
	input i_ddr_rdata_valid,
	input i_ddr_rdata_req_accepted
);

localparam VERTEX_MODE = 1'b0, STACK_MODE = 1'b1;

//
// Cache
//

wire matrix_req;
wire [`MAX_PROBSBITS-1:0] matrix_prob;
wire [`MAX_VERTSBITS-1:0] matrix_i;
wire [`MAX_VERTSBITS-1:0] matrix_j;
wire [`MAX_VERTSBITS-1:0] matrix_nverts;
wire matrix_valid;
wire matrix_isconn;
wire matrix_squash;
wire matrix_stalled;
reg cache_clear;

cache_pipeline cache
(
	.i_clk300(i_clk),
	.i_reset(i_reset),
	
	.o_ddr_raddr(o_ddr_raddr),
	.i_ddr_rdata(i_ddr_rdata),
	.o_ddr_rdata_req(o_ddr_rdata_req),
	.i_ddr_rdata_valid(i_ddr_rdata_valid),
	.i_ddr_rdata_req_accepted(i_ddr_rdata_req_accepted),
	
	.i_cache_clear(cache_clear),
	
	.i_matrix_req(matrix_req),
	.i_matrix_prob(matrix_prob),
	.i_matrix_i(matrix_i),
	.i_matrix_j(matrix_j),
	.i_matrix_nverts(matrix_nverts),
	.o_matrix_valid(matrix_valid),
	.o_matrix_isconn(matrix_isconn),
	.i_matrix_squash(matrix_squash),
	.o_matrix_stalled(matrix_stalled)
);

//
// Max Size Per Vertex
//

wire [`MAX_VERTSBITS-1:0] mspv_waddr;
wire [`MAX_VERTSBITS-1:0] mspv_raddr;
wire [`MAX_CLIQUESIZEBITS-1:0] mspv_din;
wire [`MAX_CLIQUESIZEBITS-1:0] mspv_q;
wire mspv_we;
wire mspv_enable;
altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(`MAX_CLIQUESIZEBITS),
	.width_b(`MAX_CLIQUESIZEBITS),
	.widthad_a(`MAX_VERTSBITS),
	.widthad_b(`MAX_VERTSBITS),
	.outdata_reg_b("CLOCK1")
) mspv_mem
(
	.clock0(i_clk),
	.clock1(i_clk),
	.address_a(mspv_waddr),
	.address_b(mspv_raddr),
	.data_a(mspv_din),
	.q_b(mspv_q),
	.wren_a(mspv_we),
	.clocken1(mspv_enable)
);

//
// Clique Storage
//

reg clq_sreset;
reg clq_add;
reg [`MAX_VERTSBITS-1:0] clq_addv;
reg clq_remove;
reg clq_report;
wire clq_ready;
wire clq_pipe_pending;
reg clq_update_mspv;
reg [`MAX_VERTSBITS-1:0] clq_mspv_vertex;
wire [`MAX_CLIQUESIZEBITS-1:0] clq_cursize;
wire [`MAX_CLIQUESIZEBITS-1:0] clq_local_maxsize;
wire [`MAX_PROBSBITS-1:0] clq_prob_no;
wire [15:0] clq_v;
wire [`MAX_CLIQUESIZEBITS-1:0] clq_size;
wire clq_strobe;
wire clq_valid;
wire clq_accept;


pipe_interlock #
(
	.WIDTH(16 + `MAX_CLIQUESIZEBITS + 1)
) clq_stack_extra_stage
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_in({clq_size, clq_v, clq_strobe}),
	.i_have(clq_valid),
	.o_want(clq_accept),
	.o_out({o_clq_size, o_clq_v, o_clq_strobe}),
	.o_have(o_clq_valid),
	.i_want(!(o_clq_valid && !i_clq_accept))
);


/*
assign o_clq_size = clq_size;
assign o_clq_v = clq_v;
assign o_clq_valid = clq_valid;
assign o_clq_strobe = clq_strobe;
assign clq_accept = i_clq_accept;
*/

clique_stack clq_stack
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_enable(1'b1),
	.i_sreset(clq_sreset),
	.i_addv(clq_addv),
	.i_add(clq_add),
	.i_remove(clq_remove),
	.i_report(clq_report),
	.o_ready(clq_ready),
	.o_pipe_pending(clq_pipe_pending),
	.i_nocliques(i_nocliques),
	.i_update_mspv(clq_update_mspv),
	.i_mspv_vertex(clq_mspv_vertex),
	.i_prob_no(clq_prob_no),
	.i_global_maxsize(i_global_maxsize),
	.o_cursize(clq_cursize),
	.o_local_maxsize(clq_local_maxsize),
	.o_mspv_waddr(mspv_waddr),
	.o_mspv_we(mspv_we),
	.o_mspv_din(mspv_din),
	.o_report_v(clq_v),
	.o_report_valid(clq_valid),
	.o_report_size(clq_size),
	.o_report_strobe(clq_strobe),
	.i_report_accept(clq_accept)
);

//
// Intersection pipeline
//

reg pipe_go;
wire pipe_done;
reg pipe_mode;
reg [`MAX_VERTSBITS-1:0] pipe_start;
reg [`MAX_VERTSBITS-1:0] pipe_end;
wire [`MAX_VERTSBITS-1:0] pipe_first_vertex;
wire [`STACK_WIDTHAD-1:0] pipe_end_write_ptr;
wire [`STACK_WIDTHAD-1:0] pipe_last_read_ptr;
wire pipe_no_children;
isect_pipeline pipe
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_go(pipe_go),
	.o_done(pipe_done),
	.i_mode(pipe_mode),
	.i_nocliques(i_nocliques),
	.i_start(pipe_start),
	.i_end(pipe_end),
	.i_local_maxsize(clq_local_maxsize),
	.i_cur_size(clq_cursize),
	.o_first_vertex(pipe_first_vertex),
	.o_write_ptr(pipe_end_write_ptr),
	.o_lastread_ptr(pipe_last_read_ptr),
	.o_no_children(pipe_no_children),
	.o_mspv_raddr(mspv_raddr),
	.i_mspv_q(mspv_q),
	.o_mspv_enable(mspv_enable),
	.o_matrix_req(matrix_req),
	.o_matrix_i(matrix_i),
	.o_matrix_j(matrix_j),
	.i_matrix_valid(matrix_valid),
	.i_matrix_isconn(matrix_isconn),
	.o_matrix_squash(matrix_squash),
	.i_matrix_stalled(matrix_stalled)
);

//
// Readptr/endptr stack
//

// store read_ptr, last_read_ptr, end_ptr, stubflag
reg [`STACK_WIDTHAD * 3 + 1 - 1:0] rwstack_din;
wire [`STACK_WIDTHAD * 3 + 1 - 1:0] rwstack_top;
reg rwstack_push;
reg rwstack_pop;
wire rwstack_empty;
reg rwstack_sreset;
rwstack #
(
	.WIDTH(`STACK_WIDTHAD * 3 + 1),
	.DEPTHBITS(`MAX_CLIQUESIZEBITS)
) pointer_stack
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_sreset(rwstack_sreset),
	.i_enable(1'b1),
	.i_push(rwstack_push),
	.i_pop(rwstack_pop),
	.i_din(rwstack_din),
	.o_top(rwstack_top),
	.o_empty(rwstack_empty)
);


//
// Vars
//

localparam [2:0] S_IDLE=3'd0, S_DO_VMODE=3'd1, S_WAIT_FOR_VMODE=3'd2, S_DO_SMODE=3'd3, S_WAIT_FOR_SMODE=3'd4, S_DONE=3'd5, S_POP=3'd6, S_INIT=3'd7;
reg [2:0] state, nextstate;

reg [`MAX_VERTSBITS-1:0] startv, startv_din; reg startv_load, startv_dec;
reg [`MAX_VERTSBITS-1:0] lastv, lastv_din; reg lastv_load;
reg [`MAX_VERTSBITS-1:0] nverts; reg nverts_load;
reg [`STACK_WIDTHAD-1:0] read_ptr, read_ptr_din; reg read_ptr_load, read_ptr_inc;
reg [`STACK_WIDTHAD-1:0] end_ptr, end_ptr_din; reg end_ptr_load;
reg [`STACK_WIDTHAD-1:0] next_read_ptr, next_read_ptr_din; reg next_read_ptr_load;
reg [`STACK_WIDTHAD-1:0] last_read_ptr, last_read_ptr_din; reg last_read_ptr_load;
reg [`MAX_PROBSBITS-1:0] prob_no; reg prob_no_load;
reg stubflag, stubflag_din, stubflag_load;
reg o_busy_set, o_busy_clear;

assign matrix_nverts = nverts;
assign matrix_prob = prob_no;
assign clq_prob_no = prob_no;

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		state <= S_IDLE;
		o_busy <= 1'b0;
	end
	else begin
		state <= nextstate;
		
		if (startv_load) startv <= startv_din;
		else if (startv_dec) startv <= startv - 1;
		
		if (lastv_load) lastv <= lastv_din;
		if (nverts_load) nverts <= i_nverts;
		if (prob_no_load) prob_no <= i_prob_no;
		
		if (read_ptr_load) read_ptr <= read_ptr_din;
		else if (read_ptr_inc) read_ptr <= read_ptr + 1;
		
		if (next_read_ptr_load) next_read_ptr <= next_read_ptr_din;
		if (last_read_ptr_load) last_read_ptr <= last_read_ptr_din;
		if (end_ptr_load) end_ptr <= end_ptr_din;
		if (stubflag_load) stubflag <= stubflag_din;
		
		if (o_busy_set) o_busy <= 1'b1;
		else if (o_busy_clear) o_busy <= 1'b0;
	end
end

always @* begin
	nextstate = state;
	
	startv_din = 'bx; startv_load = 1'b0; startv_dec = 1'b0;
	lastv_din = 'bx; lastv_load = 1'b0;
	nverts_load = 1'b0;
	prob_no_load = 1'b0;
	read_ptr_din = 'bx; read_ptr_load = 1'b0; read_ptr_inc = 1'b0;
	end_ptr_din = 'bx; end_ptr_load = 1'b0;
	next_read_ptr_din = 'bx; next_read_ptr_load = 1'b0;
	last_read_ptr_din = 'bx; last_read_ptr_load = 1'b0;
	stubflag_din = 1'bx; stubflag_load = 1'b0;
	
	cache_clear = 1'b0;
	
	clq_sreset = 1'b0;
	clq_add = 1'b0;
	clq_remove = 1'b0;
	clq_report = 1'b0;
	clq_update_mspv = 1'b0;
	clq_mspv_vertex = 'bx;
	clq_addv = 'bx;
	
	rwstack_push = 1'b0;
	rwstack_pop = 1'b0;
	rwstack_din = 'bx;
	rwstack_sreset = 1'b0;
	
	pipe_go = 1'b0;
	pipe_mode = 1'bx;
	pipe_start = 'bx;
	pipe_end = 'bx;
	
	o_busy_set = 1'b0;
	o_busy_clear = 1'b0;
		
	case (state) 
		S_IDLE: begin
			nverts_load = 1'b1;
			prob_no_load = 1'b1;
			if (i_go) begin
				o_busy_set = 1'b1;
				nextstate = S_INIT;
			end
		end
		
		S_INIT: begin
			cache_clear = 1'b1;
			clq_sreset = 1'b1;
			lastv_din = nverts-1; lastv_load = 1'b1;
			startv_din = nverts-1; startv_load = 1'b1;
			nextstate = S_DO_VMODE;
		end
		
		S_DO_VMODE: begin
			pipe_start = startv;
			pipe_end = lastv;
			pipe_mode = VERTEX_MODE;
			read_ptr_din = 'd0; read_ptr_load = 1'b1;
			stubflag_din = 1'b0; stubflag_load = 1'b1;
			rwstack_sreset = 1'b1;
			pipe_go = 1'b1;
			nextstate = S_WAIT_FOR_VMODE;
		end
		
		S_WAIT_FOR_VMODE: begin
			if (pipe_done && clq_ready) begin
				clq_add = 1'b1;
				clq_addv = startv;
				end_ptr_din = pipe_end_write_ptr; end_ptr_load = 1'b1;
				last_read_ptr_din = pipe_last_read_ptr; last_read_ptr_load = 1'b1;
				if (pipe_no_children) begin
					clq_report = 1'b1;
					clq_remove = 1'b1;
					clq_update_mspv = 1'b1;
					clq_mspv_vertex = startv;
					startv_dec = 1'b1;
					if (startv == 'd0) begin
						nextstate = S_DONE;
					end
					else begin
						nextstate = S_DO_VMODE;
					end
				end
				else begin
					nextstate = S_DO_SMODE;
				end
			end
		end
		
		S_DO_SMODE: begin
			next_read_ptr_din = end_ptr + 1; next_read_ptr_load = 1'b1;
			stubflag_din = (read_ptr == last_read_ptr); 
			pipe_start = read_ptr;
			pipe_end = end_ptr;
			pipe_mode = STACK_MODE;
			
			if (stubflag) begin
				nextstate = S_POP;
			end
			else begin
				stubflag_load = 1'b1;
				read_ptr_inc=1'b1;
				pipe_go = 1'b1;
				nextstate = S_WAIT_FOR_SMODE;
			end
		end
		
		S_WAIT_FOR_SMODE: begin
			if (pipe_done && clq_ready) begin
				stubflag_din = 1'b0; stubflag_load = 1'b1;
				if (pipe_no_children) begin
					clq_addv = pipe_first_vertex;
					clq_add = 1'b1;
					clq_report = 1'b1;
					clq_remove = 1'b1;
					
					if (stubflag) begin
						nextstate = S_POP;
					end
					else begin
						nextstate = S_DO_SMODE;
					end
				end
				else begin
					clq_addv = pipe_first_vertex;
					clq_add = 1'b1;					
					read_ptr_din = next_read_ptr; read_ptr_load = 1'b1;
					last_read_ptr_din = pipe_last_read_ptr; last_read_ptr_load = 1'b1;
					end_ptr_din = pipe_end_write_ptr; end_ptr_load = 1'b1;
					rwstack_din={read_ptr, last_read_ptr, end_ptr, stubflag};
					rwstack_push=1'b1;
					nextstate = S_DO_SMODE;
				end
			end
		end
		
		S_POP: begin
			if (clq_ready) begin
				clq_remove = 1'b1;
				if (rwstack_empty) begin
					clq_update_mspv = 1'b1;
					clq_mspv_vertex = startv;
					startv_dec = 1'b1;
					if (startv == 0) begin
						nextstate = S_DONE;
					end
					else begin
						nextstate = S_DO_VMODE;
					end
				end
				else begin
					{read_ptr_din, last_read_ptr_din, end_ptr_din, stubflag_din} = rwstack_top;
					read_ptr_load = 1'b1; last_read_ptr_load = 1'b1; end_ptr_load = 1'b1; stubflag_load = 1'b1;
					rwstack_pop = 1'b1;
					nextstate = S_DO_SMODE;
				end
			end
		end
		
		S_DONE: begin
			if (!clq_pipe_pending) begin
				o_busy_clear = 1'b1;
				nextstate = S_IDLE;
			end
		end
	endcase
end
	
	

	



endmodule

