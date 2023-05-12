`include "defs.vh"

module clique_buffer
(
	input i_clk300,
	input i_clk150,
	input i_reset,
	
	// Cliques come in through here
	input [`MAX_CLIQUESIZEBITS-1:0] i_clq_size,
	input i_clq_valid,
	input i_clq_strobe,
	input [15:0] i_clq_vertex,
	
	// Control/administrative stuff
	input i_clear,
	output reg o_clear_done,
	input i_dump,
	output reg o_dump_done,
	input [`MAX_CLIQUESIZEBITS-1:0] i_init_global_maxsize,
	output reg [`MAX_CLIQUESIZEBITS-1:0] o_global_maxsize,
	
	// Cliques get output through here
	output reg [31:0] o_data,
	output reg o_data_valid,
	input i_data_ready
);

reg [15:0] waddr, waddr_din;
reg [15:0] wdata, wdata_din;
reg we, we_din;
reg [14:0] raddr;
wire [31:0] rdata;
reg mem_enable;
altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(16),
	.widthad_a(16),
	.width_b(32),
	.widthad_b(15),
	.ram_block_type("M144K"),
	.clock_enable_input_b("NORMAL")
) buffer_mem
(
	.clock0(i_clk300),
	.address_a(waddr),
	.data_a(wdata),
	.wren_a(we),
	.clock1(i_clk150),
	.address_b(raddr),
	.q_b(rdata),
	.clocken1(mem_enable)
);

reg [15:0] waddr_cnt, waddr_cnt_din; reg waddr_cnt_inc, waddr_cnt_load;
reg [`MAX_CLIQUESIZEBITS-1:0] global_maxsize, global_maxsize_din; reg global_maxsize_load;
reg [15:0] n_cliques, n_cliques_din; reg n_cliques_load, n_cliques_inc;

wire [15:0] max_buf_cliques;
altsyncram #
(
	.operation_mode("SINGLE_PORT"),
	.width_a(16),
	.widthad_a(5),
	.init_file("../hdl/max_buf_cliques.mif"),
	.outdata_reg_a("CLOCK0")
) max_buf_cliques_mem
(
	.clock0(i_clk300),
	.address_a(global_maxsize),
	.q_a(max_buf_cliques)
);

//
// Write side
//

localparam [1:0] WS_CLEAR = 2'd0, WS_WORKING = 2'd1;
reg [1:0] wstate, wnextstate;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		wstate <= WS_WORKING;
		waddr_cnt <= 'd0;
		
		we <= 1'b0;
		waddr <= 'bx;
		wdata <= 'bx;
	end
	else begin
		wstate <= wnextstate;
		
		if (waddr_cnt_load) waddr_cnt <= waddr_cnt_din;
		else if (waddr_cnt_inc) waddr_cnt <= waddr_cnt + 16'd1;
				
		if (global_maxsize_load) global_maxsize <= global_maxsize_din;
		
		if (n_cliques_load) n_cliques <= n_cliques_din;
		else if (n_cliques_inc) n_cliques <= n_cliques + 1;
				
		we <= we_din;
		waddr <= waddr_din;
		wdata <= wdata_din;
	end
end
	
	
always @* begin
	wnextstate = wstate;
	
	wdata_din = i_clq_vertex;
	we_din = 1'b0;
	waddr_din = 'bx;
	
	o_global_maxsize = global_maxsize;
	o_clear_done = 1'b0;
	
	n_cliques_din = 'bx; n_cliques_load = 1'b0; n_cliques_inc = 1'b0;
	waddr_cnt_din = 'bx; waddr_cnt_load = 1'b0; waddr_cnt_inc = 1'b0;
	global_maxsize_din = 'bx; global_maxsize_load = 1'b0;
	
	case (wstate) 
		WS_WORKING: begin
			if (i_clq_valid) begin
				global_maxsize_din = i_clq_size;
				
				if (i_clq_size > global_maxsize) begin
					global_maxsize_load = 1'b1;
					we_din = 1'b1;
					waddr_din = 'd0;	
					waddr_cnt_din = 1; waddr_cnt_load = 1'b1;
					n_cliques_din = 0; n_cliques_load = 1'b1;
				end
				else if (i_clq_size == global_maxsize && n_cliques != max_buf_cliques) begin
					waddr_din = waddr_cnt;
					we_din = 1'b1;
					waddr_cnt_inc = 1'b1;
					n_cliques_inc = i_clq_strobe;
				end
			end
			
			if (i_clear) begin
				wnextstate = WS_CLEAR;
			end
		end
		
		WS_CLEAR: begin
			o_clear_done = 1'b1;
			
			n_cliques_din = 0; n_cliques_load = 1'b1;
			waddr_cnt_din = 0; waddr_cnt_load = 1'b1;
			global_maxsize_din = i_init_global_maxsize; global_maxsize_load = 1'b1;
			
			if (!i_clear) begin
				wnextstate = WS_WORKING;
			end
		end
		
		default: begin
		end
	endcase 
end


//
// Read side
//

localparam S_IDLE=2'd0, S_DUMPVERTS = 2'd1, S_DONE = 2'd2;

reg [14:0] raddr_cnt; reg raddr_cnt_reset, raddr_cnt_inc;
reg [1:0] state, nextstate;

reg valid, valid_reg;
reg pipeline_enable;

always @ (posedge i_clk150 or posedge i_reset) begin
	if (i_reset) begin
		raddr_cnt <= 'd0;
		state <= S_IDLE;
		valid_reg <= 1'b0;
	end
	else begin
		if (raddr_cnt_reset) raddr_cnt <= 'd0;
		else if (raddr_cnt_inc) raddr_cnt <= raddr_cnt + 1;
		
		state <= nextstate;
		
		if (pipeline_enable) begin
			valid_reg <= valid;
		end
	end
end

always @* begin
	nextstate = state;
	
	raddr_cnt_inc = 1'b0;
	raddr_cnt_reset = 1'b0;
	raddr = raddr_cnt;
	
	valid = 1'b0;
	o_dump_done = 1'b0;
	o_data = rdata;
	o_data_valid = valid_reg;
	pipeline_enable = 1'b1;
	
	case (state)
		S_IDLE: begin
			o_data[31:16] = global_maxsize;
			o_data[15:0] = n_cliques;
			raddr_cnt_reset = 1'b1;
			
			if (i_dump) begin
				o_data_valid = 1'b1;				
				if (i_data_ready) begin
					if (n_cliques == 0) begin
						nextstate = S_DONE;
					end
					else begin
						nextstate = S_DUMPVERTS;
					end
				end
			end
		end
		
		S_DUMPVERTS: begin		
			pipeline_enable = !(o_data_valid && !i_data_ready);
			
			if (pipeline_enable) begin
				raddr_cnt_inc = 1'b1;
			end
			
			if ({raddr_cnt, 1'b0} < waddr_cnt) begin
				valid = 1'b1;
			end
			
			if (!valid && !o_data_valid) begin
				nextstate = S_DONE;
			end
		end
		
		S_DONE: begin
			o_dump_done = 1'b1;
			if (!i_dump) begin
				nextstate = S_IDLE;
			end
		end
	endcase
	
	mem_enable = pipeline_enable;
end


endmodule
