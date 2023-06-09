// megafunction wizard: %ALTMULT_ADD%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTMULT_ADD 

// ============================================================
// File Name: dsp_shift_megafn.v
// Megafunction Name(s):
// 			ALTMULT_ADD
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.0 Build 178 05/31/2012 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2012 Altera Corporation
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

module dsp_shift_megafn (
	clock0,
	dataa_0,
	datab_0,
	rotate,
	shift_right,
	result);

	input	  clock0;
	input	[31:0]  dataa_0;
	input	[31:0]  datab_0;
	input	  rotate;
	input	  shift_right;
	output	[31:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1	  clock0;
	tri0	[31:0]  dataa_0;
	tri0	[31:0]  datab_0;
	tri0	  rotate;
	tri0	  shift_right;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: ACCUM_DIRECTION STRING "Add"
// Retrieval info: PRIVATE: ACCUM_SLOAD_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ACCUM_SLOAD_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ACCUM_SLOAD_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ACCUM_SLOAD_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ACCUM_SLOAD_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: ACCUM_SLOAD_REG STRING "1"
// Retrieval info: PRIVATE: ADDNSUB1_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ADDNSUB1_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ADDNSUB1_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ADDNSUB1_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ADDNSUB1_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: ADDNSUB1_REG STRING "1"
// Retrieval info: PRIVATE: ADDNSUB3_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ADDNSUB3_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ADDNSUB3_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ADDNSUB3_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ADDNSUB3_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: ADDNSUB3_REG STRING "1"
// Retrieval info: PRIVATE: ADD_ENABLE NUMERIC "0"
// Retrieval info: PRIVATE: ALL_REG_ACLR NUMERIC "0"
// Retrieval info: PRIVATE: A_ACLR_SRC_MULT0 NUMERIC "3"
// Retrieval info: PRIVATE: A_CLK_SRC_MULT0 NUMERIC "0"
// Retrieval info: PRIVATE: B_ACLR_SRC_MULT0 NUMERIC "3"
// Retrieval info: PRIVATE: B_CLK_SRC_MULT0 NUMERIC "0"
// Retrieval info: PRIVATE: CHAINOUT_OUTPUT_ACLR NUMERIC "3"
// Retrieval info: PRIVATE: CHAINOUT_OUTPUT_REG STRING "0"
// Retrieval info: PRIVATE: CHAINOUT_OUTPUT_REGISTER NUMERIC "0"
// Retrieval info: PRIVATE: CHAINOUT_OUTPUT_REGISTERED NUMERIC "0"
// Retrieval info: PRIVATE: CHAS_ZERO_CHAINOUT NUMERIC "0"
// Retrieval info: PRIVATE: HAS_ACCUMULATOR NUMERIC "0"
// Retrieval info: PRIVATE: HAS_ACUMM_SLOAD NUMERIC "0"
// Retrieval info: PRIVATE: HAS_CHAININ_PORT NUMERIC "0"
// Retrieval info: PRIVATE: HAS_CHAINOUT_ADDER NUMERIC "0"
// Retrieval info: PRIVATE: HAS_LOOPBACK NUMERIC "0"
// Retrieval info: PRIVATE: HAS_MAC STRING "0"
// Retrieval info: PRIVATE: HAS_SAT_ROUND STRING "0"
// Retrieval info: PRIVATE: HAS_ZERO_LOOPBACK NUMERIC "0"
// Retrieval info: PRIVATE: IMPL_STYLE_DEDICATED NUMERIC "1"
// Retrieval info: PRIVATE: IMPL_STYLE_DEFAULT NUMERIC "0"
// Retrieval info: PRIVATE: IMPL_STYLE_LCELL NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: PRIVATE: MULT_REGA0 NUMERIC "1"
// Retrieval info: PRIVATE: MULT_REGB0 NUMERIC "1"
// Retrieval info: PRIVATE: MULT_REGOUT0 NUMERIC "1"
// Retrieval info: PRIVATE: NUM_MULT STRING "1"
// Retrieval info: PRIVATE: OP1 STRING "Add"
// Retrieval info: PRIVATE: OP3 STRING "Add"
// Retrieval info: PRIVATE: OUTPUT_EXTRA_LAT NUMERIC "0"
// Retrieval info: PRIVATE: OUTPUT_REG_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: OUTPUT_REG_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: Q_ACLR_SRC_MULT0 NUMERIC "3"
// Retrieval info: PRIVATE: Q_CLK_SRC_MULT0 NUMERIC "0"
// Retrieval info: PRIVATE: REG_OUT NUMERIC "1"
// Retrieval info: PRIVATE: RNFORMAT STRING "32"
// Retrieval info: PRIVATE: ROTATE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ROTATE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ROTATE_OUT_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ROTATE_OUT_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ROTATE_OUT_REG STRING "1"
// Retrieval info: PRIVATE: ROTATE_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ROTATE_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ROTATE_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: ROTATE_REG STRING "1"
// Retrieval info: PRIVATE: RQFORMAT STRING "Q1.15"
// Retrieval info: PRIVATE: RTS_WIDTH STRING "32"
// Retrieval info: PRIVATE: SAME_CONFIG NUMERIC "1"
// Retrieval info: PRIVATE: SAME_CONTROL_SRC_A0 NUMERIC "1"
// Retrieval info: PRIVATE: SAME_CONTROL_SRC_B0 NUMERIC "1"
// Retrieval info: PRIVATE: SCANOUTA NUMERIC "0"
// Retrieval info: PRIVATE: SCANOUTB NUMERIC "0"
// Retrieval info: PRIVATE: SHIFTOUTA_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SHIFTOUTA_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SHIFTOUTA_REG STRING "0"
// Retrieval info: PRIVATE: SHIFT_RIGHT_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SHIFT_RIGHT_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SHIFT_RIGHT_OUT_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SHIFT_RIGHT_OUT_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SHIFT_RIGHT_OUT_REG STRING "1"
// Retrieval info: PRIVATE: SHIFT_RIGHT_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SHIFT_RIGHT_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SHIFT_RIGHT_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: SHIFT_RIGHT_REG STRING "1"
// Retrieval info: PRIVATE: SHIFT_ROTATE_MODE STRING "Variable"
// Retrieval info: PRIVATE: SIGNA STRING "UNSIGNED"
// Retrieval info: PRIVATE: SIGNA_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SIGNA_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SIGNA_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SIGNA_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SIGNA_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: SIGNA_REG STRING "1"
// Retrieval info: PRIVATE: SIGNB STRING "UNSIGNED"
// Retrieval info: PRIVATE: SIGNB_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SIGNB_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SIGNB_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: SIGNB_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: SIGNB_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: SIGNB_REG STRING "1"
// Retrieval info: PRIVATE: SRCA0 STRING "Multiplier input"
// Retrieval info: PRIVATE: SRCB0 STRING "Multiplier input"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: WIDTHA STRING "32"
// Retrieval info: PRIVATE: WIDTHB STRING "32"
// Retrieval info: PRIVATE: ZERO_CHAINOUT_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ZERO_CHAINOUT_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ZERO_CHAINOUT_REG STRING "0"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_OUT_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_OUT_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_OUT_REG STRING "1"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_PIPE_ACLR_SRC NUMERIC "3"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_PIPE_CLK_SRC NUMERIC "0"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_PIPE_REG STRING "1"
// Retrieval info: PRIVATE: ZERO_LOOPBACK_REG STRING "1"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: ACCUMULATOR STRING "NO"
// Retrieval info: CONSTANT: ADDNSUB_MULTIPLIER_ACLR1 STRING "UNUSED"
// Retrieval info: CONSTANT: ADDNSUB_MULTIPLIER_PIPELINE_ACLR1 STRING "UNUSED"
// Retrieval info: CONSTANT: ADDNSUB_MULTIPLIER_PIPELINE_REGISTER1 STRING "CLOCK0"
// Retrieval info: CONSTANT: ADDNSUB_MULTIPLIER_REGISTER1 STRING "CLOCK0"
// Retrieval info: CONSTANT: CHAINOUT_ADDER STRING "NO"
// Retrieval info: CONSTANT: CHAINOUT_REGISTER STRING "UNREGISTERED"
// Retrieval info: CONSTANT: DEDICATED_MULTIPLIER_CIRCUITRY STRING "YES"
// Retrieval info: CONSTANT: INPUT_ACLR_A0 STRING "UNUSED"
// Retrieval info: CONSTANT: INPUT_ACLR_B0 STRING "UNUSED"
// Retrieval info: CONSTANT: INPUT_REGISTER_A0 STRING "CLOCK0"
// Retrieval info: CONSTANT: INPUT_REGISTER_B0 STRING "CLOCK0"
// Retrieval info: CONSTANT: INPUT_SOURCE_A0 STRING "DATAA"
// Retrieval info: CONSTANT: INPUT_SOURCE_B0 STRING "DATAB"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix IV"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altmult_add"
// Retrieval info: CONSTANT: MULTIPLIER1_DIRECTION STRING "ADD"
// Retrieval info: CONSTANT: MULTIPLIER_ACLR0 STRING "UNUSED"
// Retrieval info: CONSTANT: MULTIPLIER_REGISTER0 STRING "CLOCK0"
// Retrieval info: CONSTANT: NUMBER_OF_MULTIPLIERS NUMERIC "1"
// Retrieval info: CONSTANT: OUTPUT_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: OUTPUT_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: PORT_ADDNSUB1 STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: PORT_SIGNA STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: PORT_SIGNB STRING "PORT_UNUSED"
// Retrieval info: CONSTANT: REPRESENTATION_A STRING "UNSIGNED"
// Retrieval info: CONSTANT: REPRESENTATION_B STRING "UNSIGNED"
// Retrieval info: CONSTANT: ROTATE_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ROTATE_OUTPUT_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ROTATE_OUTPUT_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: ROTATE_PIPELINE_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ROTATE_PIPELINE_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: ROTATE_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: SHIFT_MODE STRING "VARIABLE"
// Retrieval info: CONSTANT: SHIFT_RIGHT_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: SHIFT_RIGHT_OUTPUT_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: SHIFT_RIGHT_OUTPUT_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: SHIFT_RIGHT_PIPELINE_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: SHIFT_RIGHT_PIPELINE_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: SHIFT_RIGHT_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: SIGNED_ACLR_A STRING "UNUSED"
// Retrieval info: CONSTANT: SIGNED_ACLR_B STRING "UNUSED"
// Retrieval info: CONSTANT: SIGNED_PIPELINE_ACLR_A STRING "UNUSED"
// Retrieval info: CONSTANT: SIGNED_PIPELINE_ACLR_B STRING "UNUSED"
// Retrieval info: CONSTANT: SIGNED_PIPELINE_REGISTER_A STRING "CLOCK0"
// Retrieval info: CONSTANT: SIGNED_PIPELINE_REGISTER_B STRING "CLOCK0"
// Retrieval info: CONSTANT: SIGNED_REGISTER_A STRING "CLOCK0"
// Retrieval info: CONSTANT: SIGNED_REGISTER_B STRING "CLOCK0"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "32"
// Retrieval info: CONSTANT: WIDTH_B NUMERIC "32"
// Retrieval info: CONSTANT: WIDTH_CHAININ NUMERIC "1"
// Retrieval info: CONSTANT: WIDTH_RESULT NUMERIC "32"
// Retrieval info: CONSTANT: ZERO_CHAINOUT_OUTPUT_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ZERO_CHAINOUT_OUTPUT_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: ZERO_LOOPBACK_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ZERO_LOOPBACK_OUTPUT_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ZERO_LOOPBACK_OUTPUT_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: ZERO_LOOPBACK_PIPELINE_ACLR STRING "UNUSED"
// Retrieval info: CONSTANT: ZERO_LOOPBACK_PIPELINE_REGISTER STRING "CLOCK0"
// Retrieval info: CONSTANT: ZERO_LOOPBACK_REGISTER STRING "CLOCK0"
// Retrieval info: USED_PORT: clock0 0 0 0 0 INPUT VCC "clock0"
// Retrieval info: USED_PORT: dataa_0 0 0 32 0 INPUT GND "dataa_0[31..0]"
// Retrieval info: USED_PORT: datab_0 0 0 32 0 INPUT GND "datab_0[31..0]"
// Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT GND "result[31..0]"
// Retrieval info: USED_PORT: rotate 0 0 0 0 INPUT GND "rotate"
// Retrieval info: USED_PORT: shift_right 0 0 0 0 INPUT GND "shift_right"
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock0 0 0 0 0
// Retrieval info: CONNECT: @dataa 0 0 32 0 dataa_0 0 0 32 0
// Retrieval info: CONNECT: @datab 0 0 32 0 datab_0 0 0 32 0
// Retrieval info: CONNECT: @rotate 0 0 0 0 rotate 0 0 0 0
// Retrieval info: CONNECT: @shift_right 0 0 0 0 shift_right 0 0 0 0
// Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
// Retrieval info: GEN_FILE: TYPE_NORMAL dsp_shift_megafn.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL dsp_shift_megafn.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL dsp_shift_megafn.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL dsp_shift_megafn.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL dsp_shift_megafn_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL dsp_shift_megafn_bb.v TRUE
// Retrieval info: LIB_FILE: altera_mf
