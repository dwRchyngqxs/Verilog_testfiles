// (C) 2001-2012 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// ******
// scc_mgr
// ******
//
// SCC Manager
//
// General Description
// -------------------
//
// This component allows the NIOS to control the delay chains in the IOs.
//

// altera message_off 10230
module sequencer_scc_mgr (
	// Avalon Interface
	
	avl_clk,
	avl_reset_n,
	avl_address,
	avl_write,
	avl_writedata,
	avl_read,
	avl_readdata,
	avl_waitrequest,

	scc_reset_n,
	scc_clk,
	scc_data,
	scc_dqs_ena,
	scc_dqs_io_ena,
	scc_dq_ena,
	scc_dm_ena,
	scc_upd,
	
	capture_strobe_tracking,
	afi_init_req,
	afi_cal_req
);

	parameter AVL_DATA_WIDTH                = 32;
	parameter AVL_ADDR_WIDTH		= 13;

	parameter MEM_IF_READ_DQS_WIDTH	        = 1;
	parameter MEM_IF_WRITE_DQS_WIDTH	= 1;
	parameter MEM_IF_DQ_WIDTH               = 36;
	parameter MEM_IF_DM_WIDTH               = 4;

	parameter DLL_DELAY_CHAIN_LENGTH        = 8;
	parameter FAMILY                        = "STRATIXIII";
	parameter USE_DQS_TRACKING              = 0;
	parameter DUAL_WRITE_CLOCK		= 0;


	localparam MAX_FAMILY_NAME_LEN          = 30;

	function integer get_dqs_sdata_bits(input [8*MAX_FAMILY_NAME_LEN-1:0] family);
		if (family == "STRATIXV") return 101;
		else if (family == "ARRIAV" || family == "CYCLONEV") return 30;
		else return 46;
	endfunction
		
	function integer get_io_sdata_bits(input [8*MAX_FAMILY_NAME_LEN-1:0] family);
		if (family == "STRATIXV") return 40;
		else if (family == "ARRIAV" || family == "CYCLONEV") return 25;
		else return 11;
	endfunction
		
	function integer get_datawidth(input [8*MAX_FAMILY_NAME_LEN-1:0] family);
		if (family == "STRATIXV") return 40;
		else if (family == "ARRIAV" || family == "CYCLONEV") return 19;
		else return 24;
	endfunction
		

	localparam DQS_IN_PHASE_MAX = 3;
	localparam DQS_SDATA_BITS   = get_dqs_sdata_bits(FAMILY);
	localparam IO_SDATA_BITS    = get_io_sdata_bits(FAMILY);
	localparam DATAWIDTH        = get_datawidth(FAMILY);
	localparam RFILE_LATENCY    = 3;

	localparam MEM_DQ_PER_DQS   = (MEM_IF_DQ_WIDTH / MEM_IF_WRITE_DQS_WIDTH);
	localparam MEM_DM_PER_DQS   = (MEM_IF_DM_WIDTH > MEM_IF_WRITE_DQS_WIDTH) ? (MEM_IF_DM_WIDTH / MEM_IF_WRITE_DQS_WIDTH) : 1;
	localparam MEM_DQS_PER_DM   = (MEM_IF_DM_WIDTH < MEM_IF_WRITE_DQS_WIDTH) ? (MEM_IF_WRITE_DQS_WIDTH / MEM_IF_DM_WIDTH) : 1;

	localparam RFILE_DEPTH      = log2(MEM_DQ_PER_DQS + 1 + MEM_DM_PER_DQS + MEM_IF_READ_DQS_WIDTH - 1) + 1;

	typedef enum integer {
		SCC_SCAN_DQS		= 'b0000,
		SCC_SCAN_DQS_IO		= 'b0001,
		SCC_SCAN_DQ_IO  	= 'b0010,
		SCC_SCAN_DM_IO		= 'b0011,
		SCC_SCAN_UPD		= 'b1000
	} sdata_scan_t;

	input avl_clk;
	input avl_reset_n;
	input [AVL_ADDR_WIDTH - 1:0] avl_address;
	input avl_write;
	input [AVL_DATA_WIDTH - 1:0] avl_writedata;
	input avl_read;
	output [AVL_DATA_WIDTH - 1:0] avl_readdata;
	output avl_waitrequest;
	
	input scc_clk;
	input scc_reset_n;
	output scc_data;
	output [MEM_IF_READ_DQS_WIDTH - 1:0] scc_dqs_ena;
	output [MEM_IF_READ_DQS_WIDTH - 1:0] scc_dqs_io_ena;
	output [MEM_IF_DQ_WIDTH - 1:0] scc_dq_ena;
	output [MEM_IF_DM_WIDTH - 1:0] scc_dm_ena;
	output scc_upd;
	
	input [MEM_IF_READ_DQS_WIDTH - 1:0] capture_strobe_tracking;
	
	input afi_init_req;
	input afi_cal_req;

	// internal versions of interfacing signals.
	
	reg [AVL_DATA_WIDTH - 1:0] avl_readdata;
	reg avl_waitrequest;

	reg scc_data;
	reg [MEM_IF_READ_DQS_WIDTH - 1:0] scc_dqs_ena;
	reg [MEM_IF_READ_DQS_WIDTH - 1:0] scc_dqs_io_ena;
	reg [MEM_IF_DQ_WIDTH - 1:0] scc_dq_ena;
	reg [MEM_IF_DM_WIDTH - 1:0] scc_dm_ena;
	reg scc_upd;

	reg scc_data_c;
	reg [MEM_IF_READ_DQS_WIDTH - 1:0] scc_dqs_ena_c;
	reg [MEM_IF_READ_DQS_WIDTH - 1:0] scc_dqs_io_ena_c;
	reg [MEM_IF_DQ_WIDTH - 1:0] scc_dq_ena_c;
	reg [MEM_IF_DM_WIDTH - 1:0] scc_dm_ena_c;
	reg scc_upd_c;	

	// IO config register
	
	reg [IO_SDATA_BITS - 1:0] scc_io_cfg;
	reg [IO_SDATA_BITS - 1:0] scc_io_cfg_curr;
	reg [IO_SDATA_BITS - 1:0] scc_io_cfg_next;
	
	// DQS config register
	
	reg [DQS_SDATA_BITS - 1:0] scc_dqs_cfg;
	reg [DQS_SDATA_BITS - 1:0] scc_dqs_cfg_curr;
	reg [DQS_SDATA_BITS - 1:0] scc_dqs_cfg_next;
	
	// is scc manager selected?
	
	reg sel_scc;

	// go signal going to the SCC clock side.
	reg [3:0] scc_go_ena;
	reg [3:0] scc_go_ena_r;
	wire scc_go_group;
	wire scc_go_io;
	wire scc_go_update;
	
	// enable pattern.
	
	reg [7:0] scc_ena_addr;
	reg [255:0] scc_ena_addr_decode;

	// done signal coming back from the scc side.
	
	reg scc_done;
	
	// avalon version of scc done signal
	
	reg avl_done;
	
	// tracking signals
	reg    avl_cmd_trk_afi_end;
	wire   [AVL_DATA_WIDTH - 1:0] read_sample_counter;

	// SCAN state machine

	typedef enum int unsigned {
		STATE_SCC_IDLE,
		STATE_SCC_LOAD,
		STATE_SCC_DONE
	} STATE_SCC_RAM_T;
	
	STATE_SCC_RAM_T scc_state_curr, scc_state_next;
	reg [7:0] scc_shift_cnt_curr;
	reg [7:0] scc_shift_cnt_next;
	
	
	reg    [DATAWIDTH-1:0]    datain;
	wire    [DATAWIDTH-1:0]    dataout;
	wire   [5:0]    write_addr;
	wire   [5:0]    read_addr;
	reg    [3:0]    group;
	reg    [5:0]    pin;
	wire    write_en;

	reg [DATAWIDTH-1:0] scc_dataout;

	reg [7:0] group_counter;
	wire avl_cmd_group_counter;
	wire [3:0] avl_cmd_section;
	wire avl_cmd_rfile_group_not_io;
	wire [5:0] avl_cmd_rfile_addr;

	wire avl_cmd_scan;
	wire avl_cmd_scan_begin;
	wire avl_cmd_scan_end;
	wire [5:0] avl_cmd_scan_addr;

	reg avl_doing_scan;
	reg scc_doing_scan;
	reg scc_doing_scan_r;
	reg [7:0] scc_group_counter;

	wire avl_cmd_rfile;
	wire avl_cmd_rfile_begin;
	wire avl_cmd_rfile_end;
	reg [RFILE_LATENCY-1:0] avl_cmd_rfile_latency;
	
	wire track_opr_check;
	wire avl_cmd_counter_access;
	wire avl_cmd_do_sample;
	wire avl_cmd_afi_req;

	wire [AVL_DATA_WIDTH-1:0] shifted_dataout;
	
	// metastability flops
	reg avl_init_req_r;
	reg avl_cal_req_r;
	reg avl_init_req_r2;
	reg avl_cal_req_r2;
	reg avl_init_req_r3;
	reg avl_cal_req_r3;
	
	integer i;
	
	
	
	
	
	
	
	
	
	
	
	
	assign sel_scc = 1'b1;

	integer scan_offsets[0:3] = '{ 0, MEM_IF_READ_DQS_WIDTH + MEM_DQ_PER_DQS, MEM_IF_READ_DQS_WIDTH, MEM_IF_READ_DQS_WIDTH + MEM_DQ_PER_DQS + 1 };

	assign avl_cmd_section = avl_address[9:6];
	assign avl_cmd_group_counter = (sel_scc && (avl_cmd_section == 4'b0000));
	
	assign avl_cmd_rfile_group_not_io = ~(avl_address[9] == 1'b1 || avl_address[9:6] == 4'b0111) | (avl_address[9:6] == 4'b1010);

	assign avl_cmd_rfile = (sel_scc && (avl_address[9:7] != 3'b111) && (avl_cmd_section != 4'b0000));
	assign avl_cmd_rfile_begin = (avl_read || avl_write) && (avl_cmd_rfile || avl_cmd_group_counter) && ~(|avl_cmd_rfile_latency);
	assign avl_cmd_rfile_end = avl_cmd_rfile_latency[0];
	assign avl_cmd_rfile_addr = {'0, (avl_cmd_rfile_group_not_io ? 0 : MEM_IF_READ_DQS_WIDTH) + avl_address[5:0]};

	assign avl_cmd_scan = (sel_scc && avl_cmd_section == 4'he);
	assign avl_cmd_scan_begin = (avl_read || avl_write) && avl_cmd_scan && ~(avl_doing_scan) && ~(avl_done);
	assign avl_cmd_scan_end = avl_doing_scan && avl_done;
	assign avl_cmd_scan_addr = {'0, scan_offsets[avl_address[1:0]] + ((avl_writedata[7:0] == 8'hFF) ? 0 : avl_writedata[5:0])};
	
	assign track_opr_check = (avl_address[5:0] == 6'b111111) ? 1'b1 : 0; 
	assign avl_cmd_counter_access = sel_scc && avl_cmd_section == 4'hF && !track_opr_check;
	assign avl_cmd_do_sample = (avl_write && sel_scc && avl_cmd_section == 4'hF && track_opr_check && avl_cmd_trk_afi_end);

	assign avl_cmd_afi_req = (sel_scc && avl_cmd_section == 4'hd);

	assign avl_waitrequest = (~avl_reset_n) || ((avl_read || avl_write) && ~avl_cmd_rfile_end && ~avl_cmd_scan_end && ~avl_cmd_trk_afi_end);
	always_comb begin
	    if (avl_cmd_counter_access)
	        avl_readdata    =    read_sample_counter;
	    else
	        begin
	            if (avl_cmd_afi_req)
	                avl_readdata    =    {avl_cal_req_r3,avl_init_req_r3};
	            else
	                begin
	                    if (avl_cmd_rfile)
	                        avl_readdata    =    shifted_dataout;
	                    else
	                        avl_readdata    =    group_counter;
	                end
	        end
	end

	// Assert that the SCC manager only receives broadcast or single bit scan requests for DQS and DM I/Os.
	ERROR_DQS_IO_SCAN_WRONG_DATA:
	assert property (@(posedge avl_clk) (avl_cmd_scan_begin && avl_address[3:0] == SCC_SCAN_DQS_IO) |-> (avl_writedata[7:0] == 8'hFF || avl_writedata[7:0] == 8'h00));
	ERROR_DM_IO_SCAN_WRONG_DATA:
	assert property (@(posedge avl_clk) (avl_cmd_scan_begin && avl_address[3:0] == SCC_SCAN_DM_IO) |-> (avl_writedata[7:0] == 8'hFF || avl_writedata[7:0] < MEM_DM_PER_DQS));
	ERROR_DQS_SCAN_WRONG_DATA:
	assert property (@(posedge avl_clk) (avl_cmd_scan_begin && avl_address[3:0] == SCC_SCAN_DQS) |-> (avl_writedata[7:0] == 8'hFF || avl_writedata[7:0] < MEM_IF_READ_DQS_WIDTH));
	ERROR_DQ_IO_SCAN_WRONG_DATA:
	assert property (@(posedge avl_clk) (avl_cmd_scan_begin && avl_address[3:0] == SCC_SCAN_DQ_IO) |-> (avl_writedata[7:0] == 8'hFF || avl_writedata[7:0] < MEM_DQ_PER_DQS));

		
	typedef bit [13:0] t_setting_mask;

	integer unsigned setting_offsets[1:12];
	t_setting_mask setting_masks [1:12];

	generate
		if (FAMILY == "STRATIXV")
		begin
			assign setting_offsets[1:9] = '{ 'd0, 'd12, 'd17, 'd25, 'd30, 'd36, 'd0, 'd6, 'd12 };
			assign setting_masks [1:9] = '{ 'b0111111111111, 'b011111, 'b011111111, 'b011111, 'b0111111, 'b0111111, 'b0111111, 'b0111111, 'b0111111111111 };
		end
		else if (FAMILY == "ARRIAV" || FAMILY == "CYCLONEV")
		begin			
      		  	assign setting_offsets[1:12] = '{ 'd0, 'd5, 'd8, 'd13, 'd13, 'd18, 'd0, 'd5, 'd5 , 'd18, 'd10, 'd11};
	        	assign setting_masks [1:12] = '{ 'b011111, 'b0111, 'b011111, 'b0, 'b011111, 'b0, 'b011111, 'b0, 'b011111, 'b01, 'b01, 'b0111 };
		end
		else
	        begin
			assign setting_offsets[1:9] = '{ 'd0, 'd4, 'd8, 'd12, 'd17, 'd21, 'd0, 'd4, 'd7 };
			assign setting_masks [1:9] = '{ 'b01111, 'b01111, 'b01111, 'b11111, 'b01111, 'b00111, 'b01111, 'b00111, 'b01111 };
	        end
	endgenerate

	
	always_ff @(posedge avl_clk or negedge avl_reset_n)
	begin
		if (~avl_reset_n)
		begin
			avl_cmd_rfile_latency <= 0;
			avl_doing_scan <= 0;
		end
		else begin
			avl_cmd_rfile_latency <= {avl_cmd_rfile_begin, avl_cmd_rfile_latency[RFILE_LATENCY - 1 : 1]};
			avl_doing_scan <= (avl_cmd_scan_begin || avl_doing_scan) && ~avl_done;
		end
	end

	
	assign read_addr = avl_cmd_scan ? avl_cmd_scan_addr : avl_cmd_rfile_addr;
	assign write_addr = avl_cmd_rfile_addr;
	assign write_en = avl_cmd_rfile && avl_write && avl_cmd_rfile_latency[1];

	
	
	assign datain = (dataout & ('1 ^ (setting_masks[avl_cmd_section] << setting_offsets[avl_cmd_section]))) | ((setting_masks[avl_cmd_section] & avl_writedata) << setting_offsets[avl_cmd_section]);

	
	assign shifted_dataout = (dataout >> setting_offsets[avl_cmd_section]) & setting_masks[avl_cmd_section];

	// config data storage
	
	
	
	
	
	sequencer_scc_reg_file #(
        .WIDTH  (DATAWIDTH),
		.DEPTH  (RFILE_DEPTH)
	) sequencer_scc_reg_file_inst (
        .clock      (avl_clk    ),
        .data       (datain     ),
        .rdaddress  (read_addr  ),
        .wraddress  (write_addr ),
        .wren       (write_en   ),
        .q          (dataout    )
    );
	
	always_ff @(posedge avl_clk or negedge avl_reset_n)
	begin
		if (~avl_reset_n)
		begin
			group_counter <= '0;
		end
		else begin
			if (avl_cmd_group_counter && avl_write)
			begin
				
				group_counter <= avl_writedata;
			end
		end
	end
	
	
	always_ff @(posedge scc_clk or negedge scc_reset_n)
	    begin
	        if (~scc_reset_n)
			begin
	            scc_dataout      <=    0;
				scc_doing_scan   <=    0;
				scc_doing_scan_r <=    0;
			end
	        else begin
	            scc_dataout      <=    dataout;
				scc_doing_scan   <=    avl_doing_scan;
				scc_doing_scan_r <=    scc_doing_scan;
			end
	    end	        
	
	// family specific decoder
	generate
		if (FAMILY == "STRATIXV")
		begin
			sequencer_scc_sv_wrapper # (
				.DATAWIDTH              (DATAWIDTH              ),
				.IO_SDATA_BITS          (IO_SDATA_BITS          ),
				.DQS_SDATA_BITS         (DQS_SDATA_BITS         ),
				.AVL_DATA_WIDTH         (AVL_DATA_WIDTH         ),
				.DLL_DELAY_CHAIN_LENGTH (DLL_DELAY_CHAIN_LENGTH ),
				.DUAL_WRITE_CLOCK	(DUAL_WRITE_CLOCK)
			) sequencer_scc_family_wrapper (
				.reset_n_scc_clk    (scc_reset_n        ),	
				.scc_clk            (scc_clk            ),
				.scc_dataout        (scc_dataout        ),
				.scc_io_cfg         (scc_io_cfg         ),
				.scc_dqs_cfg        (scc_dqs_cfg        )
			);
	        end
		else if (FAMILY == "ARRIAV" || FAMILY == "CYCLONEV")
		begin
			sequencer_scc_acv_wrapper # (
				.DATAWIDTH              (DATAWIDTH              ),
				.IO_SDATA_BITS          (IO_SDATA_BITS          ),
				.DQS_SDATA_BITS         (DQS_SDATA_BITS         ),
				.AVL_DATA_WIDTH         (AVL_DATA_WIDTH         ),
				.DLL_DELAY_CHAIN_LENGTH (DLL_DELAY_CHAIN_LENGTH )
			) sequencer_scc_family_wrapper (
				.reset_n_scc_clk    (scc_reset_n        ),	
				.scc_clk            (scc_clk            ),
				.scc_dataout        (scc_dataout        ),
				.scc_io_cfg         (scc_io_cfg         ),
				.scc_dqs_cfg        (scc_dqs_cfg        )
			);
	        end
		else
	        begin
			sequencer_scc_siii_wrapper # (
				.DATAWIDTH              (DATAWIDTH              ),
				.IO_SDATA_BITS          (IO_SDATA_BITS          ),
				.DQS_SDATA_BITS         (DQS_SDATA_BITS         ),
				.AVL_DATA_WIDTH         (AVL_DATA_WIDTH         ),
				.DLL_DELAY_CHAIN_LENGTH (DLL_DELAY_CHAIN_LENGTH )
			) sequencer_scc_family_wrapper (
				.reset_n_scc_clk    (scc_reset_n        ),	
				.scc_clk            (scc_clk            ),
				.scc_dataout        (scc_dataout        ),
				.scc_io_cfg         (scc_io_cfg         ),
				.scc_dqs_cfg        (scc_dqs_cfg        )
			);
		end
	endgenerate
	
	// data transfer from SCC to AVALON
	
	always_ff @ (posedge avl_clk) begin
		avl_done <= scc_done;
	end
	
	// scan chain side state update
	// scan chain state machine transitions.
	
	always_ff @ (posedge scc_clk or negedge scc_reset_n) begin
		if (~scc_reset_n) begin
			scc_go_ena <= '0;
			scc_go_ena_r <= '0;
			scc_ena_addr <= '0;
			scc_io_cfg_curr <= '0;
			scc_dqs_cfg_curr <= '0;
			scc_shift_cnt_curr <= '0;
			scc_state_curr <= STATE_SCC_IDLE;
			scc_group_counter <= '0;
		end
		else begin
			scc_go_ena <= avl_address[3:0];
			scc_go_ena_r <= scc_go_ena;
			scc_ena_addr <= avl_writedata[7:0];
			scc_io_cfg_curr <= scc_io_cfg_next;
			scc_dqs_cfg_curr <= scc_dqs_cfg_next;
			scc_shift_cnt_curr <= scc_shift_cnt_next;
			scc_state_curr <= scc_state_next;
			scc_group_counter <= group_counter;
		end
	end

	assign scc_go_group = (scc_go_ena_r == SCC_SCAN_DQS);
	assign scc_go_io = (scc_go_ena_r == SCC_SCAN_DQS_IO) || (scc_go_ena_r == SCC_SCAN_DQ_IO) || (scc_go_ena_r == SCC_SCAN_DM_IO);
	assign scc_go_update = (scc_go_ena_r == SCC_SCAN_UPD);


	always_ff @ (negedge scc_clk) begin
		scc_data <= scc_data_c;
		scc_dqs_ena <= scc_dqs_ena_c;
		scc_dqs_io_ena <= scc_dqs_io_ena_c;
		scc_dq_ena <= scc_dq_ena_c;
		scc_dm_ena <= scc_dm_ena_c;
		scc_upd <= scc_upd_c;	
	end

	always_comb begin
		scc_ena_addr_decode = '0;

		if (scc_go_ena_r == SCC_SCAN_DQ_IO)
		begin
			if (scc_ena_addr == 8'b11111111) 
				scc_ena_addr_decode = {MEM_DQ_PER_DQS{1'b1}} << (scc_group_counter * MEM_DQ_PER_DQS);
			else
				scc_ena_addr_decode[scc_group_counter * MEM_DQ_PER_DQS + scc_ena_addr] = 1;
		end
		else if (scc_go_ena_r == SCC_SCAN_DQS) begin
			if (scc_ena_addr == 8'b11111111) 
				scc_ena_addr_decode = '1;
			else
				scc_ena_addr_decode[scc_ena_addr] = 1;
		end
		else if (scc_go_ena_r == SCC_SCAN_DM_IO) begin
			if (scc_ena_addr == 8'b11111111) 
				scc_ena_addr_decode = {MEM_DM_PER_DQS{1'b1}} << ((scc_group_counter * MEM_DM_PER_DQS) >> log2(MEM_DQS_PER_DM));
			else
				scc_ena_addr_decode[(scc_group_counter >> log2(MEM_DQS_PER_DM)) * MEM_DM_PER_DQS + scc_ena_addr] = 1;
		end
		else begin
			if (scc_ena_addr == 8'b11111111) 
				scc_ena_addr_decode = '1;
			else
				scc_ena_addr_decode[scc_group_counter] = 1;
		end
		
		scc_state_next = scc_state_curr;
		scc_shift_cnt_next = '0;
		scc_io_cfg_next = scc_io_cfg;
		scc_dqs_cfg_next = scc_dqs_cfg;
		scc_data_c = 0;
		scc_dqs_ena_c = '0;
		scc_dqs_io_ena_c = '0;
		scc_dq_ena_c = '0;
		scc_dm_ena_c = '0;
		scc_upd_c = 0;
		scc_done = 0;

		case (scc_state_curr)
		STATE_SCC_IDLE: begin
			if (scc_doing_scan_r) begin
				if (scc_go_io) begin
					scc_state_next = STATE_SCC_LOAD;
					scc_shift_cnt_next = IO_SDATA_BITS - 1;
				end else if (scc_go_group) begin
					scc_state_next = STATE_SCC_LOAD;
					scc_shift_cnt_next = DQS_SDATA_BITS - 1;
				end else if (scc_go_update) begin
					scc_state_next = STATE_SCC_DONE;
					scc_upd_c = 1;
				end
			end
		end
		STATE_SCC_LOAD: begin
			scc_shift_cnt_next = scc_shift_cnt_curr - 1;

			if (scc_go_group) begin
				scc_dqs_ena_c = (scc_go_ena_r == SCC_SCAN_DQS) ? scc_ena_addr_decode : '0;
				if (FAMILY == "STRATIXV")
				begin		
					
					scc_data_c = scc_dqs_cfg_curr[0];
					scc_dqs_cfg_next = scc_dqs_cfg_curr >> 1;
				end
				else
				begin
					
					scc_data_c = scc_dqs_cfg_curr[DQS_SDATA_BITS - 1];
					scc_dqs_cfg_next = scc_dqs_cfg_curr << 1;
				end
			end
			
			if (scc_go_io) begin
				scc_dqs_io_ena_c = (scc_go_ena_r == SCC_SCAN_DQS_IO) ? scc_ena_addr_decode : '0;
				scc_dq_ena_c = (scc_go_ena_r == SCC_SCAN_DQ_IO) ? scc_ena_addr_decode : '0;
				scc_dm_ena_c = (scc_go_ena_r == SCC_SCAN_DM_IO) ? scc_ena_addr_decode : '0;
				if (FAMILY == "STRATIXV")
				begin	
					scc_data_c = scc_io_cfg_curr[0];
					scc_io_cfg_next = scc_io_cfg_curr >> 1;
				end
				else
				begin
					scc_data_c = scc_io_cfg_curr[IO_SDATA_BITS - 1];
					scc_io_cfg_next = scc_io_cfg_curr << 1;
				end
			end 
			
			if (scc_shift_cnt_curr == 0) begin
				scc_state_next = STATE_SCC_DONE;
			end
		end
		STATE_SCC_DONE:	begin
			scc_done = 1;

			if (~scc_doing_scan_r)
				scc_state_next = STATE_SCC_IDLE;
		end
		default : begin end
		endcase
	end
	
	always_ff @(posedge avl_clk, negedge avl_reset_n)
	    begin
	        if (~avl_reset_n)
	            avl_cmd_trk_afi_end    <=    1'b0;
	        else
	            begin
	                if (sel_scc && (avl_cmd_section == 4'hF || avl_cmd_section == 4'hd) && (avl_write || avl_read))
	                    avl_cmd_trk_afi_end    <=    1'b1;
	                else
	                    avl_cmd_trk_afi_end    <=    1'b0;
	            end
	    end
	
	generate
        if (USE_DQS_TRACKING == 1)
            begin
                reg    [MEM_IF_READ_DQS_WIDTH - 1:0] capture_strobe_tracking_r;
                reg signed [AVL_DATA_WIDTH - 1:0] sample_counter [MEM_IF_READ_DQS_WIDTH - 1:0];
                assign read_sample_counter  =   sample_counter[avl_address[5:0]];
                
                always_ff @(posedge avl_clk, negedge avl_reset_n)
	                begin
	                    if (~avl_reset_n)
	                        capture_strobe_tracking_r    <=    1'b0;
	                    else
	                        capture_strobe_tracking_r    <=    capture_strobe_tracking;
	                end
	            
	            always_ff @(posedge avl_clk, negedge avl_reset_n)
	                begin
	                    if (~avl_reset_n)
	                        begin
	                            for (i=0; i<MEM_IF_READ_DQS_WIDTH; i=i+1)
	                            begin
	                                sample_counter[i]    <= 1'b0;
	                            end
	                        end
	                    else
	                        begin
	                            for (i=0; i<MEM_IF_READ_DQS_WIDTH; i=i+1)
	                            begin
	                                if (avl_cmd_counter_access && avl_write && i == avl_address[5:0])
	                                    sample_counter[i] <= avl_writedata;
	                                else if (avl_cmd_do_sample && (i == avl_writedata[7:0] || avl_writedata[7:0] == 8'hFF))
	                                    begin
	                                        if (capture_strobe_tracking_r[i])
	                                            begin
	                                                if (!sample_counter[i][AVL_DATA_WIDTH-1] && &sample_counter[i][AVL_DATA_WIDTH-2:0])
	                                                    sample_counter[i]    <=    sample_counter[i];
	                                                else
	                                                    sample_counter[i]    <=    sample_counter[i] + 1'b1;
	                                            end
	                                        else if (!capture_strobe_tracking_r[i])
	                                            begin
	                                                if (sample_counter[i][AVL_DATA_WIDTH-1] && ~(|sample_counter[i][AVL_DATA_WIDTH-2:0]))
	                                                    sample_counter[i]    <=    sample_counter[i];
	                                                else
	                                                    sample_counter[i]    <=    sample_counter[i] - 1'b1;
	                                            end
	                                    end
	                            end
	                        end
	                end
	        end
        else
            begin
                assign read_sample_counter  =   '0;
            end
	endgenerate
	
	always_ff @(posedge avl_clk, negedge avl_reset_n)
	    begin
	        if (~avl_reset_n)
	            begin
	                avl_init_req_r    <=    0;
	                avl_cal_req_r     <=    0;
	                avl_init_req_r2   <=    0;
	                avl_cal_req_r2    <=    0;
	                avl_init_req_r3   <=    0;
	                avl_cal_req_r3    <=    0;
	            end
	        else
	            begin
	                avl_init_req_r    <=    afi_init_req;
	                avl_cal_req_r     <=    afi_cal_req;
	                avl_init_req_r2   <=    avl_init_req_r;
	                avl_cal_req_r2    <=    avl_cal_req_r;
	                
	                if (avl_init_req_r2)
	                    avl_init_req_r3   <=    1;
	                else
	                    avl_init_req_r3   <=    0;
	                    
	                if (avl_cal_req_r2)
	                    avl_cal_req_r3    <=    1;
	                else
	                    avl_cal_req_r3    <=    0;
	            end
	    end

	function integer log2;
		input integer value;
		begin
		for (log2=0; value>0; log2=log2+1)
			value = value>>1;
		log2 = log2 - 1;
		end
	endfunction

endmodule
