// megafunction wizard: %LPM_DIVIDE%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_divide 

// ============================================================
// File Name: unsigned_divider.v
// Megafunction Name(s):
// 			lpm_divide
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************


//Copyright (C) 1991-2002 Altera Corporation
//Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
//support information,  device programming or simulation file,  and any other
//associated  documentation or information  provided by  Altera  or a partner
//under  Altera's   Megafunction   Partnership   Program  may  be  used  only
//to program  PLD  devices (but not masked  PLD  devices) from  Altera.   Any
//other  use  of such  megafunction  design,  netlist,  support  information,
//device programming or simulation file,  or any other  related documentation
//or information  is prohibited  for  any  other purpose,  including, but not
//limited to  modification,  reverse engineering,  de-compiling, or use  with
//any other  silicon devices,  unless such use is  explicitly  licensed under
//a separate agreement with  Altera  or a megafunction partner.  Title to the
//intellectual property,  including patents,  copyrights,  trademarks,  trade
//secrets,  or maskworks,  embodied in any such megafunction design, netlist,
//support  information,  device programming or simulation file,  or any other
//related documentation or information provided by  Altera  or a megafunction
//partner, remains with Altera, the megafunction partner, or their respective
//licensors. No other licenses, including any licenses needed under any third
//party's intellectual property, are provided herein.


module unsigned_divider (
	numer,
	denom,
	clock,
	quotient,
	remain);

	input	[14:0]  numer;
	input	[9:0]  denom;
	input	  clock;
	output	[14:0]  quotient;
	output	[9:0]  remain;

	wire [14:0] sub_wire0;
	wire [9:0] sub_wire1;
	wire [14:0] quotient = sub_wire0[14:0];
	wire [9:0] remain = sub_wire1[9:0];

	lpm_divide	lpm_divide_component (
				.denom (denom),
				.clock (clock),
				.numer (numer),
				.quotient (sub_wire0),
				.remain (sub_wire1));
	defparam
		lpm_divide_component.lpm_widthn = 15,
		lpm_divide_component.lpm_widthd = 10,
		lpm_divide_component.lpm_pipeline = 3,
		lpm_divide_component.lpm_type = "LPM_DIVIDE",
		lpm_divide_component.lpm_nrepresentation = "UNSIGNED",
		lpm_divide_component.lpm_hint = "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE",
		lpm_divide_component.lpm_drepresentation = "UNSIGNED";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
// Retrieval info: PRIVATE: PRIVATE_MAXIMIZE_SPEED NUMERIC "6"
// Retrieval info: PRIVATE: PRIVATE_LPM_REMAINDERPOSITIVE STRING "TRUE"
// Retrieval info: PRIVATE: USING_PIPELINE NUMERIC "1"
// Retrieval info: CONSTANT: LPM_WIDTHN NUMERIC "15"
// Retrieval info: CONSTANT: LPM_WIDTHD NUMERIC "10"
// Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "3"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_DIVIDE"
// Retrieval info: CONSTANT: LPM_NREPRESENTATION STRING "UNSIGNED"
// Retrieval info: CONSTANT: LPM_HINT STRING "MAXIMIZE_SPEED=6,LPM_REMAINDERPOSITIVE=TRUE"
// Retrieval info: CONSTANT: LPM_DREPRESENTATION STRING "UNSIGNED"
// Retrieval info: USED_PORT: numer 0 0 15 0 INPUT NODEFVAL numer[14..0]
// Retrieval info: USED_PORT: denom 0 0 10 0 INPUT NODEFVAL denom[9..0]
// Retrieval info: USED_PORT: quotient 0 0 15 0 OUTPUT NODEFVAL quotient[14..0]
// Retrieval info: USED_PORT: remain 0 0 10 0 OUTPUT NODEFVAL remain[9..0]
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: CONNECT: @numer 0 0 15 0 numer 0 0 15 0
// Retrieval info: CONNECT: @denom 0 0 10 0 denom 0 0 10 0
// Retrieval info: CONNECT: quotient 0 0 15 0 @quotient 0 0 15 0
// Retrieval info: CONNECT: remain 0 0 10 0 @remain 0 0 10 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
