`include "defs.vh"

module fillmem
(
	input i_clk150,
	input i_reset,
	
	// Main control
	input [31:0] i_indata,
	input i_indata_have,
	output reg o_indata_want,
	input i_go,
	output reg o_done,
	input i_ignore_prob,
	input [`MAX_PROBSBITS-1:0] i_prob_no,
	input[`MAX_VERTSBITS-1:0] i_nverts,
	
	// DDR interface
	output reg [`MEM_ADDRBITS-1:0] o_ddr_waddr,
	output reg [`MEM_WIDTH-1:0] o_ddr_wdata,
	output reg o_ddr_wdata_have,
	input i_ddr_wdata_accept
);

localparam NWORDS_WIDTH = 2*(`MAX_VERTSBITS) - 5 + 1;

// number of 32-bit words to transfer. nwords_result is actually minus 1
// to make counting easier (that's what the -24'd32 is for)
//wire [24:0] mad = i_nverts * i_nverts + (24'd31 - 24'd32);
wire [`MAX_VERTSBITS*2-1:0] mad;
wire [NWORDS_WIDTH-1:0] nwords_result = mad[2*`MAX_VERTSBITS-1:5];
altmult_add #
(
	.number_of_multipliers(2),
	.width_a(`MAX_VERTSBITS),
	.width_b(`MAX_VERTSBITS),
	.width_result(2*`MAX_VERTSBITS),
	.input_register_a0("UNREGISTERED"),
	.input_register_a1("UNREGISTERED"),
	.input_register_a2("UNREGISTERED"),
	.input_register_a3("UNREGISTERED"),
	.input_register_b0("UNREGISTERED"),
	.input_register_b1("UNREGISTERED"),
	.input_register_b2("UNREGISTERED"),
	.input_register_b3("UNREGISTERED"),
	.output_register("UNREGISTERED"),
	.multiplier_register0("UNREGISTERED"),
	.multiplier_register1("UNREGISTERED"),
	.multiplier1_direction("SUB")
) mult
(
	.dataa( {{(`MAX_VERTSBITS-1){1'b0}}, 1'b1, i_nverts} ),
	.datab( {{(`MAX_VERTSBITS-1){1'b0}}, 1'b1, i_nverts} ),
	//.clock0(i_clk150),
	.result(mad)
);

//
// Write side
//

localparam [2:0] S_IDLE = 3'd0, S_IGNORE_PROBLEM = 3'd1, S_FILL_PACKREG = 3'd2, S_DDR_WRITE = 3'd3, S_DONE = 3'd4;
reg [2:0] state, nextstate;

reg [NWORDS_WIDTH-1:0] nwords; reg nwords_load;
reg [NWORDS_WIDTH-1:0] nwords_cnt; reg nwords_cnt_reset, nwords_cnt_inc;
reg [`MEM_ADDRBITS-1:0] addr_cnt, addr_cnt_din; reg addr_cnt_load, addr_cnt_inc;
reg [`MEM_WIDTH-1:0] pack_reg; reg [31:0] pack_reg_din; reg pack_reg_reset, pack_reg_load;
reg lastword, lastword_din, lastword_load;

always @ (posedge i_clk150 or posedge i_reset) begin
	if (i_reset) begin
		state <= S_IDLE;
		
		nwords <= 'bx;
		nwords_cnt <= 'd0;
		addr_cnt <= 'bx;
		pack_reg <= 'bx;
		lastword <= 1'bx;
	end
	else begin
		state <= nextstate;
		
		if (nwords_load) nwords <= nwords_result;
		
		if (nwords_cnt_reset) nwords_cnt <= 'd0;
		else if (nwords_cnt_inc) nwords_cnt <= nwords_cnt + 1;
		
		if (addr_cnt_load) addr_cnt <= addr_cnt_din;
		else if (addr_cnt_inc) addr_cnt <= addr_cnt + 1;
		
		if (pack_reg_reset) pack_reg <= 'd0;
		else if (pack_reg_load) begin
			case (nwords_cnt[1:0])
				2'b00: pack_reg[31:0] <= pack_reg_din;
				2'b01: pack_reg[63:32] <= pack_reg_din;
				2'b10: pack_reg[95:64] <= pack_reg_din;
				2'b11: pack_reg[127:96] <= pack_reg_din;
			endcase
		end
		
		if (lastword_load) lastword <= lastword_din;
	end
end


always @* begin
	nextstate = state;

	nwords_load = 1'b0;
	nwords_cnt_reset = 1'b0; nwords_cnt_inc = 1'b0;
	addr_cnt_din = 'bx; addr_cnt_load = 1'b0; addr_cnt_inc = 1'b0;
	pack_reg_din = i_indata; pack_reg_reset = 1'b0; pack_reg_load = 1'b0;
	lastword_din = 1'bx; lastword_load = 1'b0;
	
	o_done = 1'b0;
	o_indata_want = 1'b0;
	
	o_ddr_waddr = 'bx;
	o_ddr_wdata = 'bx;
	o_ddr_wdata_have = 1'b0;
	
	case (state)
		S_IDLE: begin
			nwords_load = 1'b1;
			nwords_cnt_reset = 1'b1;
			addr_cnt_din[`MEM_ADDRBITS-1 -: `MEM_PROBSBITS] = i_prob_no[`MEM_PROBSBITS-1:0];
			addr_cnt_din[`MEM_ADDRBITS - `MEM_PROBSBITS - 1 : 0] = 0;
			addr_cnt_load = 1'b1;
			pack_reg_reset = 1'b1;
			lastword_din = 1'b0; lastword_load = 1'b1;
			
			if (i_go) begin
				if (i_ignore_prob) nextstate = S_IGNORE_PROBLEM;
				else nextstate = S_FILL_PACKREG;
			end
		end
		
		S_IGNORE_PROBLEM: begin
			o_indata_want = 1'b1;
			
			if (i_indata_have) begin
				nwords_cnt_inc = 1'b1;
				
				if (nwords_cnt == nwords) begin
					o_done = 1'b1;
					nextstate = S_IDLE;
				end
			end
		end
		
		S_FILL_PACKREG: begin
			o_indata_want = 1'b1;
			if (i_indata_have) begin
				nwords_cnt_inc = 1'b1;
				pack_reg_load = 1'b1;
				lastword_din = (nwords_cnt == nwords); lastword_load = 1'b1;
				
				if (nwords_cnt == nwords || nwords_cnt[1:0] == 2'b11) begin
					nextstate = S_DDR_WRITE;
				end
			end
		end
		
		S_DDR_WRITE: begin
			o_ddr_waddr = addr_cnt;
			o_ddr_wdata_have = 1'b1;
			o_ddr_wdata = pack_reg;
			
			if (i_ddr_wdata_accept) begin
				addr_cnt_inc = 1'b1;
				
				if (lastword) begin
					nextstate = S_DONE;
				end
				else begin
					nextstate = S_FILL_PACKREG;
				end
			end
		end
		
		S_DONE: begin
			o_done = 1'b1;
			nextstate = S_IDLE;
		end
		
		default: begin
		end
	endcase
end

endmodule
