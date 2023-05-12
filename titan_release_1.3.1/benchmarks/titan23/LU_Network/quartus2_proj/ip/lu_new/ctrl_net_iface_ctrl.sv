import lu_new::*;

module ctrl_net_iface_ctrl
(
	input clk_b,
	input reset,
	
	// From overlord
	input i_go,
	output logic o_done,
	
	// To datapath
	output logic o_load_nblocks,
	output logic o_req_units0_clear,
	output logic o_req_units1_clear,
	output logic o_done_units_clear,
	output logic o_active_units_clear,
	output logic o_active_units_inc,
	output logic o_k_reset,
	output logic o_k_inc,
	input i_k_done,
	output logic o_j_load_k,
	output logic o_j_inc,
	input i_j_done,
	input i_all_active,
	input i_all_reqed0,
	input i_all_reqed1,
	input i_all_done,
	output logic o_msg_send,
	output logic o_msg_is_go,
	output logic o_msg_is_rdreq,
	output logic o_msg_rdreq_page,
	output logic o_msg_tomem,
	output logic o_msg_firstcol,
	input i_msg_sent
);

enum int unsigned
{
	S_IDLE,
	S_SETUP_MEMCTRL,
	S_JLOOP_START,
	S_BPU_GO,
	S_BPU_CPU_DONE,
	S_CPU_GO,
	S_CPU_LOOP,
	S_CPU_SEND_REQ0,
	S_CPU_SEND_REQ1,
	S_JLOOP_END,
	S_DONE
} state, nextstate;

always_ff @ (posedge clk_b or posedge reset) begin
	if (reset) state <= S_IDLE;
	else state <= nextstate;
end

always_comb begin
	nextstate = state;
	
	o_done = '0;
	o_load_nblocks = '0;
	o_req_units0_clear = '0;
	o_req_units1_clear = '0;
	o_done_units_clear = '0;
	o_active_units_clear = '0;
	o_active_units_inc = '0;
	o_k_reset = '0;
	o_k_inc = '0;
	o_j_load_k = '0;
	o_j_inc = '0;
	o_msg_send = '0;
	o_msg_is_go = 'x;
	o_msg_is_rdreq = 'x;
	o_msg_rdreq_page = 'x;
	o_msg_tomem = 'x;
	o_msg_firstcol = 'x;
	
	case (state)
		S_IDLE: begin
			o_load_nblocks = '1;
			o_k_reset = '1;
			
			if (i_go) nextstate = S_SETUP_MEMCTRL;
		end
		
		S_SETUP_MEMCTRL: begin
			o_msg_is_go = '1;
			o_msg_is_rdreq = '0;
			o_msg_tomem = '1;
			o_msg_send = '1;
			
			if (i_msg_sent) nextstate = S_JLOOP_START;
		end
		
		S_JLOOP_START: begin
			o_req_units0_clear = '1;
			o_req_units1_clear = '1;
			o_done_units_clear = '1;
			o_active_units_clear = '1;
			o_j_load_k = '1;
			
			nextstate = S_BPU_GO;
		end
		
		S_BPU_GO: begin
			o_msg_is_go = '1;
			o_msg_is_rdreq = '0;
			o_msg_tomem = '0;
			o_msg_firstcol = '1;
			o_msg_send = '1;
			
			if (i_msg_sent) begin
				o_active_units_inc = '1;
				nextstate = S_BPU_CPU_DONE;
			end
		end
		
		S_BPU_CPU_DONE: begin
			if (i_all_reqed0) begin
				nextstate = S_CPU_SEND_REQ0;
			end
			else if (i_all_reqed1) begin
				nextstate = S_CPU_SEND_REQ1;
			end
			else if (i_all_done) begin
				o_j_inc = '1;
				o_req_units0_clear = '1;
				o_req_units1_clear = '1;
				o_active_units_clear = '1;
				o_done_units_clear = '1;
				
				if (i_j_done) nextstate = S_JLOOP_END;
				else nextstate = S_CPU_GO;
			end
		end
		
		S_CPU_GO: begin
			o_msg_is_go = '1;
			o_msg_is_rdreq = '0;
			o_msg_tomem = '0;
			o_msg_firstcol = '0;
			o_msg_send = '1;
			
			if (i_msg_sent) begin
				o_active_units_inc = '1;
				nextstate = S_CPU_LOOP;
			end
		end
		
		S_CPU_LOOP: begin
			// Is the current compute group all spawned?
			// This happens when either all CPUs have been
			// assigned tasks, or we've reached the right
			// side of the matrix which requires less CPUs
			// than available.
			if (i_j_done || i_all_active) begin
				nextstate = S_BPU_CPU_DONE;
			end
			else begin
				o_j_inc = '1;
				nextstate = S_CPU_GO;
			end
		end
		
		S_CPU_SEND_REQ0: begin
			o_msg_is_go = '0;
			o_msg_is_rdreq = '1;
			o_msg_rdreq_page = 1'b0;
			o_msg_tomem = '1;
			o_msg_send = '1;
			o_req_units0_clear = '1;
			
			if (i_msg_sent) nextstate = S_BPU_CPU_DONE;
		end
		
		S_CPU_SEND_REQ1: begin
			o_msg_is_go = '0;
			o_msg_is_rdreq = '1;
			o_msg_rdreq_page = 1'b1;
			o_msg_tomem = '1;
			o_msg_send = '1;
			o_req_units1_clear = '1;
			
			if (i_msg_sent) nextstate = S_BPU_CPU_DONE;
		end
		
		S_JLOOP_END: begin
			o_k_inc = '1;
			if (i_k_done) nextstate = S_DONE;
			else nextstate = S_JLOOP_START;
		end
		
		S_DONE: begin
			o_done = '1;
			nextstate = S_IDLE;
		end
	endcase
end

endmodule
