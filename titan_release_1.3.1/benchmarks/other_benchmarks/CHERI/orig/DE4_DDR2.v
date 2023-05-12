// ============================================================================
// Copyright (c) 2010 by Terasic Technologies Inc. 
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
// Major Functions/Design Description:
//
//   Please refer to DE4_UserManual.pdf in DE4 system CD.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |Richard   |10/06/30      |
// ============================================================================


//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================
//`define USE_DDR2_DIMM2

module DE4_DDR2(

	//////// CLOCK //////////
	GCLKIN,
	GCLKOUT_FPGA,
	MAX_CONF_D,
	MAX_PLL_D,
	OSC_50_Bank2,
	OSC_50_Bank3,
	OSC_50_Bank4,
	OSC_50_Bank5,
	OSC_50_Bank6,
	OSC_50_Bank7,
	PLL_CLKIN_p,

	//////// LED x 8 //////////
	LED,

	//////// BUTTON x 4 //////////
	BUTTON,
	CPU_RESET_n,
	EXT_IO,
	
	//////// Ethernet x 4 //////////
	ETH_INT_n,
	ETH_MDC,
	ETH_MDIO,
	ETH_RST_n,
	ETH_RX_p,
	ETH_TX_p,
	
	//////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_n,

`ifndef USE_DDR2_DIMM2
	//////// DDR2 SODIMM //////////
	M1_DDR2_addr,
	M1_DDR2_ba,
	M1_DDR2_cas_n,
	M1_DDR2_cke,
	M1_DDR2_clk,
	M1_DDR2_clk_n,
	M1_DDR2_cs_n,
	M1_DDR2_dm,
	M1_DDR2_dq,
	M1_DDR2_dqs,
	M1_DDR2_dqsn,
	M1_DDR2_odt,
	M1_DDR2_ras_n,
	M1_DDR2_SA,
	M1_DDR2_SCL,
	M1_DDR2_SDA,
	M1_DDR2_we_n,

`else
	//////// DDR2 SODIMM //////////

	M2_DDR2_addr,
	M2_DDR2_ba,
	M2_DDR2_cas_n,
	M2_DDR2_cke,
	M2_DDR2_clk,
	M2_DDR2_clk_n,
	M2_DDR2_cs_n,
	M2_DDR2_dm,
	M2_DDR2_dq,
	M2_DDR2_dqs,
	M2_DDR2_dqsn,
	M2_DDR2_odt,
	M2_DDR2_ras_n,
	M2_DDR2_SA,
	M2_DDR2_SCL,
	M2_DDR2_SDA,
	M2_DDR2_we_n,
`endif	//USE_DDR2_DIMM2
	termination_blk0_rup_pad,
	termination_blk0_rdn_pad,

	//////////// DIP SWITCH x 8 //////////
	SW,

	//////////// SLIDE SWITCH x 4 //////////
	SLIDE_SW,

	//////////// SEG7 //////////
	SEG0_D,
	SEG0_DP,
	SEG1_D,
	SEG1_DP,

	//////////// Temperature //////////
	TEMP_INT_n,
	TEMP_SMCLK,
	TEMP_SMDAT,

	//////////// Current //////////
	CSENSE_ADC_FO,
	CSENSE_CS_n,
	CSENSE_SCK,
	CSENSE_SDI,
	CSENSE_SDO,

	//////////// Fan //////////
	FAN_CTRL,
	
	//////////// Flash and SRAM Address/Data Share Bus //////////
	FSM_A,
	FSM_D,

	//////////// Flash Control //////////
	FLASH_ADV_n,
	FLASH_CE_n,
	FLASH_CLK,
	FLASH_OE_n,
	FLASH_RESET_n,
	FLASH_RYBY_n,
	FLASH_WE_n,

	//////////// SSRAM Control //////////
	SSRAM_ADV,
	SSRAM_BWA_n,
	SSRAM_BWB_n,
	SSRAM_CE_n,
	SSRAM_CKE_n,
	SSRAM_CLK,
	SSRAM_OE_n,
	SSRAM_WE_n,

	//////////// GPIO_0, GPIO_0 connect to LTM - 4.3" LCD and Touch //////////
	lcdtouchLTM_ADC_BUSY,
	lcdtouchLTM_ADC_DCLK,
	lcdtouchLTM_ADC_DIN,
	lcdtouchLTM_ADC_DOUT,
	lcdtouchLTM_ADC_PENIRQ_n,
	lcdtouchLTM_B,
	lcdtouchLTM_DEN,
	lcdtouchLTM_G,
	lcdtouchLTM_GREST,
	lcdtouchLTM_HD,
	lcdtouchLTM_NCLK,
	lcdtouchLTM_R,
	lcdtouchLTM_SCEN,
	lcdtouchLTM_SDA,
	lcdtouchLTM_VD,
	
	//////////// GPIO_1 connect to MTL capacitive touch screen
	mtl_dclk,
	mtl_r,
	mtl_g,
	mtl_b,
	mtl_hsd,
	mtl_vsd,
	mtl_touch_i2cscl,
	mtl_touch_i2csda,
	mtl_touch_int
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input		          		GCLKIN;
output		          		GCLKOUT_FPGA;
inout		     [2:0]		MAX_CONF_D;
output		     [2:0]		MAX_PLL_D;
input		          		OSC_50_Bank2;
input		          		OSC_50_Bank3;
input		          		OSC_50_Bank4;
input		          		OSC_50_Bank5;
input		          		OSC_50_Bank6;
input		          		OSC_50_Bank7;
input		          		PLL_CLKIN_p;

//////////// Ethernet x 4 //////////
input		     [3:0]		ETH_INT_n;
output		     [3:0]		ETH_MDC;
inout		     [3:0]		ETH_MDIO;
output		          		ETH_RST_n;
//input		     [3:0]		ETH_RX_p;
//output		     [3:0]		ETH_TX_p;

//////////// SDCARD //////////
output		          	SD_CLK;
inout		          		SD_CMD;
inout		     [3:0]		SD_DAT;
input		          		SD_WP_n;

//////////// LED x 8 //////////
output		     [7:0]		LED;

//////////// BUTTON x 4 //////////
input		     [3:0]		BUTTON;
input		          		CPU_RESET_n;
inout		          		EXT_IO;

//////////// DDR2 SODIMM //////////
output		    [15:0]		M1_DDR2_addr;
output		     [2:0]		M1_DDR2_ba;
output		          		M1_DDR2_cas_n;
output		     [1:0]		M1_DDR2_cke;
inout		     [1:0]		M1_DDR2_clk;
inout		     [1:0]		M1_DDR2_clk_n;
output		     [1:0]		M1_DDR2_cs_n;
output		     [7:0]		M1_DDR2_dm;
inout		    [63:0]		M1_DDR2_dq;
inout		     [7:0]		M1_DDR2_dqs;
inout		     [7:0]		M1_DDR2_dqsn;
output		     [1:0]		M1_DDR2_odt;
output		          		M1_DDR2_ras_n;
output		     [1:0]		M1_DDR2_SA;
output		          		M1_DDR2_SCL;
inout		          		M1_DDR2_SDA;
output		          		M1_DDR2_we_n;

input 						   termination_blk0_rup_pad;
input                      termination_blk0_rdn_pad;

//////////// DIP SWITCH x 8 //////////
input		     [7:0]		SW;

//////////// SLIDE SWITCH x 4 //////////
input		     [3:0]		SLIDE_SW;

//////////// SEG7 //////////
output		     [6:0]		SEG0_D;
output		          		SEG0_DP;
output		     [6:0]		SEG1_D;
output		          		SEG1_DP;

//////////// Temperature //////////
input		          			TEMP_INT_n;
output		          		TEMP_SMCLK;
inout		          			TEMP_SMDAT;

//////////// Current //////////
output		          		CSENSE_ADC_FO;
output		     [1:0]		CSENSE_CS_n;
output		          		CSENSE_SCK;
output		          		CSENSE_SDI;
input		          			CSENSE_SDO;

//////////// Fan //////////
output		          		FAN_CTRL;

//////////// Flash and SRAM Address/Data Share Bus //////////
output		    [25:1]		FSM_A;
inout		    [15:0]			FSM_D;

//////////// Flash Control //////////
output		          		FLASH_ADV_n;
output		          		FLASH_CE_n;
output		          		FLASH_CLK;
output		          		FLASH_OE_n;
output		          		FLASH_RESET_n;
input		          			FLASH_RYBY_n;
output		          		FLASH_WE_n;
  
//////////// SSRAM Control //////////
output		          		SSRAM_ADV;
output		          		SSRAM_BWA_n;
output		          		SSRAM_BWB_n;
output		          		SSRAM_CE_n;
output		          		SSRAM_CKE_n;
output		          		SSRAM_CLK;
output		          		SSRAM_OE_n;
output		          		SSRAM_WE_n;

//////////// GPIO_0, GPIO_0 connect to LTM - 4.3" LCD and Touch //////////
input		          			lcdtouchLTM_ADC_BUSY;
output		          		lcdtouchLTM_ADC_DCLK;
output		          		lcdtouchLTM_ADC_DIN;
input		          			lcdtouchLTM_ADC_DOUT;
input		          			lcdtouchLTM_ADC_PENIRQ_n;
output		     [7:0]		lcdtouchLTM_B;
output		          		lcdtouchLTM_DEN;
output		     [7:0]		lcdtouchLTM_G;
output		          		lcdtouchLTM_GREST;
output		          		lcdtouchLTM_HD;
output		          		lcdtouchLTM_NCLK;
output		     [7:0]		lcdtouchLTM_R;
output		          		lcdtouchLTM_SCEN;
inout		          			lcdtouchLTM_SDA;
output		          		lcdtouchLTM_VD;

/////////// GPIO_1 connected to the capacitive multitouch screen
output	      mtl_dclk;
output [7:0]	mtl_r;
output [7:0]	mtl_g;
output [7:0]	mtl_b;
output      	mtl_hsd;
output      	mtl_vsd;
output      	mtl_touch_i2cscl;
inout       	mtl_touch_i2csda;
input       	mtl_touch_int;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire						global_reset_n;
wire						enet_reset_n;

//// Ethernet
wire						enet_mdc;
wire						enet_mdio_in;
wire						enet_mdio_oen;
wire						enet_mdio_out;
wire						enet_refclk_125MHz;

wire						lvds_rxp;
wire						lvds_txp;


//=======================================================
//  Structural coding
//=======================================================

// Assign outputs that are not used to 0
assign MAX_PLL_D = 3'b0;
assign ETH_MDC[3:1] = 3'b0;
assign M1_DDR2_SA = 1'b0;
assign CSENSE_CS_n = 1'b0;
assign CSENSE_ADC_FO = 1'b0;
assign CSENSE_SCK = 1'b0;
assign CSENSE_SDI = 1'b0;
assign GCLKOUT_FPGA = 1'b0;
assign M1_DDR2_SCL = 1'b0;


//// Ethernet
assign	ETH_RST_n			= enet_reset_n;

input		     [0:0]		ETH_RX_p;
output		     [0:0]		ETH_TX_p;
assign	lvds_rxp			= ETH_RX_p[0];
assign	ETH_TX_p[0]			= lvds_txp;
assign	enet_mdio_in		= ETH_MDIO[0];
assign	ETH_MDIO[0]			= !enet_mdio_oen ? enet_mdio_out : 1'bz;
assign	ETH_MDC[0]			= enet_mdc;

wire mipsClk;
wire clk25;
wire [7:0] LED_n;

//wire ddr_sysClk;
//assign SSRAM_CLK = ddr_sysClk;

assign LED = ~LED_n;

// === Ethernet clock PLL
pll_125 pll_125_ins (
							.inclk0(OSC_50_Bank4),
							.c0(enet_refclk_125MHz)
							//.c1(SSRAM_CLK)
				);
			
wire sramClk;
assign SSRAM_CLK=sramClk;
/*
AltClkCtl clkCtl (
							.inclk(sramClk),
							.outclk(SSRAM_CLK)
				);
*/
/****************************************************************************
   From Simon's Project
*****************************************************************************/	
 
  // synchronize reset signal
  reg           rstn, rstn_metastable;
  always @(posedge OSC_50_Bank2)
	begin
	  rstn_metastable <= CPU_RESET_n;
	  rstn <= rstn_metastable;
	end
	

  
  // clocks generated by the mail PLL
  (* keep = 1 *) wire clk33;
  (* noprune *) reg rstn33;
  reg rstn33sample;
    
  always @(posedge clk33)
    begin
      rstn33sample <= rstn;
      rstn33 <= rstn33sample;
    end
  
  reg [7:0] SW_P;
  always @(posedge OSC_50_Bank2)
    SW_P <= ~SW;  // positive version of DIP switches

  wire [15:0] hexleds;
  assign SEG1_DP = ~1'b0;
  assign SEG1_D  = ~hexleds[14:8];
  assign SEG0_DP = ~1'b0;
  assign SEG0_D  = ~hexleds[6:0];
  
  reg [3:0]   slide_sw_metastable, slide_sw_sync;
  always @(posedge OSC_50_Bank2)
    begin
      slide_sw_metastable <= SLIDE_SW;
      slide_sw_sync <= slide_sw_metastable;
    end
  
  //  assign PCIE_WAKE_n = 1'b0;
  //  assign PCIE_SMBDATA = 1'bz;
  
  // signals for the old Terasic resistive touch screen (currently unused)
  wire [7:0] vga_R, vga_G, vga_B;
  wire       vga_DEN, vga_HD, vga_VD;
  
  assign vga_DEN = 1'b0;
  assign vga_HD = 1'b0;
  assign vga_VD = 1'b0;
  assign vga_R = 8'd0;
  assign vga_G = 8'd0;
  assign vga_B = 8'd0;
  
  assign lcdtouchLTM_R = vga_R;
  assign lcdtouchLTM_G = vga_G;
  assign lcdtouchLTM_B = vga_B;
  assign lcdtouchLTM_DEN = vga_DEN;
  assign lcdtouchLTM_HD = vga_HD;
  assign lcdtouchLTM_VD = vga_VD;
  
  assign lcdtouchLTM_GREST = rstn33;
  assign lcdtouchLTM_NCLK = clk33;
  
  assign lcdtouchLTM_SCEN = 1'b1;
  assign lcdtouchLTM_ADC_DCLK = 1'b1;
  assign lcdtouchLTM_ADC_DIN = 1'b1;

  // temperature reading and fan control  
  wire [7:0] temp_val;
  reg [7:0]  temp_dec_r;
  
  temperature_fan_control fan_speed(
    .clk50(OSC_50_Bank2),
    .rstn(rstn),
    .temperatureDegC(temp_val),
    .fanOn(FAN_CTRL));

  // display the temperature
  always @(posedge OSC_50_Bank2)
    begin
      temp_dec_r[3:0] <= temp_val % 8'd10;
      temp_dec_r[7:4] <= temp_val / 8'd10;
    end
  
  hex2leds digit0(.hexval(temp_dec_r[3:0]), .ledcode(hexleds[6:0]));
  hex2leds digit1(.hexval(temp_dec_r[7:4]), .ledcode(hexleds[14:8]));
    
  // clock for multitouch screen
  assign mtl_dclk      = clk33;

  
  (* keep = 1 *) wire        ssram_data_outen;
  (* keep = 1 *) wire [15:0] ssram_data_out;

  // instantiate the touch screen controller provided by Terasic (encrypted block)
  wire touch_ready;
  wire [9:0] touch_x1, touch_x2;
  wire [8:0] touch_y1, touch_y2;
  wire [1:0] touch_count;
  wire [7:0] touch_gesture;
  
  (* noprune *) reg rstn50;
  reg rstn50sample;
  
  always @(posedge OSC_50_Bank2)
    begin
      rstn50sample <= rstn;
      rstn50 <= rstn50sample;
    end
  
  i2c_touch_config touch(
    .iCLK(OSC_50_Bank2),
    .iRSTN(rstn50),
    .iTRIG(!mtl_touch_int), // note that this signal is inverted
    .oREADY(touch_ready),
    .oREG_X1(touch_x1),
    .oREG_Y1(touch_y1),
    .oREG_X2(touch_x2),
    .oREG_Y2(touch_y2),
    .oREG_TOUCH_COUNT(touch_count),
    .oREG_GESTURE(touch_gesture),
    .I2C_SCLK(mtl_touch_i2cscl),
    .I2C_SDAT(mtl_touch_i2csda));
						 
/****************************************************************************
   End
*****************************************************************************/	

DE4_SOPC DE4_SOPC_inst(
	// 1) global signals:
	 .clk_50(OSC_50_Bank4),
	 .reset_reset_n(rstn),
	 .leds_external_connection_export(LED_n),

	// the_ddr2
	 .ddr2_global_reset_reset_n(),
	  .memory_mem_cke                                   (M1_DDR2_cke),                                    //               ddr2.cke
	  .memory_mem_ck_n                                   (M1_DDR2_clk_n),                                   //                   .ck_n
	  .memory_mem_cas_n                                  (M1_DDR2_cas_n),                                  //                   .cas_n
	  .memory_mem_dq                                     (M1_DDR2_dq),                                     //                   .dq
	  .memory_mem_dqs                                    (M1_DDR2_dqs),                                    //                   .dqs
	  .memory_mem_odt                                    (M1_DDR2_odt),                                    //                   .odt
	  .memory_mem_cs_n                                   (M1_DDR2_cs_n),                                   //                   .cs_n
	  .memory_mem_ba                                     (M1_DDR2_ba),                                     //                   .ba
	  .memory_mem_dm                                     (M1_DDR2_dm),                                     //                   .dm
	  .memory_mem_we_n                                   (M1_DDR2_we_n),                                   //                   .we_n
	  .memory_mem_dqs_n                                  (M1_DDR2_dqsn),                                  //                   .dqs_n
	  .memory_mem_ras_n                                  (M1_DDR2_ras_n),                                  //                   .ras_n
	  .memory_mem_ck                                     (M1_DDR2_clk),                                     //                   .ck
	  .memory_mem_a                                      (M1_DDR2_addr),                                      //                   .a      
	  .oct_rup                          (termination_blk0_rup_pad),                          //                   .oct_rup
	  .oct_rdn                          (termination_blk0_rdn_pad),                          //                   .oct_rdn
						 
                  // ddr2 psd i2c
//                   .out_port_from_the_ddr2_i2c_scl(M1_DDR2_SCL),
//                   .out_port_from_the_ddr2_i2c_sa(M1_DDR2_SA),
//                   .bidir_port_to_and_from_the_ddr2_i2c_sda(M1_DDR2_SDA)                   

                /*   
		output wire        ddr2_aux_full_rate_clk_out,          //             ddr2_auxfull.clk
		output wire        ddr2_aux_half_rate_clk_out,          //             ddr2_auxhalf.clk
		output wire        local_init_done_from_the_ddr2,       //                         .local_init_done
		input  wire        mipsClk,                             //           mipsClk_clk_in.clk
		output wire        ddr2_phy_clk_out,                    //           sysclk_out_clk.clk
		*/
              
	// the_tse_mac
	.mac_mdio_out                        (enet_mdio_out),                        //                      mac.mdio_out
	.mac_mdio_oen                        (enet_mdio_oen),                        //                         .mdio_oen
	.mac_mdio_in                         (enet_mdio_in),                         //                         .mdio_in
	.mac_mdc                             (enet_mdc),                             //                         .mdc
	//.mac_led_an                          (led_an_from_the_tse_mac),              //                      mac.led_an
	//.mac_led_char_err                    (led_char_err_from_the_tse_mac),        //                         .led_char_err
	// led_col_from_the_tse_mac?
	// led_crs_from_the_tse_mac?
	//.mac_led_link                        (led_link_from_the_tse_mac),            //                         .led_link
	//.mac_led_disp_err                    (led_disp_err_from_the_tse_mac),        //                         .led_disp_err
	.mac_txp                             (lvds_txp),                             //                         .txp
	.mac_rxp                             (lvds_rxp),                             //                         .rxp
	.mac_ref_clk                         (enet_refclk_125MHz),                   //                         .ref_clk

	.sd_b_SD_cmd                         (SD_CMD),                         //                       sd.b_SD_cmd
	.sd_b_SD_dat                         (SD_DAT[0]),                         //                         .b_SD_dat
	.sd_b_SD_dat3                        (SD_DAT[3]),                        //                         .b_SD_dat3
	.sd_o_SD_clock                       (SD_CLK),                        //                         .o_SD_clock

	.mem_ssram_adv                 (SSRAM_ADV),                 //                fbssram_1.ssram_adv
	.mem_ssram_bwa_n               (SSRAM_BWA_n),               //                         .ssram_bwa_n
	.mem_ssram_bwb_n               (SSRAM_BWB_n),               //                         .ssram_bwb_n
	.mem_ssram_ce_n                (SSRAM_CE_n),                //                         .ssram_ce_n
	.mem_ssram_cke_n               (SSRAM_CKE_n),               //                         .ssram_cke_n
	.mem_ssram_oe_n                (SSRAM_OE_n),                //                         .ssram_oe_n
	.mem_ssram_we_n                (SSRAM_WE_n),                //                         .ssram_we_n
	.mem_fsm_a                     (FSM_A),                     //                         .fsm_a
	.mem_fsm_d_out                 (ssram_data_out),                 //                         .fsm_d_out
	.mem_fsm_d_in                  (FSM_D),                  //                         .fsm_d_in
	.mem_fsm_dout_req              (ssram_data_outen),              //                         .fsm_dout_req
	.mem_flash_adv_n               (FLASH_ADV_n),
	.mem_flash_ce_n                (FLASH_CE_n),
	.mem_flash_clk                 (FLASH_CLK),
	.mem_flash_oe_n                (FLASH_OE_n),
	.mem_flash_we_n                (FLASH_WE_n),
	.touch_x1                      (touch_x1),                  //                         .touch_x1
	.touch_y1                      (touch_y1),                  //                         .touch_y1
	.touch_x2                      (touch_x2),                  //                         .touch_x2
	.touch_y2                      (touch_y2),                  //                         .touch_y2
	.touch_count_gesture           ({touch_count,touch_gesture}),       //                         .touch_count_gesture
	.touch_touch_valid             (touch_ready),         //                         .touch_touch_valid
	.mtl_lcd_r                     (mtl_r),                             //                    mtl_1.r
	.mtl_lcd_g                     (mtl_g),                             //                         .g
	.mtl_lcd_b                     (mtl_b),                             //                         .b
	.mtl_lcd_hsd                   (mtl_hsd),                           //                         .hsd
	.mtl_lcd_vsd                   (mtl_vsd),                           //                         .vsd
	.sram_clk_clk                  (sramClk),                         //                 sram_clk.clk
//	.sram_clk_clk						 (SSRAM_CLK)
	.display_clk_clk					 (clk33),
	.switches_export               ({SLIDE_SW[3:0], BUTTON[3:0], SW_P[7:0]})
 );
 
  // handle unused flash reset signal
 assign FLASH_RESET_n = rstn;
 
// handle tristate ssram data bus
assign FSM_D         = ssram_data_outen ? ssram_data_out : 16'bzzzzzzzzzzzzzzzz;
endmodule