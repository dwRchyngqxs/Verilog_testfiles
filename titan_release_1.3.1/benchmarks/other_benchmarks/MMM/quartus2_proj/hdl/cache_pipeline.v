`include "defs.vh"

module cache_pipeline
(
	input i_clk300,
	input i_reset,
	
	// DDR interface
	output reg [`MEM_ADDRBITS-1:0] o_ddr_raddr,
	input [`MEM_WIDTH-1:0] i_ddr_rdata,
	output reg o_ddr_rdata_req,
	input i_ddr_rdata_valid,
	input i_ddr_rdata_req_accepted,
	
	// Cache control
	input i_cache_clear,
	
	// Work pipeline
	input i_matrix_req,
	input [`MAX_PROBSBITS-1:0] i_matrix_prob,
	input [`MAX_VERTSBITS-1:0] i_matrix_i,
	input [`MAX_VERTSBITS-1:0] i_matrix_j,
	input [`MAX_VERTSBITS-1:0] i_matrix_nverts,
	output o_matrix_valid,
	output o_matrix_isconn,
	input i_matrix_squash,
	output o_matrix_stalled
);

reg pipeline_enable;

//
// Data memory
//

reg [`MEM_WIDTH-1:0] data_wdata;
reg [`CACHE_DEPTHBITS-1:0] data_waddr;
reg data_we;
reg [`CACHE_DEPTHBITS+5-1:0] data_raddr;
wire [3:0] data_rdata;

altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(`MEM_WIDTH),
	.widthad_a(`CACHE_DEPTHBITS),
	.width_b(4),
	.widthad_b(`CACHE_DEPTHBITS + 5),
	.ram_block_type("M9K"),
	.outdata_reg_b("CLOCK1")
) data_mem
(
	.clock0(i_clk300),
	.address_a(data_waddr),
	.clocken1(pipeline_enable),
	.data_a(data_wdata),
	.wren_a(data_we),
	.clock1(i_clk300),
	.address_b(data_raddr),
	.q_b(data_rdata)
);

//
// Tag memory
//

reg [`CACHE_TAGSIZE-1:0] tag_wdata;
reg [`CACHE_NBLOCKSBITS-1:0] tag_waddr;
reg tag_we;
reg [`CACHE_NBLOCKSBITS-1:0] tag_raddr;
wire [`CACHE_TAGSIZE-1:0] tag_rdata;

altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(`CACHE_TAGSIZE),
	.widthad_a(`CACHE_NBLOCKSBITS),
	.width_b(`CACHE_TAGSIZE),
	.widthad_b(`CACHE_NBLOCKSBITS)/*,
	.outdata_reg_b("CLOCK1")*/
) tag_mem
(
	.clock0(i_clk300),
	.address_a(tag_waddr),
	.data_a(tag_wdata),
	.wren_a(tag_we),
	.clock1(i_clk300),
	.address_b(tag_raddr),
	.clocken1(pipeline_enable),
	.q_b(tag_rdata)
);

//
// Valid bits
//

reg [`CACHE_NBLOCKS-1:0] vbits_wdata;
reg vbits_we;
reg [`CACHE_NBLOCKSBITS-1:0] vbits_raddr;
wire vbits_rdata;

altsyncram #
(
	.operation_mode("DUAL_PORT"),
	.width_a(`CACHE_NBLOCKS),
	.widthad_a(1),
	.width_b(1),
	.widthad_b(`CACHE_NBLOCKSBITS),
	.numwords_a(1),
	.numwords_b(32)/*,
	.outdata_reg_b("CLOCK1")*/
) vbits_mem
(
	.clock0(i_clk300),
	.address_a(1'b0),
	.data_a(vbits_wdata),
	.wren_a(vbits_we),
	.clock1(i_clk300),
	.address_b(vbits_raddr),
	.clocken1(pipeline_enable),
	.q_b(vbits_rdata)
);

reg [`CACHE_NBLOCKS-1:0] vbits_rdata_par;
always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		vbits_rdata_par <= 'd0;
	end
	else if (pipeline_enable) begin
		if (vbits_we) vbits_rdata_par <= vbits_wdata;
	end
end


// Stage 0 - Address generation



/*
altmult_add #
(
	.number_of_multipliers(2),
	.width_a(`MAX_VERTSBITS),
	.width_b(`MAX_VERTSBITS),
	.width_result(2*`MAX_VERTSBITS),
	.input_register_a0("CLOCK0"),
	.input_register_a1("CLOCK0"),
	.input_register_a2("CLOCK0"),
	.input_register_a3("CLOCK0"),
	.input_register_b0("CLOCK0"),
	.input_register_b1("CLOCK0"),
	.input_register_b2("CLOCK0"),
	.input_register_b3("CLOCK0"),
	.output_register("UNREGISTERED"),
	.multiplier_register0("CLOCK0"),
	.multiplier_register1("CLOCK0")
) mult
(
	.dataa( {{(`MAX_VERTSBITS-1){1'b0}}, 1'b1, i_matrix_i} ),
	.datab( {i_matrix_j, i_matrix_nverts} ),
	.clock0(i_clk300),
	.ena0(stage0_enable),
	.result(stage1_raddr_pipe)
);*/




