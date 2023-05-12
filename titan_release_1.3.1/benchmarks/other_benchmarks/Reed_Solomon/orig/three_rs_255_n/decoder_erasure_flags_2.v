// megafunction wizard: %LPM_RAM_DP%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altsyncram 

// ============================================================
// File Name: decoder_erasure_flags_2.v
// Megafunction Name(s):
// 			altsyncram
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


module decoder_erasure_flags_2 (
	data,
	wren,
	wraddress,
	rdaddress,
	rden,
	clock,
	q);

	input	[0:0]  data;
	input	  wren;
	input	[7:0]  wraddress;
	input	[7:0]  rdaddress;
	input	  rden;
	input	  clock;
	output	[0:0]  q;

	wire [0:0] sub_wire0;
	wire [0:0] q = sub_wire0[0:0];

	altsyncram	altsyncram_component (
				.wren_a (wren),
				.clock0 (clock),
				.address_a (wraddress),
				.address_b (rdaddress),
				.rden_b (rden),
				.data_a (data),
				.q_b (sub_wire0));
	defparam
		altsyncram_component.intended_device_family = "Stratix",
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.width_a = 1,
		altsyncram_component.widthad_a = 8,
		altsyncram_component.numwords_a = 256,
		altsyncram_component.width_b = 1,
		altsyncram_component.widthad_b = 8,
		altsyncram_component.numwords_b = 256,
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.outdata_reg_b = "UNREGISTERED",
		altsyncram_component.indata_aclr_a = "NONE",
		altsyncram_component.wrcontrol_aclr_a = "NONE",
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.rdcontrol_reg_b = "CLOCK0",
		altsyncram_component.rdcontrol_aclr_b = "NONE",
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.ram_block_type = "AUTO";


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: MEM_IN_BITS NUMERIC "1"
// Retrieval info: PRIVATE: OPERATION_MODE NUMERIC "2"
// Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: PRIVATE: VarWidth NUMERIC "0"
// Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "1"
// Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "1"
// Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "1"
// Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "1"
// Retrieval info: PRIVATE: MEMSIZE NUMERIC "256"
// Retrieval info: PRIVATE: Clock NUMERIC "0"
// Retrieval info: PRIVATE: rden NUMERIC "1"
// Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
// Retrieval info: PRIVATE: Clock_A NUMERIC "0"
// Retrieval info: PRIVATE: Clock_B NUMERIC "0"
// Retrieval info: PRIVATE: REGdata NUMERIC "1"
// Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
// Retrieval info: PRIVATE: REGwren NUMERIC "1"
// Retrieval info: PRIVATE: REGrdaddress NUMERIC "1"
// Retrieval info: PRIVATE: REGrren NUMERIC "1"
// Retrieval info: PRIVATE: REGq NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: OUTDATA_REG_B NUMERIC "0"
// Retrieval info: PRIVATE: CLRdata NUMERIC "0"
// Retrieval info: PRIVATE: CLRwren NUMERIC "0"
// Retrieval info: PRIVATE: CLRwraddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
// Retrieval info: PRIVATE: CLRrren NUMERIC "0"
// Retrieval info: PRIVATE: CLRq NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_A NUMERIC "0"
// Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: OUTDATA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: BYTEENA_ACLR_B NUMERIC "0"
// Retrieval info: PRIVATE: enable NUMERIC "0"
// Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "2"
// Retrieval info: PRIVATE: BlankMemory NUMERIC "1"
// Retrieval info: PRIVATE: MIFfilename STRING ""
// Retrieval info: PRIVATE: UseLCs NUMERIC "0"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: CONSTANT: OPERATION_MODE STRING "DUAL_PORT"
// Retrieval info: CONSTANT: WIDTH_A NUMERIC "1"
// Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "8"
// Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "256"
// Retrieval info: CONSTANT: WIDTH_B NUMERIC "1"
// Retrieval info: CONSTANT: WIDTHAD_B NUMERIC "8"
// Retrieval info: CONSTANT: NUMWORDS_B NUMERIC "256"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
// Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
// Retrieval info: CONSTANT: OUTDATA_REG_B STRING "UNREGISTERED"
// Retrieval info: CONSTANT: INDATA_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: WRCONTROL_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: ADDRESS_ACLR_A STRING "NONE"
// Retrieval info: CONSTANT: ADDRESS_REG_B STRING "CLOCK0"
// Retrieval info: CONSTANT: RDCONTROL_REG_B STRING "CLOCK0"
// Retrieval info: CONSTANT: RDCONTROL_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: ADDRESS_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "NONE"
// Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_MIXED_PORTS STRING "DONT_CARE"
// Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "AUTO"
// Retrieval info: USED_PORT: data 0 0 1 0 INPUT NODEFVAL data[0..0]
// Retrieval info: USED_PORT: wren 0 0 0 0 INPUT VCC wren
// Retrieval info: USED_PORT: q 0 0 1 0 OUTPUT NODEFVAL q[0..0]
// Retrieval info: USED_PORT: wraddress 0 0 8 0 INPUT NODEFVAL wraddress[7..0]
// Retrieval info: USED_PORT: rdaddress 0 0 8 0 INPUT NODEFVAL rdaddress[7..0]
// Retrieval info: USED_PORT: rden 0 0 0 0 INPUT VCC rden
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: CONNECT: @data_a 0 0 1 0 data 0 0 1 0
// Retrieval info: CONNECT: @wren_a 0 0 0 0 wren 0 0 0 0
// Retrieval info: CONNECT: q 0 0 1 0 @q_b 0 0 1 0
// Retrieval info: CONNECT: @address_a 0 0 8 0 wraddress 0 0 8 0
// Retrieval info: CONNECT: @address_b 0 0 8 0 rdaddress 0 0 8 0
// Retrieval info: CONNECT: @rden_b 0 0 0 0 rden 0 0 0 0
// Retrieval info: CONNECT: @clock0 0 0 0 0 clock 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
