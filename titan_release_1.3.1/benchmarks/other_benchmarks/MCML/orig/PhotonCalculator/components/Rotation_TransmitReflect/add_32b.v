// megafunction wizard: %LPM_ADD_SUB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_add_sub 

// ============================================================
// File Name: add_32b.v
// Megafunction Name(s):
// 			lpm_add_sub
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 7.2 Build 151 09/26/2007 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2007 Altera Corporation
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


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module add_32b (
	dataa,
	datab,
	overflow,
	result);

	input	[31:0]  dataa;
	input	[31:0]  datab;
	output	  overflow;
	output	[31:0]  result;

	wire  sub_wire0;
	wire [31:0] sub_wire1;
	wire  overflow = sub_wire0;
	wire [31:0] result = sub_wire1[31:0];

	lpm_add_sub	lpm_add_sub_component (
				.dataa (dataa),
				.datab (datab),
				.overflow (sub_wire0),
				.result (sub_wire1)
				// synopsys translate_off
				,
				.aclr (),
				.add_sub (),
				.cin (),
				.clken (),
				.clock (),
				.cout ()
				// synopsys translate_on
				);
	defparam
		lpm_add_sub_component.lpm_direction = "ADD",
		lpm_add_sub_component.lpm_hint = "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
		lpm_add_sub_component.lpm_type = "LPM_ADD_SUB",
		lpm_add_sub_component.lpm_width = 32;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: CarryIn NUMERIC "0"
// Retrieval info: PRIVATE: CarryOut NUMERIC "0"
// Retrieval info: PRIVATE: ConstantA NUMERIC "0"
// Retrieval info: PRIVATE: ConstantB NUMERIC "0"
// Retrieval info: PRIVATE: Function NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix II"
// Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
// Retrieval info: PRIVATE: Latency NUMERIC "0"
// Retrieval info: PRIVATE: Overflow NUMERIC "1"
// Retrieval info: PRIVATE: RadixA NUMERIC "10"
// Retrieval info: PRIVATE: RadixB NUMERIC "10"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "1"
// Retrieval info: PRIVATE: ValidCtA NUMERIC "0"
// Retrieval info: PRIVATE: ValidCtB NUMERIC "0"
// Retrieval info: PRIVATE: WhichConstant NUMERIC "0"
// Retrieval info: PRIVATE: aclr NUMERIC "0"
// Retrieval info: PRIVATE: clken NUMERIC "0"
// Retrieval info: PRIVATE: nBit NUMERIC "32"
// Retrieval info: CONSTANT: LPM_DIRECTION STRING "ADD"
// Retrieval info: CONSTANT: LPM_HINT STRING "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_ADD_SUB"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
// Retrieval info: USED_PORT: dataa 0 0 32 0 INPUT NODEFVAL dataa[31..0]
// Retrieval info: USED_PORT: datab 0 0 32 0 INPUT NODEFVAL datab[31..0]
// Retrieval info: USED_PORT: overflow 0 0 0 0 OUTPUT NODEFVAL overflow
// Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL result[31..0]
// Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
// Retrieval info: CONNECT: @dataa 0 0 32 0 dataa 0 0 32 0
// Retrieval info: CONNECT: @datab 0 0 32 0 datab 0 0 32 0
// Retrieval info: CONNECT: overflow 0 0 0 0 @overflow 0 0 0 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b_bb.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b_waveforms.html TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b_wave*.jpg FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL add_32b_syn.v TRUE
// Retrieval info: LIB_FILE: lpm
