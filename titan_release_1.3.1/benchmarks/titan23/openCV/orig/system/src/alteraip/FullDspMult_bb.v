// megafunction wizard: %LPM_MULT%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_mult 

// ============================================================
// File Name: FullDspMult.v
// Megafunction Name(s):
// 			lpm_mult
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 11.0 Build 157 04/27/2011 SJ Full Version
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

module FullDspMult (
	dataa,
	datab,
	result);

	input	[35:0]  dataa;
	input	[35:0]  datab;
	output	[71:0]  result;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AutoSizeResult NUMERIC "1"
// Retrieval info: PRIVATE: B_isConstant NUMERIC "0"
// Retrieval info: PRIVATE: ConstantB NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
// Retrieval info: PRIVATE: Latency NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: SignedMult NUMERIC "0"
// Retrieval info: PRIVATE: USE_MULT NUMERIC "1"
// Retrieval info: PRIVATE: ValidConstant NUMERIC "0"
// Retrieval info: PRIVATE: WidthA NUMERIC "36"
// Retrieval info: PRIVATE: WidthB NUMERIC "36"
// Retrieval info: PRIVATE: WidthP NUMERIC "72"
// Retrieval info: PRIVATE: aclr NUMERIC "0"
// Retrieval info: PRIVATE: clken NUMERIC "0"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: PRIVATE: optimize NUMERIC "1"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_HINT STRING "MAXIMIZE_SPEED=9"
// Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MULT"
// Retrieval info: CONSTANT: LPM_WIDTHA NUMERIC "36"
// Retrieval info: CONSTANT: LPM_WIDTHB NUMERIC "36"
// Retrieval info: CONSTANT: LPM_WIDTHP NUMERIC "72"
// Retrieval info: USED_PORT: dataa 0 0 36 0 INPUT NODEFVAL "dataa[35..0]"
// Retrieval info: USED_PORT: datab 0 0 36 0 INPUT NODEFVAL "datab[35..0]"
// Retrieval info: USED_PORT: result 0 0 72 0 OUTPUT NODEFVAL "result[71..0]"
// Retrieval info: CONNECT: @dataa 0 0 36 0 dataa 0 0 36 0
// Retrieval info: CONNECT: @datab 0 0 36 0 datab 0 0 36 0
// Retrieval info: CONNECT: result 0 0 72 0 @result 0 0 72 0
// Retrieval info: GEN_FILE: TYPE_NORMAL FullDspMult.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL FullDspMult.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL FullDspMult.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL FullDspMult.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL FullDspMult_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL FullDspMult_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
