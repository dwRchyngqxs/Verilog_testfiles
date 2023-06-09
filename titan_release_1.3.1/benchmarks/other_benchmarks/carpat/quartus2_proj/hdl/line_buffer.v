// megafunction wizard: %Shift register (RAM-based)%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altshift_taps 

// ============================================================
// File Name: Line_Buffer.v
// Megafunction Name(s):
// 			altshift_taps
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 5.1 Build 176 10/26/2005 SJ Full Version
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
module Line_Buffer (
	clken,
	clock,
	shiftin,
	shiftout,
	taps0x,
	taps1x);

	input	  clken;
	input	  clock;
	input	[9:0]  shiftin;
	output	[9:0]  shiftout;
	output	[9:0]  taps0x;
	output	[9:0]  taps1x;

	wire [19:0] sub_wire0;
	wire [9:0] sub_wire3;
	wire [19:10] sub_wire1 = sub_wire0[19:10];
	wire [9:0] sub_wire2 = sub_wire0[9:0];
	wire [9:0] taps1x = sub_wire1[19:10];
	wire [9:0] taps0x = sub_wire2[9:0];
	wire [9:0] shiftout = sub_wire3[9:0];

	altshift_taps	altshift_taps_component (
				.clken (clken),
				.clock (clock),
				.shiftin (shiftin),
				.taps (sub_wire0),
				.shiftout (sub_wire3));
	defparam
		altshift_taps_component.lpm_type = "altshift_taps",
		altshift_taps_component.number_of_taps = 2,
		altshift_taps_component.tap_distance = 640,
		altshift_taps_component.width = 10;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: CLKEN NUMERIC "1"
// Retrieval info: PRIVATE: GROUP_TAPS NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: NUMBER_OF_TAPS NUMERIC "2"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: TAP_DISTANCE NUMERIC "640"
// Retrieval info: PRIVATE: WIDTH NUMERIC "10"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altshift_taps"
// Retrieval info: CONSTANT: NUMBER_OF_TAPS NUMERIC "2"
// Retrieval info: CONSTANT: TAP_DISTANCE NUMERIC "640"
// Retrieval info: CONSTANT: WIDTH NUMERIC "10"
// Retrieval info: USED_PORT: clken 0 0 0 0 INPUT VCC clken
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: USED_PORT: shiftin 0 0 10 0 INPUT NODEFVAL shiftin[9..0]
// Retrieval info: USED_PORT: shiftout 0 0 10 0 OUTPUT NODEFVAL shiftout[9..0]
// Retrieval info: USED_PORT: taps0x 0 0 10 0 OUTPUT NODEFVAL taps0x[9..0]
// Retrieval info: USED_PORT: taps1x 0 0 10 0 OUTPUT NODEFVAL taps1x[9..0]
// Retrieval info: CONNECT: @shiftin 0 0 10 0 shiftin 0 0 10 0
// Retrieval info: CONNECT: shiftout 0 0 10 0 @shiftout 0 0 10 0
// Retrieval info: CONNECT: taps0x 0 0 10 0 @taps 0 0 10 0
// Retrieval info: CONNECT: taps1x 0 0 10 0 @taps 0 0 10 10
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @clken 0 0 0 0 clken 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL Line_Buffer.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL Line_Buffer.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Line_Buffer.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Line_Buffer.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Line_Buffer_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Line_Buffer_bb.v FALSE
