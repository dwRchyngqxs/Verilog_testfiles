// megafunction wizard: %FIFO%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: dcfifo 

// ============================================================
// File Name: Sdram_FIFO.v
// Megafunction Name(s):
// 			dcfifo
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 5.0 Build 148 04/26/2005 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2005 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic       
//functions, and any output files any of the foregoing           
//(including device programming or simulation files), and any    
//associated documentation or information are expressly subject  
//to the terms and conditions of the Altera Program License      
//Subscription Agreement, Altera MegaCore Function License       
//Agreement, or other applicable license agreement, including,   
//without limitation, that your use is for the sole purpose of   
//programming logic devices manufactured by Altera and sold by   
//Altera or its authorized distributors.  Please refer to the    
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module Sdram_FIFO (
	data,
	wrreq,
	rdreq,
	rdclk,
	wrclk,
	aclr,
	q,
	rdempty,
	rdusedw,
	wrfull,
	wrusedw);

	input	[15:0]  data;
	input	  wrreq;
	input	  rdreq;
	input	  rdclk;
	input	  wrclk;
	input	  aclr;
	output	[15:0]  q;
	output	  rdempty;
	output	[11:0]  rdusedw;
	output	  wrfull;
	output	[11:0]  wrusedw;

	wire  sub_wire0;
	wire [11:0] sub_wire1;
	wire  sub_wire2;
	wire [15:0] sub_wire3;
	wire [11:0] sub_wire4;
	wire  rdempty = sub_wire0;
	wire [11:0] wrusedw = sub_wire1[11:0];
	wire  wrfull = sub_wire2;
	wire [15:0] q = sub_wire3[15:0];
	wire [11:0] rdusedw = sub_wire4[11:0];

	dcfifo	dcfifo_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.aclr (aclr),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.rdempty (sub_wire0),
				.wrusedw (sub_wire1),
				.wrfull (sub_wire2),
				.q (sub_wire3),
				.rdusedw (sub_wire4)
				// synopsys translate_off
				,
				.rdfull (),
				.wrempty ()
				// synopsys translate_on
				);
	defparam
		dcfifo_component.lpm_width = 16,
		dcfifo_component.lpm_numwords = 512,
		dcfifo_component.lpm_widthu = 9,
		dcfifo_component.intended_device_family = "Cyclone",
		dcfifo_component.clocks_are_synchronized = "FALSE",
		dcfifo_component.lpm_type = "dcfifo",
		dcfifo_component.lpm_showahead = "OFF",
		dcfifo_component.overflow_checking = "OFF",
		dcfifo_component.underflow_checking = "OFF",
		dcfifo_component.use_eab = "ON",
		dcfifo_component.add_ram_output_register = "OFF",
		dcfifo_component.lpm_hint = "RAM_BLOCK_TYPE=M4K";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: Width NUMERIC "16"