reg stage0_enable;

reg [`MAX_VERTSBITS-1:0] stage05_matrix_j;
reg stage05_req;
wire [2 * `MAX_VERTSBITS-1:0] stage05_raddr;

reg [2 * `MAX_VERTSBITS - 1 : 0] stage1_raddr_pipe;
reg stage1_req_pipe;

lpm_mult #
(
	.lpm_widtha(`MAX_VERTSBITS),
	.lpm_widthb(`MAX_VERTSBITS),
	.lpm_widthp(2 * `MAX_VERTSBITS),
	.lpm_representation("UNSIGNED"),
	.lpm_pipeline(1),
	.dedicated_multiplier_circuitry("NO")
) mult
(
	.clock(i_clk300),
	.dataa(i_matrix_i),
	.datab(i_matrix_nverts),
	.clken(stage0_enable),
	.result(stage05_raddr)
);

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		stage05_req <= 1'b0;
		stage1_req_pipe <= 1'b0;
	end
	else if (stage0_enable) begin
		stage05_req <= i_matrix_req & !i_matrix_squash;
		stage05_matrix_j <= i_matrix_j;
		
		stage1_req_pipe <= stage05_req & !i_matrix_squash;		
		stage1_raddr_pipe <= stage05_raddr + stage05_matrix_j;
	end
end

// Stage 1 - Access data, tags, valid bits

wire [2 * `MAX_VERTSBITS - 1 : 0] stage1_raddr_retry;
wire stage1_req_retry;

localparam STAGE1_PIPE = 1'b0, STAGE1_RETRY = 1'b1;
reg stage1_pipe_sel;
reg [2 * `MAX_VERTSBITS - 1 : 0] stage1_raddr;
reg stage1_req;

always @* begin
	if (stage1_pipe_sel == STAGE1_PIPE) begin
		stage1_raddr = stage1_raddr_pipe;
		stage1_req = stage1_req_pipe;
	end
	else begin
		stage1_raddr = stage1_raddr_retry;
		stage1_req = stage1_req_retry;
	end
		
	data_raddr = stage1_raddr[`CACHE_DEPTHBITS+`MEM_WIDTHBITS-1 : 2];
	tag_raddr = stage1_raddr[`CACHE_DEPTHBITS+`MEM_WIDTHBITS-1 -: `CACHE_NBLOCKSBITS];
	vbits_raddr = stage1_raddr[`CACHE_DEPTHBITS+`MEM_WIDTHBITS-1 -: `CACHE_NBLOCKSBITS];
end

reg stage2_req;
reg [2*`MAX_VERTSBITS-1 : 0] stage2_raddr;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		stage2_req <= 'd0;
		stage2_raddr <= 'd0;
	end
	else if (pipeline_enable) begin
		stage2_req <= stage1_req & !i_matrix_squash;
		stage2_raddr <= stage1_raddr;
	end
end

// Retry pipeline

reg retry_pipe_enable;

pipe_delay #
(
	.WIDTH(2 * `MAX_VERTSBITS + 1),
	.CYCLES(2)
) retry_pipe
(
	.i_clk(i_clk300),
	.i_reset(i_reset),
	.i_enable(retry_pipe_enable),
	.i_in({stage1_raddr, stage1_req}),
	.o_out({stage1_raddr_retry, stage1_req_retry})
);

// Stage 2 - Extra data memory access cycle, calculate hit/miss

reg stage3_req;
reg [2*`MAX_VERTSBITS-1 : 0] stage3_raddr;
reg stage3_miss;
reg [`CACHE_NBLOCKS-1:0] stage3_new_vbits;
reg [`CACHE_NBLOCKS-1:0] stage3_old_vbits;


always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		stage3_req <= 1'b0;
		stage3_raddr <= 'd0;
		stage3_miss <= 1'b0;
		stage3_new_vbits <= 'bx;
		stage3_old_vbits <= 'bx;
	end
	else if (pipeline_enable) begin
		stage3_req <= stage2_req && !i_matrix_squash;
		stage3_raddr <= stage2_raddr;
		stage3_new_vbits <= 1 << (stage2_raddr[`CACHE_DEPTHBITS + `MEM_WIDTHBITS - 1 -: `CACHE_NBLOCKSBITS]);
		stage3_old_vbits <= vbits_rdata_par;
		stage3_miss <= stage2_req && !i_matrix_squash && 
				(!vbits_rdata || (stage2_raddr[2 * `MAX_VERTSBITS - 1 -: `CACHE_TAGSIZE] != tag_rdata));
	end
end

// Stage 3 - Mux data

wire stage4_rdata;
reg stage4_valid, stage4_valid_din;
reg stage3_enable;

reg [2*`MAX_VERTSBITS-`MEM_WIDTHBITS-1 : 0] stage4_raddr;

