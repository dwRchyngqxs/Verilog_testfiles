// megafunction wizard: %ALTCLKCTRL%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altclkctrl 

// ============================================================
// File Name: AltClkCtl.v
// Megafunction Name(s):
// 			altclkctrl
//
// Simulation Library Files(s):
// 			stratixiv
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 11.1 Build 173 11/01/2011 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2011 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module AltClkCtl (
	inclk,
	outclk)/* synthesis synthesis_clearbox = 1 */;

	input	  inclk;
	output	  outclk;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: clock_inputs NUMERIC "1"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: CONSTANT: USE_GLITCH_FREE_SWITCH_OVER_IMPLEMENTATION STRING "OFF"
// Retrieval info: CONSTANT: clock_type STRING "Periphery clock"
// Retrieval info: USED_PORT: inclk 0 0 0 0 INPUT NODEFVAL "inclk"
// Retrieval info: USED_PORT: outclk 0 0 0 0 OUTPUT NODEFVAL "outclk"
// Retrieval info: CONNECT: @ena 0 0 0 0 VCC 0 0 0 0
// Retrieval info: CONNECT: @inclk 0 0 3 1 GND 0 0 3 0
// Retrieval info: CONNECT: @inclk 0 0 1 0 inclk 0 0 0 0
// Retrieval info: CONNECT: outclk 0 0 0 0 @outclk 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL AltClkCtl.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL AltClkCtl.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL AltClkCtl.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL AltClkCtl.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL AltClkCtl_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL AltClkCtl_bb.v TRUE
// Retrieval info: LIB_FILE: stratixiv