// Retrieval info: PRIVATE: Depth NUMERIC "512"
// Retrieval info: PRIVATE: Clock NUMERIC "4"
// Retrieval info: PRIVATE: CLOCKS_ARE_SYNCHRONIZED NUMERIC "0"
// Retrieval info: PRIVATE: Full NUMERIC "1"
// Retrieval info: PRIVATE: Empty NUMERIC "1"
// Retrieval info: PRIVATE: UsedW NUMERIC "1"
// Retrieval info: PRIVATE: AlmostFull NUMERIC "0"
// Retrieval info: PRIVATE: AlmostEmpty NUMERIC "0"
// Retrieval info: PRIVATE: AlmostFullThr NUMERIC "-1"
// Retrieval info: PRIVATE: AlmostEmptyThr NUMERIC "-1"
// Retrieval info: PRIVATE: sc_aclr NUMERIC "0"
// Retrieval info: PRIVATE: sc_sclr NUMERIC "0"
// Retrieval info: PRIVATE: rsFull NUMERIC "0"
// Retrieval info: PRIVATE: rsEmpty NUMERIC "1"
// Retrieval info: PRIVATE: rsUsedW NUMERIC "1"
// Retrieval info: PRIVATE: wsFull NUMERIC "1"
// Retrieval info: PRIVATE: wsEmpty NUMERIC "0"
// Retrieval info: PRIVATE: wsUsedW NUMERIC "1"
// Retrieval info: PRIVATE: dc_aclr NUMERIC "1"
// Retrieval info: PRIVATE: LegacyRREQ NUMERIC "1"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "2"
// Retrieval info: PRIVATE: MAX_DEPTH_BY_9 NUMERIC "0"
// Retrieval info: PRIVATE: LE_BasedFIFO NUMERIC "0"
// Retrieval info: PRIVATE: Optimize NUMERIC "2"
// Retrieval info: PRIVATE: OVERFLOW_CHECKING NUMERIC "1"
// Retrieval info: PRIVATE: UNDERFLOW_CHECKING NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "16"
// Retrieval info: CONSTANT: LPM_NUMWORDS NUMERIC "512"
// Retrieval info: CONSTANT: LPM_WIDTHU NUMERIC "9"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone"
// Retrieval info: CONSTANT: CLOCKS_ARE_SYNCHRONIZED STRING "FALSE"
// Retrieval info: CONSTANT: LPM_TYPE STRING "dcfifo"
// Retrieval info: CONSTANT: LPM_SHOWAHEAD STRING "OFF"
// Retrieval info: CONSTANT: OVERFLOW_CHECKING STRING "OFF"
// Retrieval info: CONSTANT: UNDERFLOW_CHECKING STRING "OFF"
// Retrieval info: CONSTANT: USE_EAB STRING "ON"
// Retrieval info: CONSTANT: ADD_RAM_OUTPUT_REGISTER STRING "OFF"
// Retrieval info: CONSTANT: LPM_HINT STRING "RAM_BLOCK_TYPE=M4K"
// Retrieval info: USED_PORT: data 0 0 16 0 INPUT NODEFVAL data[15..0]
// Retrieval info: USED_PORT: q 0 0 16 0 OUTPUT NODEFVAL q[15..0]
// Retrieval info: USED_PORT: wrreq 0 0 0 0 INPUT NODEFVAL wrreq
// Retrieval info: USED_PORT: rdreq 0 0 0 0 INPUT NODEFVAL rdreq
// Retrieval info: USED_PORT: rdclk 0 0 0 0 INPUT NODEFVAL rdclk
// Retrieval info: USED_PORT: wrclk 0 0 0 0 INPUT NODEFVAL wrclk
// Retrieval info: USED_PORT: rdempty 0 0 0 0 OUTPUT NODEFVAL rdempty
// Retrieval info: USED_PORT: rdusedw 0 0 12 0 OUTPUT NODEFVAL rdusedw[11..0]
// Retrieval info: USED_PORT: wrfull 0 0 0 0 OUTPUT NODEFVAL wrfull
// Retrieval info: USED_PORT: wrusedw 0 0 12 0 OUTPUT NODEFVAL wrusedw[11..0]
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT GND aclr
// Retrieval info: CONNECT: @data 0 0 16 0 data 0 0 16 0
// Retrieval info: CONNECT: q 0 0 16 0 @q 0 0 16 0
// Retrieval info: CONNECT: @wrreq 0 0 0 0 wrreq 0 0 0 0
// Retrieval info: CONNECT: @rdreq 0 0 0 0 rdreq 0 0 0 0
// Retrieval info: CONNECT: @rdclk 0 0 0 0 rdclk 0 0 0 0
// Retrieval info: CONNECT: @wrclk 0 0 0 0 wrclk 0 0 0 0
// Retrieval info: CONNECT: rdempty 0 0 0 0 @rdempty 0 0 0 0
// Retrieval info: CONNECT: rdusedw 0 0 12 0 @rdusedw 0 0 12 0
// Retrieval info: CONNECT: wrfull 0 0 0 0 @wrfull 0 0 0 0
// Retrieval info: CONNECT: wrusedw 0 0 12 0 @wrusedw 0 0 12 0
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO_bb.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO_waveforms.html FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_FIFO_wave*.jpg FALSE
