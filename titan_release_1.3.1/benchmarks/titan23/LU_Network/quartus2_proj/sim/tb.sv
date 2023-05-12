`timescale 1ns/1ps

module tb();

//
// 50 MHz clock
//

reg OSC50;
initial OSC50 = 1'b0;
always #10 OSC50 = ~OSC50;

//
// Reset generator
//

reg reset_n;
reg [3:0] reset_n_counter;

initial begin
	reset_n = 1'b0;
	reset_n_counter = 4'd0;
end

always @ (posedge OSC50) begin
	if (reset_n == 1'b0) begin
		reset_n_counter <= reset_n_counter + 4'd1;
	end
	
	if (reset_n_counter == 4'b1111) begin
		reset_n <= 1'b1;
	end
end

//
// Memory module
//

wire		    [13:0]		M1_DDR2_addr;
wire		     [2:0]		M1_DDR2_ba;
wire		          		M1_DDR2_cas_n;
wire		     			M1_DDR2_cke;
wire		     [1:0]		M1_DDR2_clk;
wire		     [1:0]		M1_DDR2_clk_n;
wire		     			M1_DDR2_cs_n;
wire		     [7:0]		M1_DDR2_dm;
wire		    [63:0]		M1_DDR2_dq;
wire		     [7:0]		M1_DDR2_dqs;
wire		     [7:0]		M1_DDR2_dqsn;
wire		     			M1_DDR2_odt;
wire		          		M1_DDR2_ras_n;
wire		          		M1_DDR2_we_n;

alt_mem_if_ddr2_mem_model_top_mem_if_dm_pins_en_mem_if_dqsn_en #(
		.MEM_IF_ADDR_WIDTH            (14),
		.MEM_IF_ROW_ADDR_WIDTH        (14),
		.MEM_IF_COL_ADDR_WIDTH        (10),
		.MEM_IF_CS_PER_RANK           (1),
		.MEM_IF_CONTROL_WIDTH         (1),
		.MEM_IF_DQS_WIDTH             (8),
		.MEM_IF_CS_WIDTH              (1),
		.MEM_IF_BANKADDR_WIDTH        (3),
		.MEM_IF_DQ_WIDTH              (64),
		.MEM_IF_CK_WIDTH              (2),
		.MEM_IF_CLK_EN_WIDTH          (1),
		.DEVICE_WIDTH                 (1),
		.MEM_TRCD                     (6),
		.MEM_TRTP                     (3),
		.MEM_DQS_TO_CLK_CAPTURE_DELAY (100),
		.MEM_IF_ODT_WIDTH             (1),
		.MEM_MIRROR_ADDRESSING_DEC    (0),
		.MEM_REGDIMM_ENABLED          (0),
		.DEVICE_DEPTH                 (1),
		.MEM_INIT_EN                  (0),
		.MEM_INIT_FILE                (""),
		.DAT_DATA_WIDTH               (32)
	) m0 (
		.mem_a     (M1_DDR2_addr),     // memory.mem_a
		.mem_ba    (M1_DDR2_ba),    //       .mem_ba
		.mem_ck    (M1_DDR2_clk),    //       .mem_ck
		.mem_ck_n  (M1_DDR2_clk_n),  //       .mem_ck_n
		.mem_cke   (M1_DDR2_cke),   //       .mem_cke
		.mem_cs_n  (M1_DDR2_cs_n),  //       .mem_cs_n
		.mem_dm    (M1_DDR2_dm),    //       .mem_dm
		.mem_ras_n (M1_DDR2_ras_n), //       .mem_ras_n
		.mem_cas_n (M1_DDR2_cas_n), //       .mem_cas_n
		.mem_we_n  (M1_DDR2_we_n),  //       .mem_we_n
		.mem_dq    (M1_DDR2_dq),    //       .mem_dq
		.mem_dqs   (M1_DDR2_dqs),   //       .mem_dqs
		.mem_dqs_n (M1_DDR2_dqsn), //       .mem_dqs_n
		.mem_odt   (M1_DDR2_odt)    //       .mem_odt
	);

//
// DDR controller
//

wire ddr_ready;
wire ddr_burstbegin;
wire [29:0] ddr_address;
wire ddr_readdatavalid;
wire [255:0] ddr_readdata;
wire [255:0] ddr_writedata;
wire [31:0] ddr_be;
wire ddr_read;
wire ddr_write;
wire [5:0] ddr_burstcount;

wire clk_ddr;
wire resetn_ddr;
wire ddr_init_done;

ddr ddr_inst
(
	.pll_ref_clk (OSC50),
	.afi_clk (clk_ddr),
	.afi_reset_n(resetn_ddr),
	.global_reset_n (reset_n),
	.soft_reset_n (1'b1),

	.avl_ready(ddr_ready),
	.avl_burstbegin(ddr_burstbegin),
	.avl_addr(ddr_address[29:5]),
	.avl_rdata_valid(ddr_readdatavalid),
	.avl_rdata(ddr_readdata),
	.avl_wdata(ddr_writedata),
	.avl_be(ddr_be),
	.avl_read_req(ddr_read),
	.avl_write_req(ddr_write),
	.avl_size(ddr_burstcount),
	
	.mem_a (M1_DDR2_addr),
	.mem_ba (M1_DDR2_ba),
	.mem_cas_n (M1_DDR2_cas_n),
	.mem_cke (M1_DDR2_cke),
	.mem_ck (M1_DDR2_clk),
	.mem_ck_n (M1_DDR2_clk_n),
	.mem_cs_n (M1_DDR2_cs_n),
	.mem_dm (M1_DDR2_dm),
	.mem_dq (M1_DDR2_dq),
	.mem_dqs (M1_DDR2_dqs),
	.mem_dqs_n (M1_DDR2_dqsn),
	.mem_odt (M1_DDR2_odt),
	.mem_ras_n (M1_DDR2_ras_n),
	.mem_we_n (M1_DDR2_we_n),
	
	.local_init_done(ddr_init_done),
	
	.oct_rup(RUP),
	.oct_rdn(RDN)
);

//
// Clock generator
//

logic clk_a;

initial clk_a = 1;
always #2.222 clk_a = ~clk_a;

//
// Portmux signals
//

logic [31:0] usb_address;
logic usb_address_want;
logic usb_address_ready;
logic [31:0] usb_writedata;
logic usb_writedata_want;
logic usb_writedata_ready;
logic [31:0] usb_readdata;
logic usb_readdata_want;
logic usb_readdata_ready;


//
// Main system
//

system u0
(
	.ddr_clk_clk         (clk_ddr),         
	.reset_reset   (!reset_n),   
	.ddr_waitrequest     (!ddr_ready),     //        ddr.waitrequest
	.ddr_read            (ddr_read),            //           .read
	.ddr_burstcount      (ddr_burstcount),      //           .burstcount
	.ddr_address         (ddr_address),         //           .address
	.ddr_byteenable      (ddr_be),      //           .byteenable
	.ddr_burstbegin      (ddr_burstbegin),      //           .burstbegin
	.ddr_readdatavalid   (ddr_readdatavalid),   //           .readdatavalid
	.ddr_readdata        (ddr_readdata),        //           .readdata
	.ddr_writedata       (ddr_writedata),       //           .writedata
	.ddr_write           (ddr_write),           //           .write
	.usb_writedata_ready (usb_writedata_ready), //        usb.writedata_ready
	.usb_address         (usb_address),         //           .address
	.usb_address_want    (usb_address_want),    //           .address_want
	.usb_readdata_want   (usb_readdata_want),   //           .readdata_want
	.usb_writedata_want  (usb_writedata_want),  //           .writedata_want
	.usb_writedata       (usb_writedata),       //           .writedata
	.usb_readdata_ready  (usb_readdata_ready),  //           .readdata_ready
	.usb_readdata        (usb_readdata),        //           .readdata
	.usb_address_ready   (usb_address_ready),   //           .address_ready
    .comp_clk_clk      (clk_a)       //         .clk1x
);

//
// Testbench code
//

integer fp;
integer d;
logic [31:0] Nb;
logic [31:0] N;
logic [63:0] cycles;
real cycles_time;

initial begin
	usb_address = '0;
	usb_address_ready = 1'b0;
	usb_writedata = '0;
	usb_writedata_ready = 1'b0;
	usb_readdata_want = 1'b0;
	
	// Open input file
	/*
	fp = $fopen("", "r");
	if (fp == 0) begin
		$display ("Unable to open file");
		$stop;
	end
	*/
	
	// Reset
	wait(reset_n == 1'b1);
	@(posedge OSC50);
	@(posedge OSC50);
	@(posedge OSC50);
	@(posedge OSC50);
	
	/*
	// Set initial address to 0
	usb_address_ready = 1'b1;
	wait (usb_address_want);
	@(posedge OSC50);
	usb_address_ready = 1'b0;
	
	// Upload matrix
	d = $fscanf(fp, "%d\n", Nb);
	N = Nb * 32;
	for (integer i = 0; i < (N*N); i++) begin
		shortreal val;
		d = $fscanf(fp, "%f\n", val);
		
		#1;
		wait (usb_writedata_want);
		usb_writedata = $shortrealtobits(val);
		usb_writedata_ready = 1'b1;
		@(posedge OSC50);
		usb_writedata_ready = 1'b0;
	end
	
	$fclose(fp);*/
	
	wait (ddr_init_done);
	
	m0.depth_gen[0].width_gen[0].mem_inst.rank_gen[0].rank_inst.load_fp_mem(`D_INFILE, N);
	Nb = N / 64;
	
	// Set address to 0x40000000 (N register)
	#1;
	wait (usb_address_want);
	usb_address = 32'h40000000;
	usb_address_ready = 1'b1;
	@(posedge clk_ddr);
	usb_address_ready = 1'b0;
	
	// Write matrix size in blocks
	#1;
	wait (usb_writedata_want);
	usb_writedata = Nb;
	usb_writedata_ready = 1'b1;
	@(posedge clk_ddr);
	usb_writedata_ready = 1'b0;
	
	// Set address to 0x40000008 (go/done register)
	#1;
	wait (usb_address_want);
	usb_address = 32'h40000008;
	usb_address_ready = 1'b1;
	@(posedge clk_ddr);
	usb_address_ready = 1'b0;
	
	// Start the engine
	#1;
	wait (usb_writedata_want);
	usb_writedata = 1;
	usb_writedata_ready = 1'b1;
	@(posedge clk_ddr);
	usb_writedata_ready = 1'b0;
	
	// Set address to 0x40000008 (go/done register)
	#1;
	wait (usb_address_want);
	usb_address = 32'h40000008;
	usb_address_ready = 1'b1;
	@(posedge clk_ddr);
	usb_address_ready = 1'b0;
	
	// This read blocks until computation is done
	#1;
	usb_readdata_want = 1'b1;
	wait(usb_readdata_ready);
	@(posedge clk_ddr);
	usb_readdata_want = 1'b0;
	
	// Wait for DDR writes to commit (this is messy)
	for (int q = 0; q < 128; q++)
		@(posedge clk_ddr);
		
	// Set address to 0x40000004 (cycles high)
	#1;
	wait (usb_address_want);
	usb_address = 32'h40000004;
	usb_address_ready = 1'b1;
	@(posedge clk_ddr);
	usb_address_ready = 1'b0;
	
	// Read high 32 bits of cycle count
	#1;
	usb_readdata_want = 1'b1;
	wait(usb_readdata_ready);
	@(posedge clk_ddr);
	cycles[63:32] = usb_readdata;
	usb_readdata_want = 1'b0;
	
	// Set address to 0x4000000c (cycles low)
	#1;
	wait (usb_address_want);
	usb_address = 32'h4000000c;
	usb_address_ready = 1'b1;
	@(posedge clk_ddr);
	usb_address_ready = 1'b0;
	
	// Read low 32 bits of cycle count
	#1;
	usb_readdata_want = 1'b1;
	wait(usb_readdata_ready);
	@(posedge clk_ddr);
	cycles[31:0] = usb_readdata;
	usb_readdata_want = 1'b0;
	
	cycles_time = real'(cycles) / 200_000_000.0;
	$display("Cycle count: %d", cycles);
	$display("Cycle time: %f", cycles_time);
	
	// Dump contents of DDR (faster than using USB)
	m0.depth_gen[0].width_gen[0].mem_inst.rank_gen[0].rank_inst.dump_fp_mem(`D_OUTFILE, N);
	
	/*
	// Open output file
	fp = $fopen("tb_data_out.txt", "w");
	if (fp == 0) begin
		$display ("Unable to open file\n");
		$stop;
	end
	
	// Set initial address to 0
	usb_address_ready = 1'b1;
	usb_address = 32'h0;
	wait (usb_address_want);
	@(posedge OSC50);
	usb_address_ready = 1'b0;
	
	// Download result into file
	for (integer i = 0; i < N; i++) begin
	for (integer j = 0; j < N; j++) begin
		shortreal val;
		
		#1;
		usb_readdata_want = 1'b1;
		wait(usb_readdata_ready);
		val = $bitstoshortreal(usb_readdata);
		@(posedge OSC50);
		usb_readdata_want = 1'b0;
		
		$fdisplay(fp, "%f ", val);
	end
	end
	
	$fclose(fp);*/
	
	$stop(0);
end

endmodule
