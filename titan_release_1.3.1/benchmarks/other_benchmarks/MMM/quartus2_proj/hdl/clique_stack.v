`include "defs.vh"

module clique_stack
(
	input i_clk,
	input i_reset,
	input i_enable,
	input i_sreset,
	
	input [`MAX_VERTSBITS-1:0] i_addv,
	input i_add,
	input i_remove,
	input i_report,
	output o_ready,
	output reg o_pipe_pending,
	input i_nocliques,
	
	input i_update_mspv,
	input [`MAX_VERTSBITS-1:0] i_mspv_vertex,
	
	input [`MAX_PROBSBITS-1:0] i_prob_no,
	input [`MAX_CLIQUESIZEBITS-1:0] i_global_maxsize,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_cursize,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_local_maxsize,
	
	output reg [`MAX_VERTSBITS-1:0] o_mspv_waddr,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_mspv_din,
	output reg o_mspv_we,
	
	output reg [15:0] o_report_v,
	output reg o_report_valid,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_report_size,
	output reg o_report_strobe,
	input i_report_accept
);

reg [`MAX_CLIQUESIZEBITS-1:0] waddr; reg waddr_incr; reg waddr_decr;
reg [`MAX_CLIQUESIZEBITS-1:0] raddr; reg raddr_incr; reg raddr_reset;
reg [`MAX_VERTSBITS-1:0] din;
wire [`MAX_VERTSBITS-1:0] q;
reg we;
reg mem_enable;
altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(`MAX_VERTSBITS),
	.width_b(`MAX_VERTSBITS),
	.widthad_a(`MAX_CLIQUESIZEBITS),
	.widthad_b(`MAX_CLIQUESIZEBITS),
	.ram_block_type("MLAB"),
	.clock_enable_input_b("NORMAL")
) mem
(
	.clock0(i_clk),
	.clock1(i_clk),
	.address_a(waddr),
	.address_b(raddr),
	.data_a(din),
	.q_b(q),
	.wren_a(we),
	.clocken1(mem_enable)
);

//
// FIFO for buffering clique updates
//

localparam CMD_WIDTH=`MAX_VERTSBITS + 3;
reg fifo_rdreq;
wire fifo_empty;
wire fifo_full;
wire [`MAX_VERTSBITS-1:0] fifo_q_addv, fifo_d_addv;
wire fifo_q_add, fifo_d_add;
wire fifo_q_remove, fifo_d_remove;
wire fifo_q_report, fifo_d_report;
wire fifo_wrreq;
scfifo #
(
	.lpm_width(CMD_WIDTH),
	.lpm_numwords(8),
	.lpm_widthu(3),
	.lpm_showahead("ON"),
	.add_ram_output_register("ON"),
	.underflow_checking("OFF")
) cmd_fifo
(
	.data({fifo_d_addv, fifo_d_add, fifo_d_remove, fifo_d_report}),
	.clock(i_clk),
	.wrreq(fifo_wrreq),
	.rdreq(fifo_rdreq),
	.aclr(i_reset),
	.q({fifo_q_addv, fifo_q_add, fifo_q_remove, fifo_q_report}),
	.full(fifo_full),
	.empty(fifo_empty)
);

