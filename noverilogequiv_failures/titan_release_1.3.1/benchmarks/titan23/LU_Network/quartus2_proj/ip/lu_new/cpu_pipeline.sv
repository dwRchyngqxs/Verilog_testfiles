`include "lu_new_pkg.sv"
import lu_new::*;

module cpu_pipeline #
(
	parameter IS_BPU = 1
)
(
	input clk,
	input reset,
	
	// Read counter control
	input i_k_reset,
	input i_k_inc,
	output o_k_done,
	
	input i_i_reset,
	input i_i_inc,
	input i_i_load_k1,
	output o_i_done,
	
	input i_j_reset,
	input i_j_inc,
	input i_j_load_k,
	input i_j_load_k1,
	output o_j_done,
	
	// Pipeline control
	input i_valid,
	input i_norm,
	input i_recip,
	input i_wr_top,
	input i_wr_left,
	input i_wr_cur,
	input i_whichpage,
	output o_pipe_empty,
	
	// Memory access
	output [CURLEFT_AWIDTH-1:0] o_cur_rd_addr [LANES],
	input [LANES-1:0][31:0] i_cur_rd_data [2],
	output [CURLEFT_AWIDTH-1:0] o_cur_wr_addr [LANES],
	output [LANES-1:0][31:0] o_cur_wr_data,
	output logic [LANES-1:0] o_cur_wr_enable [2],
	
	output [CURLEFT_AWIDTH-1:0] o_left_rd_addr [LANES],
	input [LANES-1:0][31:0] i_left_rd_data [2],
	output [CURLEFT_AWIDTH-1:0] o_left_wr_addr [LANES],
	output [LANES-1:0][31:0] o_left_wr_data,
	output logic [LANES-1:0] o_left_wr_enable [2],
	
	output [TOP_AWIDTH-1:0] o_top_rd_addr,
	input [TOP_DWIDTH-1:0] i_top_rd_data,
	output [TOP_AWIDTH-1:0] o_top_wr_addr,
	output [TOP_DWIDTH-1:0] o_top_wr_data,
	output [7:0] o_top_be,
	output logic o_top_wr_enable
);

genvar gi;

localparam L_TOP_RD = 3;
localparam C_TOP_RD = IS_BPU? 1 : 2;
localparam C_TOP_RD_MUX = C_TOP_RD + L_TOP_RD;

localparam L_DIV = 33;
localparam C_DIV = C_TOP_RD_MUX + 1;
localparam C_RECIP_WR = C_DIV + L_DIV;

localparam C_MULTIN_MUX = C_TOP_RD_MUX + 1;

localparam L_RECIP_RD = 2;
localparam C_RECIP_RD = C_MULTIN_MUX - 2;

localparam L_MULT = 11;
localparam C_MULT = IS_BPU ? C_MULTIN_MUX + 1 : C_TOP_RD_MUX + 1;

localparam L_CURLEFT_RD = 3;
localparam C_LEFT_RD_MUX = C_MULT - 1;
localparam C_LEFT_RD = C_LEFT_RD_MUX - L_CURLEFT_RD;
localparam C_LEFT_RDSWIZ = C_LEFT_RD - 1;

localparam L_SUB = 12;
localparam C_SUB = C_MULT + L_MULT;
localparam C_CUR_RD_MUX = C_SUB - 1;
localparam C_CUR_RD = C_CUR_RD_MUX - L_CURLEFT_RD;
localparam C_CUR_RDSWIZ = C_CUR_RD - 1;

localparam L_CURLEFT_WR = 2;
localparam C_CURLEFT_WR = L_SUB + C_SUB;
localparam C_WR_ADDR_SWIZ = C_CURLEFT_WR - 1;
localparam C_WR_WE_MASK = C_CURLEFT_WR - 1;
localparam C_WR_WE_SWIZ = C_WR_WE_MASK - 1;

localparam C_TOP_WR_MUX = L_SUB + C_SUB;
localparam C_TOP_WR = C_TOP_WR_MUX + 1;
localparam L_TOP_WR = 2;

localparam C_END = IS_BPU ? C_RECIP_WR : C_TOP_WR;




// Register some pipeline control signals
logic norm;
always_ff @ (posedge clk) begin
	norm <= i_norm;
end

// Read address counters
logic [BSIZEBITS-1:0] k_1, i_1, j_1;
logic [BSIZEBITS-1:0] k_1_plus_1;

// Tapped delays for valid signal
logic valid [1:C_END]  ;

// Tapped delays for i, j, k counters
logic [BSIZEBITS-1:0] icnt [2:C_TOP_WR];
logic [BSIZEBITS-1:0] jcnt [2:C_RECIP_WR];
logic [BSIZEBITS-1:0] kcnt [2:C_TOP_RD_MUX];

// Tapped delays for page address
logic whichpage [2:C_WR_WE_MASK];

// Write enables for end of pipeline
logic wr_left [2:C_WR_WE_MASK];
logic wr_cur [2:C_WR_WE_MASK];
logic wr_top [2:C_TOP_WR];

always_ff @ (posedge clk) begin
	valid[2] <= i_valid;
	icnt[2] <= i_1;
	jcnt[2] <= j_1;
	kcnt[2] <= k_1;
	whichpage[2] <= i_whichpage;
	wr_left[2] <= i_wr_left;
	wr_top[2] <= i_wr_top;
	wr_cur[2] <= i_wr_cur;
	
	for (int i = 3; i <= $high(valid); i++) valid[i] <= valid[i-1];
	for (int i = 3; i <= $high(icnt); i++) icnt[i] <= icnt[i-1];
	for (int i = 3; i <= $high(jcnt); i++) jcnt[i] <= jcnt[i-1];
	for (int i = 3; i <= $high(kcnt); i++) kcnt[i] <= kcnt[i-1];
	for (int i = 3; i <= $high(whichpage); i++) whichpage[i] <= whichpage[i-1];
	for (int i = 3; i <= $high(wr_left); i++) wr_left[i] <= wr_left[i-1];
	for (int i = 3; i <= $high(wr_cur); i++) wr_cur[i] <= wr_cur[i-1];
	for (int i = 3; i <= $high(wr_top); i++) wr_top[i] <= wr_top[i-1];
end


// Pipeline headend counter logic
assign k_1_plus_1 = k_1 + ((BSIZEBITS)'(1));
assign o_k_done = (k_1 == ((BSIZEBITS)'(BSIZE-1)));
assign o_i_done = (i_1[BSIZEBITS-1:BSIZEBITS-2] == '1); // i_1 >= 24, 48, 96, etc...
assign o_j_done = (j_1 == ((BSIZEBITS)'(BSIZE-1)));

always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		k_1 <= '0;
		i_1 <= '0;
		j_1 <= '0;
	end
	else begin
		if (i_k_reset) k_1 <= '0;
		else if (i_k_inc) k_1 <= k_1_plus_1;
		
		if (i_i_reset) i_1 <= '0;
		else if (i_i_load_k1) i_1 <= k_1_plus_1;
		else if (i_i_inc) i_1 <= i_1 + ((BSIZEBITS)'(LANES)); // !SIMD!
		
		if (i_j_reset) j_1 <= '0;
		else if (i_j_load_k1) j_1 <= k_1_plus_1;
		else if (i_j_load_k) j_1 <= k_1;
		else if (i_j_inc) j_1 <= j_1 + ((BSIZEBITS)'(1));
	end
end



// Left block read
logic [LANES-1:0][31:0] left_rd_data;

generate
for (gi = 0; gi < LANES; gi++) begin : left_rd
	// Calculate addr
	cpu_ram_addr_swiz #
	(
		.TOTAL_BITS(2*BSIZEBITS),
		.SWIZ_BITS(LANESBITS),
		.LANE(gi)
	) swiz
	(
		.clk(clk),
		.reset(reset),
		.i_addr( (C_LEFT_RDSWIZ == 1) ? {k_1, i_1 } : {kcnt[2], icnt[2]}),
		.o_addr(o_left_rd_addr[gi])
	);
	
	always_ff @ (posedge clk) begin
		left_rd_data[gi] <= whichpage[C_LEFT_RD_MUX] ? i_left_rd_data[1][gi][31:0] : i_left_rd_data[0][gi][31:0];
	end
end
endgenerate



// Cur block read
logic [LANES-1:0][31:0] cur_rd_data;

generate
for (gi = 0; gi < LANES; gi++) begin : cur_rd
	// Calculate addr
	cpu_ram_addr_swiz #
	(
		.TOTAL_BITS(2*BSIZEBITS),
		.SWIZ_BITS(LANESBITS),
		.LANE(gi)
	) swiz
	(
		.clk(clk),
		.reset(reset),
		.i_addr({jcnt[C_CUR_RDSWIZ], icnt[C_CUR_RDSWIZ]}),
		.o_addr(o_cur_rd_addr[gi])
	);
	
	always_ff @ (posedge clk) begin
		cur_rd_data[gi] <= whichpage[C_CUR_RD_MUX] ? i_cur_rd_data[1][gi][31:0] : i_cur_rd_data[0][gi][31:0];
	end
end
endgenerate


// Read top block
assign o_top_rd_addr = (C_TOP_RD == 1) ? {j_1, k_1[BSIZEBITS-1:3]} : {jcnt[2], kcnt[2][BSIZEBITS-1:3]};

// Top read data mux (256 to 32)
// Use lower 3 bits of top read addr (lower 3 bits of k) to select SIMD lane
logic [31:0] top_rd_data;
lpm_mux #
(
	.lpm_pipeline(1),
	.lpm_size(8),
	.lpm_width(32),
	.lpm_widths(3)
) top_read_data_mux
(
	.data(i_top_rd_data),
	.clock(clk),
	.sel(kcnt[C_TOP_RD_MUX][2:0]),
	.result(top_rd_data)
);

logic [31:0] mult_input;

generate
if (IS_BPU) begin : bpu_only
	// Reciprocal generator
	logic [31:0] div_result;
	divsp fpdiv
	(
		.clock(clk),
		.dataa(32'h3F800000),	// 1.0f
		.datab(top_rd_data),
		.result(div_result)
	);

	// Propagate reciprocal signal (simplifies state machine... trust me)
	logic recip_delayed;
	pipe_delay #(C_RECIP_WR - 1, 1) recip_pipe_delay (clk, reset, 1'b1, i_recip, recip_delayed);

	// (Delayed j counter used as address input for recip mem read and write)

	// Reciprocal memory
	logic [31:0] recip_out;
	altsyncram #
	(
		.operation_mode("DUAL_PORT"),
		.width_a(32),
		.widthad_a(BSIZEBITS),
		.width_b(32),
		.widthad_b(BSIZEBITS),
		.address_reg_b("CLOCK0"),
		.outdata_reg_b("CLOCK0"),
		.ram_block_type("MLAB")
	)
	recip_mem
	(
		.clock0(clk),
		.address_a(jcnt[C_RECIP_WR]),
		.data_a(div_result),
		.wren_a(recip_delayed & valid[C_RECIP_WR]),
		.address_b(jcnt[C_RECIP_RD]),
		.q_b(recip_out)
	);

	// Negate reciprocal. When passed through subtractor, result of multiplication will
	// have correct sign again.
	logic [31:0] recip_out_neg;
	assign recip_out_neg = {~recip_out[31], recip_out[30:0]};
	
	// Choose: reciprocal output or top memory output, as input into multiplier
	always_ff @ (posedge clk) begin
		mult_input <= norm ? recip_out_neg : top_rd_data;
	end
	
	// synthesis translate_off
	shortreal f_recip_in, f_recip_out;
	always_comb begin
		f_recip_in = $bitstoshortreal(div_result);
		f_recip_out = $bitstoshortreal(recip_out);
	end
	// synthesis translate_on
end
else begin : cpu_only
	assign mult_input = top_rd_data;
end
endgenerate

// Floating-point multiplier array, 11 cycle latency
logic [LANES-1:0][31:0] mult_result;
generate
for (gi = 0; gi < LANES; gi++) begin : mults
	multsplat11 fpmult
	(
		.clock(clk),
		.dataa(left_rd_data[gi]),
		.datab(mult_input),
		.result(mult_result[gi])
	);
end
endgenerate

// Floating-point subtractor array, 11 cycle latency
logic [LANES-1:0][31:0] sub_input;
logic [LANES-1:0][31:0] sub_result;
generate
for (gi = 0; gi < LANES; gi++) begin : subs
	// Choose input to subtractor: all zeros (during normalization mode) or data from cur block
	assign sub_input[gi] = norm ? '0 : cur_rd_data[gi];
	
	subsplat11 fpsub
	(
		.clock(clk),
		.dataa(sub_input[gi]),
		.datab(mult_result[gi]),
		.result(sub_result[gi])
	);
end
endgenerate



	
// Block write (one set of addresses/WEs)
logic [CURLEFT_AWIDTH-1:0] curleft_wr_addr[LANES];
logic [LANES-1:0] swizzed_we;

generate
for (gi = 0; gi < LANES; gi++) begin : write
	// Calculate addr
	cpu_ram_addr_swiz #
	(
		.TOTAL_BITS(2*BSIZEBITS),
		.SWIZ_BITS(LANESBITS),
		.LANE(gi)
	) addr_swiz
	(
		.clk(clk),
		.reset(reset),
		.i_addr({jcnt[C_WR_ADDR_SWIZ], icnt[C_WR_ADDR_SWIZ]}),
		.o_addr(curleft_wr_addr[gi])
	);
	
	// Calculate write enable
	cpu_ram_we_swiz #
	(
		.COORD_BITS(BSIZEBITS),
		.SWIZ_BITS(LANESBITS),
		.LANE(gi)
	) we_swiz
	(
		.clk(clk),
		.reset(reset),
		.i_addr({jcnt[C_WR_WE_SWIZ], icnt[C_WR_WE_SWIZ]}),
		.i_we(valid[C_WR_WE_SWIZ]),
		.o_we(swizzed_we[gi])
	);
end
endgenerate

always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		o_cur_wr_enable[0] <= '0;
		o_left_wr_enable[0] <= '0;
		o_cur_wr_enable[1] <= '0;
		o_left_wr_enable[1] <= '0;
	end
	else begin
		o_cur_wr_enable[0] <= swizzed_we & {LANES{wr_cur[C_WR_WE_MASK] & ~whichpage[C_WR_WE_MASK]}};
		o_cur_wr_enable[1] <= swizzed_we & {LANES{wr_cur[C_WR_WE_MASK] & whichpage[C_WR_WE_MASK]}};
		o_left_wr_enable[0] <= swizzed_we & {LANES{wr_left[C_WR_WE_MASK] & ~whichpage[C_WR_WE_MASK]}};
		o_left_wr_enable[1] <= swizzed_we & {LANES{wr_left[C_WR_WE_MASK] & whichpage[C_WR_WE_MASK]}};
	end
end

assign o_cur_wr_addr = curleft_wr_addr;
assign o_cur_wr_data = sub_result;

assign o_left_wr_addr = curleft_wr_addr;
assign o_left_wr_data = sub_result;


// Extract a 256-bit slice of the write data, namely the one
// where the single element (i, j) lives, which is a single 32-bit float
// at the top of the current SIMD group
lpm_mux #
(
	.lpm_pipeline(1),
	.lpm_size(2),
	.lpm_width(TOP_DWIDTH),
	.lpm_widths(1)
) top_write_data_mux
(
	.data(sub_result),
	.clock(clk),
	.sel(icnt[C_TOP_WR_MUX][3]),
	.result(o_top_wr_data)
);

// Pinpoint exactly which element in the 256-bit slice is element (i, j)
// by calculating a word enable
lpm_decode #
(
	.lpm_pipeline(1),
	.lpm_width(3),
	.lpm_decodes(8)
) top_write_be_decode
(
	.clock(clk),
	.data(icnt[C_TOP_WR_MUX][2:0]),
	.eq(o_top_be)
);
	
assign o_top_wr_addr = {jcnt[C_TOP_WR], icnt[C_TOP_WR][BSIZEBITS-1:3]};

always_ff @ (posedge clk or posedge reset) begin
	if (reset) o_top_wr_enable <= '0;
	else o_top_wr_enable <= valid[C_TOP_WR-1] && wr_top[C_TOP_WR-1];
end
	
	

// Pipeline occupancy monitor.
// Tokens are considered eaten once they have been written to memory.
// In reality, the pipeline is still active a little bit even after it's
// reported as 'empty', but there shouldn't be any dependencies between
// those things being written and anything that's just starting to come
// down the pipeline at the head.
//
localparam PIPECAP_BITS = CLogB2(C_END);
logic [PIPECAP_BITS-1:0] pipe_capacity;
always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		pipe_capacity <= '0;
	end
	else begin
		case ({i_valid, valid[C_END]})
			2'b00: ;
			2'b10: pipe_capacity <= pipe_capacity + ((PIPECAP_BITS)'(1));
			2'b01: pipe_capacity <= pipe_capacity - ((PIPECAP_BITS)'(1));
			2'b11: ;
		endcase
	end
end

assign o_pipe_empty = (pipe_capacity == '0);


// synthesis translate_off
// For simulation debug only

shortreal f_left_rd_data[LANES], f_cur_rd_data[LANES], f_top_rd_data;
shortreal f_wr_data[LANES];
shortreal f_mult_input_b;
shortreal f_sub_input_a[LANES];
shortreal f_sub_input_b[LANES];

always_comb begin
	for (integer ii = 0; ii < LANES; ii++) begin
		f_left_rd_data[ii] = $bitstoshortreal(left_rd_data[ii]);
		f_cur_rd_data[ii] = $bitstoshortreal(cur_rd_data[ii]);
		f_sub_input_a[ii] = $bitstoshortreal(sub_input[ii]);
		f_sub_input_b[ii] = $bitstoshortreal(mult_result[ii]);
		f_wr_data[ii] = $bitstoshortreal(sub_result[ii]);
	end
	
	f_top_rd_data = $bitstoshortreal(top_rd_data);
	f_mult_input_b = $bitstoshortreal(mult_input);
end
// synthesis translate_on



		

endmodule
