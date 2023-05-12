module power_controller
(	
	input clk,
	input reset,
	
	// for communicating with master via Avalon
	input		logic	[1:0]		i_address,
	input		logic	[31:0]	i_writedata,
	input		logic				i_write,
	output	logic	[31:0]	o_readdata,
	input		logic				i_read,
	
	// for communicating with power circuitry (ADC) via SPI
	output	logic				o_adc_fo,
	output	logic				o_adc_sdi,
	output	logic 			o_adc_sck,
	input		logic 			i_adc_sdo,
	output	logic	[1:0]		o_adc_cs
);

logic			[31:0]	ctrl_word;		// control register
logic			[31:0]	accum_hi;		// upper data word for 64-bit accumulator
logic			[31:0]	accum_lo;		// lower data word for 64-bit accumulator
logic						accum_en;
logic						clear_accum;
logic			[31:0]	sample_counter;
localparam	[1:0]		CTRL_WORD_ADDR		= 2'h0;
localparam	[1:0]		ACCUM_LO_ADDR		= 2'h1;
localparam	[1:0]		ACCUM_HI_ADDR		= 2'h2;
localparam	[1:0]		SAMPLE_COUNT_ADDR	= 2'h3;

logic						sdo /* synthesis useioff = 1 */;
logic						sdi /* synthesis useioff = 1 */;
logic						sck /* synthesis useioff = 1 */;
logic						cs /* synthesis useioff = 1 */;
logic						sck_en;
logic						stall_en;
logic						done_transfer;
logic			[10:0]	count;			// count 32 cycles of slow clock (slow clock is 1/64 of clk) 
logic			[5:0]		stall_count;	// count 64 cycles of clock just as buffer time at end of serial transfer (so we don't latch glitches from ADC)
logic			[31:0]	shift_reg_in;	// for serial -> parallel
logic			[31:0]	data_from_adc;	// holds word transferred from ADC 
logic			[31:0]	shift_reg_out;	// for parallel -> serial
logic			[7:0]		data_to_adc;	// address of power rail we wish to measure

//
// AVALON SIDE: LOGIC FOR COMMUNICATING WITH AVALON-MM MASTER
//

// reads/writes via avalon
always_ff @ (posedge clk or posedge reset) begin
	if	(reset) begin
		ctrl_word	= '0;
	end
	else begin
		if (i_write) begin	// write to control word
			ctrl_word <= i_writedata;
		end
		if (i_read) begin	// read from internal registers
			case (i_address)
				CTRL_WORD_ADDR:		o_readdata <= ctrl_word;
				ACCUM_LO_ADDR:			o_readdata <= accum_lo;
				ACCUM_HI_ADDR:			o_readdata <= accum_hi;
				SAMPLE_COUNT_ADDR:	o_readdata <= sample_counter;
			endcase
		end
	end
end

assign accum_en		= ctrl_word[0];
assign clear_accum	= i_write && (i_address == CTRL_WORD_ADDR) && i_writedata[0];
assign data_to_adc	= {3'b101, ctrl_word[20:16]};

// sample accumulator 
always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		accum_hi 		<= '0;
		accum_lo 		<= '0;
		sample_counter <= '0;
	end
	else begin
		if (clear_accum) begin
			accum_hi 		<= '0;
			accum_lo 		<= '0;
			sample_counter <= '0;
		end
		else if (accum_en && done_transfer && shift_reg_in[29] && !shift_reg_in[28]) begin
			{accum_hi, accum_lo} = {accum_hi, accum_lo} + shift_reg_in[27:6];
			sample_counter = sample_counter + 1'b1;
		end
	end
end


//
//	SPI SIDE: LOGIC FOR COMMUNICATING WITH THE ADC (SPI SLAVE)
//

enum int unsigned
{
	WAIT,
	TRANSMIT,
	DONE_TRANSFER
} master_state, master_nextstate;

// state transitions
always_ff @ (posedge clk or posedge reset) begin
	if (reset) master_state <= WAIT;
	else master_state <= master_nextstate;
end	

// control when to start slow clock for data transfer
always_comb begin
	master_nextstate 	= master_state;
	sck_en 				= 0;
	stall_en				= 0;
	done_transfer 		= 0;
	
	case (master_state)
		WAIT: begin
			if (!sdo) begin
				master_nextstate = TRANSMIT;
				sck_en = 1;
			end
		end
		
		TRANSMIT: begin
			if (count == 11'd2047) begin
				master_nextstate 	= DONE_TRANSFER;
				done_transfer 		= 1;
				stall_en				= 1;
			end
			else begin 
				sck_en = 1;
			end
		end
		
		DONE_TRANSFER: begin
			if(stall_count == 6'd63) begin
				master_nextstate = WAIT;
			end
			else begin
				stall_en = 1;
			end
		end
		
	endcase
end

// clock counting - 	be able to count 32 transitions of a slow clock
// 					-	slow clock is 1/64 the speed of clk, slow clock needed for SPI 
always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		count = '0;
	end
	else begin
		if (sck_en)	count = count + 11'd1;
		else 			count = '0;
	end
end

// stall counting -	avoid accidentally transitioning to a TRANSMIT state by ignoring
//							output of SPI slave for one slow clock cycle (b/c of weird glitches...)
always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		stall_count = '0;
	end
	else begin
		if (stall_en)	stall_count = stall_count + 6'd1;
		else				stall_count = '0;
	end
end

// manage shift registers for serial->parallel(in), parallel->serial(out)
always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		shift_reg_in 	<= '0;
		shift_reg_out 	<= '0;
	end
	else begin
		if (done_transfer) begin
			data_from_adc 	<=	 shift_reg_in;
			shift_reg_out 	<= {data_to_adc, 24'd0};
		end	
		else begin
			if (count[5:0] == 6'b011111) begin 
				// shift in data from SDO on posedge of SCK
				shift_reg_in <= {shift_reg_in[30:0], sdo};
			end
			if (count[5:0] == 6'b111111) begin // 
				// shift out data to SDI on negedge of SCK
				shift_reg_out <= {shift_reg_out[30:0], 1'bx};
			end
		end
	end
end

// assign outputs and register them
assign o_adc_fo	=	'0;
assign sdi			=	shift_reg_out[31];
assign sck			=	(sck_en) ? count[5] : '0;
assign cs			=	2'b10;

always_ff @ (posedge clk or posedge reset)
begin
	if (reset) begin
		o_adc_cs		<= 2'b11;
		o_adc_sdi 	<= '0;
		o_adc_sck 	<= '0;
		sdo			<= '1;
	end
	else begin
		o_adc_cs		<= cs;
		o_adc_sdi 	<= sdi;
		o_adc_sck 	<= sck;
		sdo			<= i_adc_sdo;
	end
end


endmodule