wire submit_req = i_add | i_remove | i_report;
pipe_interlock #
(
	.WIDTH(`MAX_VERTSBITS + 3)
) cmd_fifo_pre_stage
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.i_in({i_addv, i_add, i_remove, i_report}),
	.i_have(submit_req),
	.o_want(o_ready),
	.o_out({fifo_d_addv, fifo_d_add, fifo_d_remove, fifo_d_report}),
	.o_have(fifo_wrreq),
	.i_want(!fifo_full)
);

//
// Counts pending requests in fifo - the one built into scfifo is too laggy
//

reg [3:0] fifo_words;
reg fifo_fastempty;
always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		fifo_words <= 4'd0;
		fifo_fastempty <= 1'b1;
	end
	else begin
		if (submit_req && o_ready && !fifo_rdreq) begin
			fifo_words <= fifo_words + 4'd1;
			fifo_fastempty <= 1'b0;
		end
		
		if (fifo_rdreq && !(submit_req && o_ready)) begin
			fifo_words <= fifo_words - 4'd1;
			if (fifo_words == 4'd1) begin
				fifo_fastempty <= 1'b1;
			end
		end
	end
end
			

//
// Cursize, local_maxsize, and mspv handling
//

(*preserve*) reg [`MAX_CLIQUESIZEBITS-1:0] global_maxsize;
reg [`MAX_CLIQUESIZEBITS-1:0] local_maxsize, local_maxsize_plus_1; reg local_maxsize_incr;
reg [`MAX_CLIQUESIZEBITS-1:0] cur_size; reg cur_size_incr; reg cur_size_decr;

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		local_maxsize <= 'd0;
		local_maxsize_plus_1 <= 1;
		cur_size <= 'd0;
		global_maxsize <= 'd0;
	end
	else begin
		if (cur_size_incr && !cur_size_decr) cur_size <= cur_size + 1;
		if (cur_size_decr && !cur_size_incr) cur_size <= cur_size - 1;
		
		if (i_sreset) begin
			local_maxsize <= 'd0;
			local_maxsize_plus_1 <= 1;
		end
		else if (local_maxsize_incr) begin
			local_maxsize <= local_maxsize_plus_1;
			local_maxsize_plus_1 <= local_maxsize_plus_1 + 1;
		end
		
		global_maxsize <= i_global_maxsize;
	end
end

always @* begin
	local_maxsize_incr = 1'b0;
	cur_size_incr = i_add;
	cur_size_decr = i_remove;
	
	o_cursize = cur_size;
	o_local_maxsize = local_maxsize;
	
	o_mspv_waddr = i_mspv_vertex;
	o_mspv_we = i_update_mspv;
	o_mspv_din = local_maxsize;
	
	if (i_add && cur_size == local_maxsize) begin
		local_maxsize_incr = 1'b1;
		o_mspv_din = local_maxsize_plus_1;
	end
end

//
// Reporting interface
//

reg [`MAX_CLIQUESIZEBITS-1:0] waddr_minus_1;
reg report_valid;
reg report_muxsel, report_muxsel_din;
reg report_strobe;
reg [`MAX_CLIQUESIZEBITS-1:0] report_size;
reg delayed_remove, delayed_remove_set, delayed_remove_clear;

reg pipeline_enable;

reg [2:0] state, nextstate;
localparam [2:0] S_IDLE=3'd0, S_REPORTING_1 = 3'd1, S_REPORTING_2 = 3'd2, S_REPORT_NOCLIQUES = 3'd3,
						S_REMOVE=3'd4;

always @ (posedge i_clk or posedge i_reset) begin
	if (i_reset) begin
		state <= S_IDLE;
		raddr <= 'd0;
		waddr <= 'd0;
		waddr_minus_1 <= -1;
		o_report_valid <= 1'b0;
		o_report_strobe <= 1'b0;
		o_report_size <= 'bx;
		report_muxsel <= 1'b0;
		delayed_remove <= 1'b0;
	end
	else if (i_enable) begin
		state <= nextstate;
		
		if (waddr_incr && !waddr_decr) begin
			waddr <= waddr + 1;
			waddr_minus_1 <= waddr_minus_1 + 1;
		end
		
		if (!waddr_incr && waddr_decr) begin
			waddr <= waddr - 1;
			waddr_minus_1 <= waddr_minus_1 - 1;
		end
		
		if (raddr_reset) raddr <= 'd0;
		else if (raddr_incr) raddr <= raddr + 1;
		
		if (pipeline_enable) begin
			o_report_valid <= report_valid;
			o_report_strobe <= report_strobe;
			o_report_size <= report_size;
			report_muxsel <= report_muxsel_din;
		end
		
		if (delayed_remove_clear) delayed_remove <= 1'b0;
		else if (delayed_remove_set) delayed_remove <= 1'b1;
	end
end
	
always @* begin
	nextstate = state;
	
	waddr_incr = 1'b0;
	waddr_decr = 1'b0;
	raddr_incr = 1'b0;
	raddr_reset = 1'b0;
	
	fifo_rdreq = 1'b0;
	
	o_pipe_pending = !fifo_fastempty;
	o_report_v = report_muxsel? i_prob_no : q;
	
	report_valid = 1'b0;
	report_muxsel_din = 1'b0;
	report_strobe = 1'b0;
	report_size = waddr;
		
	din = fifo_q_addv;
	we = fifo_q_add;
	
	delayed_remove_set = 1'b0;
	delayed_remove_clear = 1'b0;
	
	pipeline_enable = !(o_report_valid && !i_report_accept);
	
	case (state)
		S_IDLE: begin
			if (!fifo_empty) begin
				fifo_rdreq = 1'b1;
				waddr_incr = fifo_q_add;
				waddr_decr = fifo_q_remove;
				raddr_reset = 1'b1;
				delayed_remove_set = fifo_q_remove;
				
				if (fifo_q_report) begin
					waddr_decr = 1'b0;
					
					if (i_nocliques) begin
						nextstate = S_REPORT_NOCLIQUES;
					end
					else begin
						nextstate = S_REPORTING_1;
					end
				end
			end
		end
		
		S_REPORT_NOCLIQUES: begin
			o_pipe_pending = 1'b1;
			if (waddr > global_maxsize) begin
				report_strobe = 1'b0;
				report_valid = 1'b1;
				
				if (pipeline_enable) begin
					nextstate = S_REMOVE;
				end
			end
			else begin
				nextstate = S_REMOVE;
			end
		end
		
		S_REPORTING_1: begin
			o_pipe_pending = 1'b1;
			report_muxsel_din = 1'b1;
			if (waddr < global_maxsize) begin
				nextstate = S_REMOVE;
			end
			else begin
				report_valid = 1'b1;
				if (pipeline_enable) begin
					nextstate = S_REPORTING_2;
				end
			end
		end
			
		S_REPORTING_2: begin
			o_pipe_pending = 1'b1;
			report_muxsel_din = 1'b0;
			report_valid = 1'b1;
			if (raddr == waddr_minus_1) begin
				report_strobe = 1'b1;
				if (pipeline_enable) begin
					nextstate = S_REMOVE;
				end
			end
			else if (pipeline_enable) begin
				raddr_incr = 1'b1;
			end					
		end
		
		S_REMOVE: begin
			waddr_decr = delayed_remove;
			delayed_remove_clear = 1'b1;
			nextstate = S_IDLE;
		end
		
		default: begin
		end
	endcase
	
	mem_enable = pipeline_enable;
end


	
endmodule

	
	