lpm_mux #
(
	.lpm_width(1),
	.lpm_size(4),
	.lpm_widths(2),
	.lpm_pipeline(1)
) matrix_mem_sel
(
	.clock(i_clk300),
	.data(data_rdata),
	.result(stage4_rdata),
	.sel(stage3_raddr[1:0]),
	.clken(stage3_enable)
);

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		stage4_valid <= 'd0;
	end
	else if (stage3_enable) begin
		stage4_valid <= stage3_req && !i_matrix_squash;
	end
end

// Stage 4 - output

assign o_matrix_isconn = stage4_rdata;
assign o_matrix_valid = stage4_valid;
assign o_matrix_stalled = !stage0_enable;

//
// Extra register stage to/from DDR arbiter tree
//

wire [`MEM_WIDTH-1:0] ddr_rdata;
wire ddr_rdata_valid;
pipe_interlock #
(
	.WIDTH(`MEM_WIDTH)
) from_ddr_extra_stage
(
	.i_clk(i_clk300),
	.i_reset(i_reset),
	.i_in(i_ddr_rdata),
	.i_have(i_ddr_rdata_valid),
	.o_want(),
	.o_out(ddr_rdata),
	.o_have(ddr_rdata_valid),
	.i_want(1'b1)
);

//
// State machine
//

localparam [2:0] S_STREAMING = 3'd0, S_SERVICE_MISS = 3'd1, S_RETRY_1 = 3'd2, S_RETRY_2 = 3'd3;
reg [2:0] state, nextstate;

reg [`CACHE_BLOCKSIZEBITS-1:0] fill_cnt; reg fill_cnt_reset, fill_cnt_inc;

always @ (posedge i_clk300 or posedge i_reset) begin
	if (i_reset) begin
		fill_cnt <= 'd0;
		state <= S_STREAMING;
	end
	else begin
		state <= nextstate;
		
		if (fill_cnt_reset) fill_cnt <= 'd0;
		else if (fill_cnt_inc) fill_cnt <= fill_cnt + 1;
	end
end

always @* begin
	nextstate = state;
	
	o_ddr_raddr = {i_matrix_prob[`MEM_PROBSBITS-1:0], stage3_raddr[2*`MAX_VERTSBITS-1 : `CACHE_BLOCKSIZEBITS + `MEM_WIDTHBITS], {`CACHE_BLOCKSIZEBITS{1'b0}} };
	o_ddr_rdata_req = 1'b0;
	
	data_wdata = ddr_rdata;
	data_we = 1'b0;
	data_waddr = 'bx;
	
	tag_waddr = 'bx;
	tag_wdata = 'bx;
	tag_we = 'bx;

	vbits_wdata = 'bx;
	vbits_we = 1'b0;
	
	fill_cnt_reset = 1'b0;
	fill_cnt_inc = 1'b0;
	
	stage1_pipe_sel = STAGE1_PIPE;
	stage0_enable = 1'b0;
	pipeline_enable = 1'b0;
	retry_pipe_enable = 1'b0;
	stage3_enable = 1'b0;
	
	case (state)
		S_STREAMING: begin
			stage0_enable = 1'b1;
			pipeline_enable = 1'b1;
			retry_pipe_enable = 1'b1;
			stage3_enable = 1'b1;
			
			fill_cnt_reset = 1'b1;

			vbits_wdata = 'd0;
			vbits_we = i_cache_clear;

			if (stage3_miss) begin
				stage0_enable = 1'b0;
				pipeline_enable = 1'b0;
				retry_pipe_enable = 1'b0;
				stage3_enable = 1'b0;
				
				o_ddr_rdata_req = 1'b1;
				if (i_ddr_rdata_req_accepted) begin
					nextstate = S_SERVICE_MISS;
				end
			end
		end
		
		S_SERVICE_MISS: begin
			tag_waddr = stage3_raddr[`CACHE_DEPTHBITS + `MEM_WIDTHBITS - 1 -: `CACHE_NBLOCKSBITS];
			tag_wdata = stage3_raddr[2 * `MAX_VERTSBITS - 1 -: `CACHE_TAGSIZE];
			tag_we = 1'b1;
			
			vbits_wdata = stage3_new_vbits | stage3_old_vbits;
			vbits_we = 1'b1;
			
			data_waddr = {stage3_raddr[`CACHE_DEPTHBITS + `MEM_WIDTHBITS - 1 -: `CACHE_NBLOCKSBITS], fill_cnt};
			if (ddr_rdata_valid) begin
				fill_cnt_inc = 1'b1;
				data_we = 1'b1;
				if (fill_cnt == `CACHE_BLOCKSIZE - 1) begin
					nextstate = S_RETRY_1;
				end
			end
		end
		
		S_RETRY_1: begin
			stage1_pipe_sel = STAGE1_RETRY;
			retry_pipe_enable = 1'b1;
			pipeline_enable = 1'b1;
			nextstate = S_RETRY_2;
		end
		
		S_RETRY_2: begin
			stage1_pipe_sel = STAGE1_RETRY;
			retry_pipe_enable = 1'b1;
			pipeline_enable = 1'b1;
			nextstate = S_STREAMING;
		end
					
		default: begin
		end

	endcase
end

	
endmodule

	