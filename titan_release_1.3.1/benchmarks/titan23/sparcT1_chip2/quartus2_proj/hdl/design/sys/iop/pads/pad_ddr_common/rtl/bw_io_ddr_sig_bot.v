// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_io_ddr_sig_bot.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
module bw_io_ddr_sig_bot(dram_io_drive_enable_o_l ,se_o_l ,cbd_o_l ,
     cbu_o_l ,cbu_o_r ,cbd_o_r ,cbd_i_l ,cbu_i_r ,cbd_i_r ,vrefcode_i_l
      ,vrefcode_i_r ,serial_in ,afo ,serial_out ,ps_select_i_r ,afi ,
     spare_ddr_data ,spare_ddr_pin ,test_mode_i_l ,testmode_l_i_r ,
     test_mode_i_r ,bypass_enable_i_l ,bypass_enable_i_r ,ps_select_i_l
      ,update_dr_o_l ,shift_dr_o_l ,clock_dr_o_l ,hiz_n_o_l ,
     bypass_enable_o_l ,ps_select_o_r ,mode_ctrl_o_r ,update_dr_o_r ,
     se_i_r ,mode_ctrl_i_r ,clock_dr_i_r ,mode_ctrl_o_l ,hiz_n_i_r ,
     update_dr_i_r ,cbu_i_l ,shift_dr_o_r ,dram_io_drive_enable_i_r ,
     clock_dr_o_r ,hiz_n_o_r ,ps_select_o_l ,rclk ,testmode_l_i_l ,
     dram_io_ptr_clk_inv_i_l ,burst_length_four_i_l ,
     dram_io_pad_enable_i_l ,dram_io_drive_enable_i_l ,rst_l_i_l , arst_l_i_l, arst_l_out,
     lpf_code_i_l ,strobe_i_l ,pad_pos_cnt_i_l ,
     dram_io_channel_disabled_i_l ,pad_neg_cnt_i_l ,
     dram_io_drive_data_i_l ,dram_io_channel_disabled_i_r ,
     dram_io_write_en_l ,dram_io_data_out__63__ ,dram_io_data_out__62__ ,
     dram_io_data_out__61__ ,dram_io_data_out__60__ ,dram_io_data_out__59__
      ,dram_io_data_out__58__ ,dram_io_data_out__57__ ,
     dram_io_data_out__56__ ,dram_io_data_out__55__ ,dram_io_data_out__54__
      ,dram_io_data_out__53__ ,dram_io_data_out__52__ ,
     dram_io_data_out__51__ ,dram_io_data_out__50__ ,dram_io_data_out__49__
      ,dram_io_data_out__48__ ,dram_io_data_out__47__ ,
     dram_io_data_out__46__ ,dram_io_data_out__45__ ,dram_io_data_out__44__
      ,dram_io_data_out__43__ ,dram_io_data_out__42__ ,
     dram_io_data_out__41__ ,dram_io_data_out__40__ ,dram_io_data_out__39__
      ,dram_io_data_out__38__ ,dram_io_data_out__37__ ,
     dram_io_data_out__36__ ,dram_io_data_out__35__ ,dram_io_data_out__34__
      ,dram_io_data_out__33__ ,dram_io_data_out__32__ ,
     io_dram_data_in__255__ ,io_dram_data_in__254__ ,io_dram_data_in__253__
      ,io_dram_data_in__252__ ,io_dram_data_in__251__ ,
     io_dram_data_in__250__ ,io_dram_data_in__249__ ,io_dram_data_in__248__
      ,io_dram_data_in__247__ ,io_dram_data_in__246__ ,
     io_dram_data_in__245__ ,io_dram_data_in__244__ ,io_dram_data_in__243__
      ,io_dram_data_in__242__ ,io_dram_data_in__241__ ,
     io_dram_data_in__240__ ,io_dram_data_in__239__ ,io_dram_data_in__238__
      ,io_dram_data_in__237__ ,io_dram_data_in__236__ ,
     io_dram_data_in__235__ ,io_dram_data_in__234__ ,io_dram_data_in__233__
      ,io_dram_data_in__232__ ,io_dram_data_in__231__ ,
     io_dram_data_in__230__ ,io_dram_data_in__229__ ,io_dram_data_in__228__
      ,io_dram_data_in__227__ ,io_dram_data_in__226__ ,
     io_dram_data_in__225__ ,io_dram_data_in__224__ ,dram_io_cas_l ,
     dram_cs_l ,dram_we_l ,dram_cas_l ,dram_dq__127__ ,dram_dq__126__ ,
     dram_dq__125__ ,dram_dq__124__ ,dram_dq__123__ ,dram_dq__122__ ,
     dram_dq__121__ ,dram_dq__120__ ,dram_dq__119__ ,dram_dq__118__ ,
     dram_dq__117__ ,dram_dq__116__ ,dram_dq__115__ ,dram_dq__114__ ,
     dram_dq__113__ ,dram_dq__112__ ,dram_dq__111__ ,dram_dq__110__ ,
     dram_dq__109__ ,dram_dq__108__ ,dram_dq__107__ ,dram_dq__106__ ,
     dram_dq__105__ ,dram_dq__104__ ,dram_dq__103__ ,dram_dq__102__ ,
     dram_dq__101__ ,dram_dq__100__ ,dram_dq__99__ ,dram_dq__98__ ,
     dram_dq__97__ ,dram_dq__96__ ,dram_io_data_out__287__ ,
     dram_io_data_out__286__ ,dram_io_data_out__285__ ,
     dram_io_data_out__284__ ,dram_io_data_out__283__ ,
     dram_io_data_out__282__ ,dram_io_data_out__281__ ,
     dram_io_data_out__280__ ,dram_io_data_out__143__ ,
     dram_io_data_out__142__ ,dram_io_data_out__141__ ,
     dram_io_data_out__140__ ,dram_io_data_out__139__ ,
     dram_io_data_out__138__ ,dram_io_data_out__137__ ,
     dram_io_data_out__136__ ,io_dram_ecc_in__31__ ,io_dram_ecc_in__30__ ,
     io_dram_ecc_in__29__ ,io_dram_ecc_in__28__ ,io_dram_ecc_in__27__ ,
     io_dram_ecc_in__26__ ,io_dram_ecc_in__25__ ,io_dram_ecc_in__24__ ,
     io_dram_ecc_in__15__ ,io_dram_ecc_in__14__ ,io_dram_ecc_in__13__ ,
     io_dram_ecc_in__12__ ,io_dram_ecc_in__11__ ,io_dram_ecc_in__10__ ,
     io_dram_ecc_in__9__ ,io_dram_ecc_in__8__ ,dram_cb ,
     dram_io_data_out__127__ ,dram_io_data_out__126__ ,
     dram_io_data_out__125__ ,dram_io_data_out__124__ ,
     dram_io_data_out__123__ ,dram_io_data_out__122__ ,
     dram_io_data_out__121__ ,dram_io_data_out__120__ ,
     dram_io_data_out__119__ ,dram_io_data_out__118__ ,
     dram_io_data_out__117__ ,dram_io_data_out__116__ ,
     dram_io_data_out__115__ ,dram_io_data_out__114__ ,
     dram_io_data_out__113__ ,dram_io_data_out__112__ ,
     dram_io_data_out__111__ ,dram_io_data_out__110__ ,
     dram_io_data_out__109__ ,dram_io_data_out__108__ ,
     dram_io_data_out__107__ ,dram_io_data_out__106__ ,
     dram_io_data_out__105__ ,dram_io_data_out__104__ ,
     dram_io_data_out__103__ ,dram_io_data_out__102__ ,
     dram_io_data_out__101__ ,dram_io_data_out__100__ ,
     dram_io_data_out__99__ ,dram_io_data_out__98__ ,dram_io_data_out__97__
      ,dram_io_data_out__96__ ,pad_neg_cnt_i_r ,io_dram_data_in__191__ ,
     io_dram_data_in__190__ ,io_dram_data_in__189__ ,io_dram_data_in__188__
      ,io_dram_data_in__187__ ,io_dram_data_in__186__ ,
     io_dram_data_in__185__ ,io_dram_data_in__184__ ,io_dram_data_in__183__
      ,io_dram_data_in__182__ ,io_dram_data_in__181__ ,
     io_dram_data_in__180__ ,io_dram_data_in__179__ ,io_dram_data_in__178__
      ,io_dram_data_in__177__ ,io_dram_data_in__176__ ,
     io_dram_data_in__175__ ,io_dram_data_in__174__ ,io_dram_data_in__173__
      ,io_dram_data_in__172__ ,io_dram_data_in__171__ ,
     io_dram_data_in__170__ ,io_dram_data_in__169__ ,io_dram_data_in__168__
      ,io_dram_data_in__167__ ,io_dram_data_in__166__ ,
     io_dram_data_in__165__ ,io_dram_data_in__164__ ,io_dram_data_in__163__
      ,io_dram_data_in__162__ ,io_dram_data_in__161__ ,
     io_dram_data_in__160__ ,rst_l_i_r , arst_l_i_r, io_dram_data_in__127__ ,
     io_dram_data_in__126__ ,io_dram_data_in__125__ ,io_dram_data_in__124__
      ,io_dram_data_in__123__ ,io_dram_data_in__122__ ,
     io_dram_data_in__121__ ,io_dram_data_in__120__ ,io_dram_data_in__119__
      ,io_dram_data_in__118__ ,io_dram_data_in__117__ ,
     io_dram_data_in__116__ ,io_dram_data_in__115__ ,io_dram_data_in__114__
      ,io_dram_data_in__113__ ,io_dram_data_in__112__ ,
     io_dram_data_in__111__ ,io_dram_data_in__110__ ,io_dram_data_in__109__
      ,io_dram_data_in__108__ ,io_dram_data_in__107__ ,
     io_dram_data_in__106__ ,io_dram_data_in__105__ ,io_dram_data_in__104__
      ,io_dram_data_in__103__ ,io_dram_data_in__102__ ,
     io_dram_data_in__101__ ,io_dram_data_in__100__ ,io_dram_data_in__99__
      ,io_dram_data_in__98__ ,io_dram_data_in__97__ ,io_dram_data_in__96__
      ,pad_clk_si ,dram_ras_l ,dram_io_pad_enable_i_r ,
     dram_io_data_out__271__ ,dram_io_data_out__270__ ,
     dram_io_data_out__269__ ,dram_io_data_out__268__ ,
     dram_io_data_out__267__ ,dram_io_data_out__266__ ,
     dram_io_data_out__265__ ,dram_io_data_out__264__ ,
     dram_io_data_out__263__ ,dram_io_data_out__262__ ,
     dram_io_data_out__261__ ,dram_io_data_out__260__ ,
     dram_io_data_out__259__ ,dram_io_data_out__258__ ,
     dram_io_data_out__257__ ,dram_io_data_out__256__ ,
     dram_io_data_out__255__ ,dram_io_data_out__254__ ,
     dram_io_data_out__253__ ,dram_io_data_out__252__ ,
     dram_io_data_out__251__ ,dram_io_data_out__250__ ,
     dram_io_data_out__249__ ,dram_io_data_out__248__ ,
     dram_io_data_out__247__ ,dram_io_data_out__246__ ,
     dram_io_data_out__245__ ,dram_io_data_out__244__ ,
     dram_io_data_out__243__ ,dram_io_data_out__242__ ,
     dram_io_data_out__241__ ,dram_io_data_out__240__ ,mode_ctrl_i_l ,
     dram_dqs__7__ ,dram_dqs__6__ ,dram_dqs__5__ ,dram_dqs__4__ ,bsi ,bso ,
     dram_io_bank ,dram_addr ,burst_length_four_i_r ,lpf_code_i_r ,
     strobe_i_r ,update_dr_i_l ,hiz_n_i_l ,clock_dr_i_l ,shift_dr_i_l ,
     se_i_l ,pad_clk_so ,dram_io_ptr_clk_inv_i_r ,dram_io_ras_l ,
     dram_io_cs_l ,dram_ba ,dram_dq__63__ ,dram_dq__62__ ,dram_dq__61__ ,
     dram_dq__60__ ,dram_dq__59__ ,dram_dq__58__ ,dram_dq__57__ ,
     dram_dq__56__ ,dram_dq__55__ ,dram_dq__54__ ,dram_dq__53__ ,
     dram_dq__52__ ,dram_dq__51__ ,dram_dq__50__ ,dram_dq__49__ ,
     dram_dq__48__ ,dram_dq__47__ ,dram_dq__46__ ,dram_dq__45__ ,
     dram_dq__44__ ,dram_dq__43__ ,dram_dq__42__ ,dram_dq__41__ ,
     dram_dq__40__ ,dram_dq__39__ ,dram_dq__38__ ,dram_dq__37__ ,
     dram_dq__36__ ,dram_dq__35__ ,dram_dq__34__ ,dram_dq__33__ ,
     dram_dq__32__ ,dram_dqs__35__ ,dram_dqs__34__ ,dram_dqs__33__ ,
     dram_dqs__32__ ,dram_dqs__31__ ,dram_io_addr ,dram_dqs__16__ ,
     dram_dqs__15__ ,dram_dqs__14__ ,dram_dqs__13__ ,dram_dqs__26__ ,
     dram_dqs__25__ ,dram_dqs__24__ ,dram_dqs__23__ ,dram_dqs__22__ ,
     pad_pos_cnt_i_r ,dram_io_drive_data_i_r ,shift_dr_i_r ,
     bypass_enable_o_r ,vdd_h ,io_dram_data_in__63__ ,
     io_dram_data_in__62__ ,io_dram_data_in__61__ ,io_dram_data_in__60__ ,
     io_dram_data_in__59__ ,io_dram_data_in__58__ ,io_dram_data_in__57__ ,
     io_dram_data_in__56__ ,io_dram_data_in__55__ ,io_dram_data_in__54__ ,
     io_dram_data_in__53__ ,io_dram_data_in__52__ ,io_dram_data_in__51__ ,
     io_dram_data_in__50__ ,io_dram_data_in__49__ ,io_dram_data_in__48__ ,
     io_dram_data_in__47__ ,io_dram_data_in__46__ ,io_dram_data_in__45__ ,
     io_dram_data_in__44__ ,io_dram_data_in__43__ ,io_dram_data_in__42__ ,
     io_dram_data_in__41__ ,io_dram_data_in__40__ ,io_dram_data_in__39__ ,
     io_dram_data_in__38__ ,io_dram_data_in__37__ ,io_dram_data_in__36__ ,
     io_dram_data_in__35__ ,io_dram_data_in__34__ ,io_dram_data_in__33__ ,
     io_dram_data_in__32__ ,dram_io_data_out__207__ ,
     dram_io_data_out__206__ ,dram_io_data_out__205__ ,
     dram_io_data_out__204__ ,dram_io_data_out__203__ ,
     dram_io_data_out__202__ ,dram_io_data_out__201__ ,
     dram_io_data_out__200__ ,dram_io_data_out__199__ ,
     dram_io_data_out__198__ ,dram_io_data_out__197__ ,
     dram_io_data_out__196__ ,dram_io_data_out__195__ ,
     dram_io_data_out__194__ ,dram_io_data_out__193__ ,
     dram_io_data_out__192__ ,dram_io_data_out__191__ ,
     dram_io_data_out__190__ ,dram_io_data_out__189__ ,
     dram_io_data_out__188__ ,dram_io_data_out__187__ ,
     dram_io_data_out__186__ ,dram_io_data_out__185__ ,
     dram_io_data_out__184__ ,dram_io_data_out__183__ ,
     dram_io_data_out__182__ ,dram_io_data_out__181__ ,
     dram_io_data_out__180__ ,dram_io_data_out__179__ ,
     dram_io_data_out__178__ ,dram_io_data_out__177__ ,
     dram_io_data_out__176__ );
output		arst_l_out ;
output [8:1]	cbd_o_l ;
output [8:1]	cbu_o_l ;
output [8:1]	cbu_o_r ;
output [8:1]	cbd_o_r ;
output [143:72]	serial_out ;
output [143:72]	afi ;
input [8:1]	cbd_i_l ;
input [8:1]	cbu_i_r ;
input [8:1]	cbd_i_r ;
input [7:0]	vrefcode_i_l ;
input [7:0]	vrefcode_i_r ;
input [143:72]	serial_in ;
input [143:72]	afo ;
input [7:0]	spare_ddr_data ;
input [8:1]	cbu_i_l ;
input [1:0]	dram_io_ptr_clk_inv_i_l ;
input [4:0]	lpf_code_i_l ;
input [1:0]	pad_pos_cnt_i_l ;
input [1:0]	pad_neg_cnt_i_l ;
input [1:0]	pad_neg_cnt_i_r ;
input [1:0]	dram_io_bank ;
input [4:0]	lpf_code_i_r ;
input [1:0]	dram_io_ptr_clk_inv_i_r ;
input [3:0]	dram_io_cs_l ;
input [10:10]	dram_io_addr ;
input [1:0]	pad_pos_cnt_i_r ;
inout [7:0]	spare_ddr_pin ;
inout [3:0]	dram_cs_l ;
inout [15:8]	dram_cb ;
inout [10:10]	dram_addr ;
inout [1:0]	dram_ba ;
output		dram_io_drive_enable_o_l ;
output		se_o_l ;
output		update_dr_o_l ;
output		shift_dr_o_l ;
output		clock_dr_o_l ;
output		hiz_n_o_l ;
output		bypass_enable_o_l ;
output		ps_select_o_r ;
output		mode_ctrl_o_r ;
output		update_dr_o_r ;
output		mode_ctrl_o_l ;
output		shift_dr_o_r ;
output		clock_dr_o_r ;
output		hiz_n_o_r ;
output		ps_select_o_l ;
output		io_dram_data_in__255__ ;
output		io_dram_data_in__254__ ;
output		io_dram_data_in__253__ ;
output		io_dram_data_in__252__ ;
output		io_dram_data_in__251__ ;
output		io_dram_data_in__250__ ;
output		io_dram_data_in__249__ ;
output		io_dram_data_in__248__ ;
output		io_dram_data_in__247__ ;
output		io_dram_data_in__246__ ;
output		io_dram_data_in__245__ ;
output		io_dram_data_in__244__ ;
output		io_dram_data_in__243__ ;
output		io_dram_data_in__242__ ;
output		io_dram_data_in__241__ ;
output		io_dram_data_in__240__ ;
output		io_dram_data_in__239__ ;
output		io_dram_data_in__238__ ;
output		io_dram_data_in__237__ ;
output		io_dram_data_in__236__ ;
output		io_dram_data_in__235__ ;
output		io_dram_data_in__234__ ;
output		io_dram_data_in__233__ ;
output		io_dram_data_in__232__ ;
output		io_dram_data_in__231__ ;
output		io_dram_data_in__230__ ;
output		io_dram_data_in__229__ ;
output		io_dram_data_in__228__ ;
output		io_dram_data_in__227__ ;
output		io_dram_data_in__226__ ;
output		io_dram_data_in__225__ ;
output		io_dram_data_in__224__ ;
output		io_dram_ecc_in__31__ ;
output		io_dram_ecc_in__30__ ;
output		io_dram_ecc_in__29__ ;
output		io_dram_ecc_in__28__ ;
output		io_dram_ecc_in__27__ ;
output		io_dram_ecc_in__26__ ;
output		io_dram_ecc_in__25__ ;
output		io_dram_ecc_in__24__ ;
output		io_dram_ecc_in__15__ ;
output		io_dram_ecc_in__14__ ;
output		io_dram_ecc_in__13__ ;
output		io_dram_ecc_in__12__ ;
output		io_dram_ecc_in__11__ ;
output		io_dram_ecc_in__10__ ;
output		io_dram_ecc_in__9__ ;
output		io_dram_ecc_in__8__ ;
output		io_dram_data_in__191__ ;
output		io_dram_data_in__190__ ;
output		io_dram_data_in__189__ ;
output		io_dram_data_in__188__ ;
output		io_dram_data_in__187__ ;
output		io_dram_data_in__186__ ;
output		io_dram_data_in__185__ ;
output		io_dram_data_in__184__ ;
output		io_dram_data_in__183__ ;
output		io_dram_data_in__182__ ;
output		io_dram_data_in__181__ ;
output		io_dram_data_in__180__ ;
output		io_dram_data_in__179__ ;
output		io_dram_data_in__178__ ;
output		io_dram_data_in__177__ ;
output		io_dram_data_in__176__ ;
output		io_dram_data_in__175__ ;
output		io_dram_data_in__174__ ;
output		io_dram_data_in__173__ ;
output		io_dram_data_in__172__ ;
output		io_dram_data_in__171__ ;
output		io_dram_data_in__170__ ;
output		io_dram_data_in__169__ ;
output		io_dram_data_in__168__ ;
output		io_dram_data_in__167__ ;
output		io_dram_data_in__166__ ;
output		io_dram_data_in__165__ ;
output		io_dram_data_in__164__ ;
output		io_dram_data_in__163__ ;
output		io_dram_data_in__162__ ;
output		io_dram_data_in__161__ ;
output		io_dram_data_in__160__ ;
output		io_dram_data_in__127__ ;
output		io_dram_data_in__126__ ;
output		io_dram_data_in__125__ ;
output		io_dram_data_in__124__ ;
output		io_dram_data_in__123__ ;
output		io_dram_data_in__122__ ;
output		io_dram_data_in__121__ ;
output		io_dram_data_in__120__ ;
output		io_dram_data_in__119__ ;
output		io_dram_data_in__118__ ;
output		io_dram_data_in__117__ ;
output		io_dram_data_in__116__ ;
output		io_dram_data_in__115__ ;
output		io_dram_data_in__114__ ;
output		io_dram_data_in__113__ ;
output		io_dram_data_in__112__ ;
output		io_dram_data_in__111__ ;
output		io_dram_data_in__110__ ;
output		io_dram_data_in__109__ ;
output		io_dram_data_in__108__ ;
output		io_dram_data_in__107__ ;
output		io_dram_data_in__106__ ;
output		io_dram_data_in__105__ ;
output		io_dram_data_in__104__ ;
output		io_dram_data_in__103__ ;
output		io_dram_data_in__102__ ;
output		io_dram_data_in__101__ ;
output		io_dram_data_in__100__ ;
output		io_dram_data_in__99__ ;
output		io_dram_data_in__98__ ;
output		io_dram_data_in__97__ ;
output		io_dram_data_in__96__ ;
output		bso ;
output		pad_clk_so ;
output		bypass_enable_o_r ;
output		io_dram_data_in__63__ ;
output		io_dram_data_in__62__ ;
output		io_dram_data_in__61__ ;
output		io_dram_data_in__60__ ;
output		io_dram_data_in__59__ ;
output		io_dram_data_in__58__ ;
output		io_dram_data_in__57__ ;
output		io_dram_data_in__56__ ;
output		io_dram_data_in__55__ ;
output		io_dram_data_in__54__ ;
output		io_dram_data_in__53__ ;
output		io_dram_data_in__52__ ;
output		io_dram_data_in__51__ ;
output		io_dram_data_in__50__ ;
output		io_dram_data_in__49__ ;
output		io_dram_data_in__48__ ;
output		io_dram_data_in__47__ ;
output		io_dram_data_in__46__ ;
output		io_dram_data_in__45__ ;
output		io_dram_data_in__44__ ;
output		io_dram_data_in__43__ ;
output		io_dram_data_in__42__ ;
output		io_dram_data_in__41__ ;
output		io_dram_data_in__40__ ;
output		io_dram_data_in__39__ ;
output		io_dram_data_in__38__ ;
output		io_dram_data_in__37__ ;
output		io_dram_data_in__36__ ;
output		io_dram_data_in__35__ ;
output		io_dram_data_in__34__ ;
output		io_dram_data_in__33__ ;
output		io_dram_data_in__32__ ;
input		ps_select_i_r ;
input		test_mode_i_l ;
input		testmode_l_i_r ;
input		test_mode_i_r ;
input		bypass_enable_i_l ;
input		bypass_enable_i_r ;
input		ps_select_i_l ;
input		se_i_r ;
input		mode_ctrl_i_r ;
input		clock_dr_i_r ;
input		hiz_n_i_r ;
input		update_dr_i_r ;
input		dram_io_drive_enable_i_r ;
input		rclk ;
input		testmode_l_i_l ;
input		burst_length_four_i_l ;
input		dram_io_pad_enable_i_l ;
input		dram_io_drive_enable_i_l ;
input		rst_l_i_l ;
input		arst_l_i_l ;
input		strobe_i_l ;
input		dram_io_channel_disabled_i_l ;
input		dram_io_drive_data_i_l ;
input		dram_io_channel_disabled_i_r ;
input		dram_io_write_en_l ;
input		dram_io_data_out__63__ ;
input		dram_io_data_out__62__ ;
input		dram_io_data_out__61__ ;
input		dram_io_data_out__60__ ;
input		dram_io_data_out__59__ ;
input		dram_io_data_out__58__ ;
input		dram_io_data_out__57__ ;
input		dram_io_data_out__56__ ;
input		dram_io_data_out__55__ ;
input		dram_io_data_out__54__ ;
input		dram_io_data_out__53__ ;
input		dram_io_data_out__52__ ;
input		dram_io_data_out__51__ ;
input		dram_io_data_out__50__ ;
input		dram_io_data_out__49__ ;
input		dram_io_data_out__48__ ;
input		dram_io_data_out__47__ ;
input		dram_io_data_out__46__ ;
input		dram_io_data_out__45__ ;
input		dram_io_data_out__44__ ;
input		dram_io_data_out__43__ ;
input		dram_io_data_out__42__ ;
input		dram_io_data_out__41__ ;
input		dram_io_data_out__40__ ;
input		dram_io_data_out__39__ ;
input		dram_io_data_out__38__ ;
input		dram_io_data_out__37__ ;
input		dram_io_data_out__36__ ;
input		dram_io_data_out__35__ ;
input		dram_io_data_out__34__ ;
input		dram_io_data_out__33__ ;
input		dram_io_data_out__32__ ;
input		dram_io_cas_l ;
input		dram_io_data_out__287__ ;
input		dram_io_data_out__286__ ;
input		dram_io_data_out__285__ ;
input		dram_io_data_out__284__ ;
input		dram_io_data_out__283__ ;
input		dram_io_data_out__282__ ;
input		dram_io_data_out__281__ ;
input		dram_io_data_out__280__ ;
input		dram_io_data_out__143__ ;
input		dram_io_data_out__142__ ;
input		dram_io_data_out__141__ ;
input		dram_io_data_out__140__ ;
input		dram_io_data_out__139__ ;
input		dram_io_data_out__138__ ;
input		dram_io_data_out__137__ ;
input		dram_io_data_out__136__ ;
input		dram_io_data_out__127__ ;
input		dram_io_data_out__126__ ;
input		dram_io_data_out__125__ ;
input		dram_io_data_out__124__ ;
input		dram_io_data_out__123__ ;
input		dram_io_data_out__122__ ;
input		dram_io_data_out__121__ ;
input		dram_io_data_out__120__ ;
input		dram_io_data_out__119__ ;
input		dram_io_data_out__118__ ;
input		dram_io_data_out__117__ ;
input		dram_io_data_out__116__ ;
input		dram_io_data_out__115__ ;
input		dram_io_data_out__114__ ;
input		dram_io_data_out__113__ ;
input		dram_io_data_out__112__ ;
input		dram_io_data_out__111__ ;
input		dram_io_data_out__110__ ;
input		dram_io_data_out__109__ ;
input		dram_io_data_out__108__ ;
input		dram_io_data_out__107__ ;
input		dram_io_data_out__106__ ;
input		dram_io_data_out__105__ ;
input		dram_io_data_out__104__ ;
input		dram_io_data_out__103__ ;
input		dram_io_data_out__102__ ;
input		dram_io_data_out__101__ ;
input		dram_io_data_out__100__ ;
input		dram_io_data_out__99__ ;
input		dram_io_data_out__98__ ;
input		dram_io_data_out__97__ ;
input		dram_io_data_out__96__ ;
input		rst_l_i_r ;
input		arst_l_i_r ;
input		pad_clk_si ;
input		dram_io_pad_enable_i_r ;
input		dram_io_data_out__271__ ;
input		dram_io_data_out__270__ ;
input		dram_io_data_out__269__ ;
input		dram_io_data_out__268__ ;
input		dram_io_data_out__267__ ;
input		dram_io_data_out__266__ ;
input		dram_io_data_out__265__ ;
input		dram_io_data_out__264__ ;
input		dram_io_data_out__263__ ;
input		dram_io_data_out__262__ ;
input		dram_io_data_out__261__ ;
input		dram_io_data_out__260__ ;
input		dram_io_data_out__259__ ;
input		dram_io_data_out__258__ ;
input		dram_io_data_out__257__ ;
input		dram_io_data_out__256__ ;
input		dram_io_data_out__255__ ;
input		dram_io_data_out__254__ ;
input		dram_io_data_out__253__ ;
input		dram_io_data_out__252__ ;
input		dram_io_data_out__251__ ;
input		dram_io_data_out__250__ ;
input		dram_io_data_out__249__ ;
input		dram_io_data_out__248__ ;
input		dram_io_data_out__247__ ;
input		dram_io_data_out__246__ ;
input		dram_io_data_out__245__ ;
input		dram_io_data_out__244__ ;
input		dram_io_data_out__243__ ;
input		dram_io_data_out__242__ ;
input		dram_io_data_out__241__ ;
input		dram_io_data_out__240__ ;
input		mode_ctrl_i_l ;
input		bsi ;
input		burst_length_four_i_r ;
input		strobe_i_r ;
input		update_dr_i_l ;
input		hiz_n_i_l ;
input		clock_dr_i_l ;
input		shift_dr_i_l ;
input		se_i_l ;
input		dram_io_ras_l ;
input		dram_io_drive_data_i_r ;
input		shift_dr_i_r ;
input		vdd_h ;
input		dram_io_data_out__207__ ;
input		dram_io_data_out__206__ ;
input		dram_io_data_out__205__ ;
input		dram_io_data_out__204__ ;
input		dram_io_data_out__203__ ;
input		dram_io_data_out__202__ ;
input		dram_io_data_out__201__ ;
input		dram_io_data_out__200__ ;
input		dram_io_data_out__199__ ;
input		dram_io_data_out__198__ ;
input		dram_io_data_out__197__ ;
input		dram_io_data_out__196__ ;
input		dram_io_data_out__195__ ;
input		dram_io_data_out__194__ ;
input		dram_io_data_out__193__ ;
input		dram_io_data_out__192__ ;
input		dram_io_data_out__191__ ;
input		dram_io_data_out__190__ ;
input		dram_io_data_out__189__ ;
input		dram_io_data_out__188__ ;
input		dram_io_data_out__187__ ;
input		dram_io_data_out__186__ ;
input		dram_io_data_out__185__ ;
input		dram_io_data_out__184__ ;
input		dram_io_data_out__183__ ;
input		dram_io_data_out__182__ ;
input		dram_io_data_out__181__ ;
input		dram_io_data_out__180__ ;
input		dram_io_data_out__179__ ;
input		dram_io_data_out__178__ ;
input		dram_io_data_out__177__ ;
input		dram_io_data_out__176__ ;
inout		dram_we_l ;
inout		dram_cas_l ;
inout		dram_dq__127__ ;
inout		dram_dq__126__ ;
inout		dram_dq__125__ ;
inout		dram_dq__124__ ;
inout		dram_dq__123__ ;
inout		dram_dq__122__ ;
inout		dram_dq__121__ ;
inout		dram_dq__120__ ;
inout		dram_dq__119__ ;
inout		dram_dq__118__ ;
inout		dram_dq__117__ ;
inout		dram_dq__116__ ;
inout		dram_dq__115__ ;
inout		dram_dq__114__ ;
inout		dram_dq__113__ ;
inout		dram_dq__112__ ;
inout		dram_dq__111__ ;
inout		dram_dq__110__ ;
inout		dram_dq__109__ ;
inout		dram_dq__108__ ;
inout		dram_dq__107__ ;
inout		dram_dq__106__ ;
inout		dram_dq__105__ ;
inout		dram_dq__104__ ;
inout		dram_dq__103__ ;
inout		dram_dq__102__ ;
inout		dram_dq__101__ ;
inout		dram_dq__100__ ;
inout		dram_dq__99__ ;
inout		dram_dq__98__ ;
inout		dram_dq__97__ ;
inout		dram_dq__96__ ;
inout		dram_ras_l ;
inout		dram_dqs__7__ ;
inout		dram_dqs__6__ ;
inout		dram_dqs__5__ ;
inout		dram_dqs__4__ ;
inout		dram_dq__63__ ;
inout		dram_dq__62__ ;
inout		dram_dq__61__ ;
inout		dram_dq__60__ ;
inout		dram_dq__59__ ;
inout		dram_dq__58__ ;
inout		dram_dq__57__ ;
inout		dram_dq__56__ ;
inout		dram_dq__55__ ;
inout		dram_dq__54__ ;
inout		dram_dq__53__ ;
inout		dram_dq__52__ ;
inout		dram_dq__51__ ;
inout		dram_dq__50__ ;
inout		dram_dq__49__ ;
inout		dram_dq__48__ ;
inout		dram_dq__47__ ;
inout		dram_dq__46__ ;
inout		dram_dq__45__ ;
inout		dram_dq__44__ ;
inout		dram_dq__43__ ;
inout		dram_dq__42__ ;
inout		dram_dq__41__ ;
inout		dram_dq__40__ ;
inout		dram_dq__39__ ;
inout		dram_dq__38__ ;
inout		dram_dq__37__ ;
inout		dram_dq__36__ ;
inout		dram_dq__35__ ;
inout		dram_dq__34__ ;
inout		dram_dq__33__ ;
inout		dram_dq__32__ ;
inout		dram_dqs__35__ ;
inout		dram_dqs__34__ ;
inout		dram_dqs__33__ ;
inout		dram_dqs__32__ ;
inout		dram_dqs__31__ ;
inout		dram_dqs__16__ ;
inout		dram_dqs__15__ ;
inout		dram_dqs__14__ ;
inout		dram_dqs__13__ ;
inout		dram_dqs__26__ ;
inout		dram_dqs__25__ ;
inout		dram_dqs__24__ ;
inout		dram_dqs__23__ ;
inout		dram_dqs__22__ ;
 
wire [7:0]	net0601 ;
wire [7:0]	net0324 ;
wire [7:0]	net0742 ;
wire [7:0]	net1106 ;
wire [7:0]	net0643 ;
wire [1:0]	net1118 ;
wire [7:0]	net0648 ;
wire [7:0]	net1290 ;
wire [7:0]	net997 ;
wire [7:0]	net857 ;
wire [7:0]	net856 ;
wire [7:0]	net0644 ;
wire [7:0]	net0945 ;
wire [1:0]	net1016 ;
wire [7:0]	net0845 ;
wire [7:0]	net0691 ;
wire [1:0]	net0373 ;
wire [1:0]	net0557 ;
wire [7:0]	net0844 ;
wire [1:0]	net0402 ;
wire [7:0]	net0699 ;
wire [7:0]	net1167 ;
wire [7:0]	net1122 ;
wire [1:0]	net1163 ;
wire [7:0]	net872 ;
wire [1:0]	net863 ;
wire [7:0]	net0895 ;
wire [4:0]	net0390 ;
wire [4:0]	net0565 ;
wire [4:0]	net1277 ;
wire [7:0]	net981 ;
wire [4:0]	net1007 ;
wire [7:0]	net1042 ;
wire [4:0]	net0399 ;
wire [7:0]	net1107 ;
wire [7:0]	net1145 ;
wire [7:0]	net0974 ;
wire [7:0]	net0602 ;
wire [1:0]	net0509 ;
wire [1:0]	net0558 ;
wire [4:0]	net1155 ;
wire [4:0]	net0517 ;
wire [1:0]	net868 ;
wire [1:0]	net0407 ;
wire [1:0]	net966 ;
wire [1:0]	net1286 ;
wire [1:0]	net1158 ;
wire [1:0]	net1164 ;
wire [4:0]	net1029 ;
wire [1:0]	net1038 ;
wire [1:0]	net1136 ;
wire [4:0]	net1103 ;
wire [1:0]	net1097 ;
wire [1:0]	net0371 ;
wire [1:0]	net0381 ;
wire [1:0]	net0408 ;
wire [4:0]	net977 ;
wire [1:0]	net1090 ;
wire [1:0]	net848 ;
wire [1:0]	net1015 ;
wire [1:0]	net0562 ;
wire [1:0]	net964 ;
wire [1:0]	net1280 ;
wire [1:0]	net0510 ;
wire [1:0]	net0514 ;
wire [1:0]	net1264 ;
wire		net875 ;
wire		net973 ;
wire		net1291 ;
wire		net1096 ;
wire		net0370 ;
wire		net1115 ;
wire		net974 ;
wire		net1017 ;
wire		net1293 ;
wire		net0372 ;
wire		net1294 ;
wire		net879 ;
wire		net0374 ;
wire		net1296 ;
wire		net0552 ;
wire		net0377 ;
wire		net0555 ;
wire		net0556 ;
wire		net1121 ;
wire		net1023 ;
wire		net0559 ;
wire		net982 ;
wire		net1025 ;
wire		net983 ;
wire		net1125 ;
wire		net1027 ;
wire		net1028 ;
wire		net0400 ;
wire		net0401 ;
wire		net1128 ;
wire		net0560 ;
wire		net0403 ;
wire		net0404 ;
wire		net0561 ;
wire		net0386 ;
wire		net0387 ;
wire		net0406 ;
wire		net0563 ;
wire		net0388 ;
wire		net0564 ;
wire		net0389 ;
wire		net0409 ;
wire		net0566 ;
wire		net1171 ;
wire		net991 ;
wire		net1270 ;
wire		net1271 ;
wire		net994 ;
wire		net1272 ;
wire		net1273 ;
wire		net1274 ;
wire		net1275 ;
wire		net999 ;
wire		net1278 ;
wire		net1279 ;
wire		net0831 ;
wire		net1001 ;
wire		net0832 ;
wire		net1100 ;
wire		net1002 ;
wire		net0735 ;
wire		bso0_bsi1 ;
wire		net1101 ;
wire		net1003 ;
wire		net0736 ;
wire		net0639 ;
wire		net1004 ;
wire		bso2_bsi3 ;
wire		net1104 ;
wire		net1281 ;
wire		net1006 ;
wire		net1008 ;
wire		net1284 ;
wire		net1089 ;
wire		net0640 ;
wire		net1287 ;
wire		net0543 ;
wire		net0544 ;
wire		net0368 ;
wire		net0369 ;
wire		net1150 ;
wire		net1151 ;
wire		net1154 ;
wire		net1254 ;
wire		net837 ;
wire		net1156 ;
wire		net0511 ;
wire		net1157 ;
wire		net0512 ;
wire		net0591 ;
wire		net839 ;
wire		net1159 ;
wire		net0513 ;
wire		net1257 ;
wire		net0592 ;
wire		net0515 ;
wire		pad_clk_so1_si2 ;
wire		net1259 ;
wire		net0516 ;
wire		net0518 ;
wire		pad_clk_so2_si3 ;
wire		net1160 ;
wire		net843 ;
wire		net1260 ;
wire		net844 ;
wire		net846 ;
wire		net847 ;
wire		net1166 ;
wire		pad_clk_so0_si1 ;
wire		net1266 ;
wire		net1169 ;
wire		net1030 ;
wire		net850 ;
wire		net1130 ;
wire		net1033 ;
wire		net852 ;
wire		net1036 ;
wire		net1134 ;
wire		net0410 ;
wire		pad_clk_so3_si4 ;
wire		net1137 ;
wire		net858 ;
wire		net0393 ;
wire		net0413 ;
wire		net0394 ;
wire		net0414 ;
wire		net0415 ;
wire		net0416 ;
wire		net0397 ;
wire		net0495 ;
wire		net0417 ;
wire		net0496 ;
wire		net0398 ;
wire		net0418 ;
wire		net0419 ;
wire		net862 ;
wire		net1043 ;
wire		bso1_bsi2 ;
wire		net1143 ;
wire		net1045 ;
wire		net1144 ;
wire		net963 ;
wire		net1046 ;
wire		net865 ;
wire		net1047 ;
wire		bso3_bsi4 ;
wire		net1049 ;
wire		net967 ;
wire		net0879 ;
wire		net968 ;
wire		net1149 ;
wire		net0504 ;
wire		net870 ;
wire		net0507 ;
wire		net0783 ;
wire		net871 ;
wire		net0508 ;
wire		net0784 ;
wire		net0687 ;
wire		net971 ;
wire		net0884 ;
wire		net0688 ;
 
 
bw_io_ddr_6sig_x4 I0 (
     .serial_in       ({serial_in[87:72] } ),
     .afo             ({afo[87:72] } ),
     .serial_out      ({serial_out[87:72] } ),
     .afi             ({afi[87:72] } ),
     .vrefcode_i_l    ({net0324[0] ,net0324[1] ,net0324[2] ,net0324[3] ,
            net0324[4] ,net0324[5] ,net0324[6] ,net0324[7] } ),
     .vrefcode_i_r    ({net0691[0] ,net0691[1] ,net0691[2] ,net0691[3] ,
            net0691[4] ,net0691[5] ,net0691[6] ,net0691[7] } ),
     .data_neg        ({dram_io_data_out__247__ ,dram_io_data_out__246__ ,
            dram_io_data_out__245__ ,dram_io_data_out__244__ ,
            dram_io_data_out__243__ ,dram_io_data_out__242__ ,
            dram_io_data_out__241__ ,dram_io_data_out__240__ ,
            dram_io_data_out__183__ ,dram_io_data_out__182__ ,
            dram_io_data_out__181__ ,dram_io_data_out__180__ ,
            dram_io_data_out__179__ ,dram_io_data_out__178__ ,
            dram_io_data_out__177__ ,dram_io_data_out__176__ } ),
     .data_pos        ({dram_io_data_out__103__ ,dram_io_data_out__102__ ,
            dram_io_data_out__101__ ,dram_io_data_out__100__ ,
            dram_io_data_out__99__ ,dram_io_data_out__98__ ,
            dram_io_data_out__97__ ,dram_io_data_out__96__ ,
            dram_io_data_out__39__ ,dram_io_data_out__38__ ,
            dram_io_data_out__37__ ,dram_io_data_out__36__ ,
            dram_io_data_out__35__ ,dram_io_data_out__34__ ,
            dram_io_data_out__33__ ,dram_io_data_out__32__ } ),
     .io_dram_data_in ({io_dram_data_in__103__ ,io_dram_data_in__102__ ,
            io_dram_data_in__101__ ,io_dram_data_in__100__ ,
            io_dram_data_in__99__ ,io_dram_data_in__98__ ,
            io_dram_data_in__97__ ,io_dram_data_in__96__ ,
            io_dram_data_in__39__ ,io_dram_data_in__38__ ,
            io_dram_data_in__37__ ,io_dram_data_in__36__ ,
            io_dram_data_in__35__ ,io_dram_data_in__34__ ,
            io_dram_data_in__33__ ,io_dram_data_in__32__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__231__ ,io_dram_data_in__230__
             ,io_dram_data_in__229__ ,io_dram_data_in__228__ ,
            io_dram_data_in__227__ ,io_dram_data_in__226__ ,
            io_dram_data_in__225__ ,io_dram_data_in__224__ ,
            io_dram_data_in__167__ ,io_dram_data_in__166__ ,
            io_dram_data_in__165__ ,io_dram_data_in__164__ ,
            io_dram_data_in__163__ ,io_dram_data_in__162__ ,
            io_dram_data_in__161__ ,io_dram_data_in__160__ } ),
     .dq_pad          ({dram_dq__103__ ,dram_dq__102__ ,dram_dq__101__ ,
            dram_dq__100__ ,dram_dq__99__ ,dram_dq__98__ ,dram_dq__97__ ,
            dram_dq__96__ ,dram_dq__39__ ,dram_dq__38__ ,dram_dq__37__ ,
            dram_dq__36__ ,dram_dq__35__ ,dram_dq__34__ ,dram_dq__33__ ,
            dram_dq__32__ } ),
     .lpf_code_i_r    ({net0565[0] ,net0565[1] ,net0565[2] ,net0565[3] ,
            net0565[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net0562[0] ,net0562[1] } ),
     .pad_pos_cnt_i_r ({net0558[0] ,net0558[1] } ),
     .pad_neg_cnt_i_r ({net0557[0] ,net0557[1] } ),
     .cbu_i_r         ({net0602[0] ,net0602[1] ,net0602[2] ,net0602[3] ,
            net0602[4] ,net0602[5] ,net0602[6] ,net0602[7] } ),
     .cbd_i_r         ({net0601[0] ,net0601[1] ,net0601[2] ,net0601[3] ,
            net0601[4] ,net0601[5] ,net0601[6] ,net0601[7] } ),
     .dqs_pad         ({dram_dqs__31__ ,dram_dqs__22__ ,dram_dqs__13__ ,
            dram_dqs__4__ } ),
     .lpf_code_i_l    ({net0517[0] ,net0517[1] ,net0517[2] ,net0517[3] ,
            net0517[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net0514[0] ,net0514[1] } ),
     .pad_pos_cnt_i_l ({net0510[0] ,net0510[1] } ),
     .pad_neg_cnt_i_l ({net0509[0] ,net0509[1] } ),
     .cbu_i_l         ({net0644[0] ,net0644[1] ,net0644[2] ,net0644[3] ,
            net0644[4] ,net0644[5] ,net0644[6] ,net0644[7] } ),
     .cbd_i_l         ({net0643[0] ,net0643[1] ,net0643[2] ,net0643[3] ,
            net0643[4] ,net0643[5] ,net0643[6] ,net0643[7] } ),
     .bypass_enable_i_r (net1130 ),
     .ps_select_i_r   (net0544 ),
     .test_mode_i_l   (net0495 ),
     .testmode_l_i_l  (net0511 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0543 ),
     .strobe_i_r      (net0566 ),
     .burst_length_four_i_r (net0563 ),
     .dram_io_pad_enable_i_r (net0561 ),
     .dram_io_drive_enable_i_r (net0560 ),
     .rst_l_i_r       (net0564 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net0556 ),
     .dram_io_drive_data_i_r (net0555 ),
     .se_i_r          (net0552 ),
     .mode_ctrl_i_r   (net1125 ),
     .update_dr_i_r   (net1293 ),
     .shift_dr_i_r    (net1294 ),
     .clock_dr_i_r    (net1128 ),
     .hiz_n_i_r       (net1296 ),
     .pad_clk_si      (pad_clk_si ),
     .pad_clk_so      (pad_clk_so0_si1 ),
     .ctl_pad_0       (dram_addr[10] ),
     .ctl_pad_1       (dram_ba[1] ),
     .ctl_pad_3       (dram_ras_l ),
     .ctl_pad_2       (dram_ba[0] ),
     .ctl_data_0      (dram_io_addr[10] ),
     .ctl_data_1      (dram_io_bank[1] ),
     .ctl_data_2      (dram_io_bank[0] ),
     .ctl_data_3      (dram_io_ras_l ),
     .bsi             (bsi ),
     .bso             (bso0_bsi1 ),
     .strobe_i_l      (net0518 ),
     .burst_length_four_i_l (net0515 ),
     .dram_io_pad_enable_i_l (net0513 ),
     .dram_io_drive_enable_i_l (net0512 ),
     .rst_l_i_l       (net0516 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net0508 ),
     .dram_io_drive_data_i_l (net0507 ),
     .se_i_l          (net0504 ),
     .mode_ctrl_i_l   (net1270 ),
     .ps_select_i_l   (net0496 ),
     .shift_dr_i_l    (net1272 ),
     .clock_dr_i_l    (net1273 ),
     .testmode_l_i_r  (net0559 ),
     .hiz_n_i_l       (net1274 ),
     .bypass_enable_i_l (net1275 ),
     .update_dr_i_l   (net1271 ) );
bw_io_ddr_6sig_x4 I1 (
     .serial_in       ({serial_in[103:88] } ),
     .afo             ({afo[103:88] } ),
     .serial_out      ({serial_out[103:88] } ),
     .afi             ({afi[103:88] } ),
     .vrefcode_i_l    ({net0648[0] ,net0648[1] ,net0648[2] ,net0648[3] ,
            net0648[4] ,net0648[5] ,net0648[6] ,net0648[7] } ),
     .vrefcode_i_r    ({net0699[0] ,net0699[1] ,net0699[2] ,net0699[3] ,
            net0699[4] ,net0699[5] ,net0699[6] ,net0699[7] } ),
     .data_neg        ({dram_io_data_out__255__ ,dram_io_data_out__254__ ,
            dram_io_data_out__253__ ,dram_io_data_out__252__ ,
            dram_io_data_out__251__ ,dram_io_data_out__250__ ,
            dram_io_data_out__249__ ,dram_io_data_out__248__ ,
            dram_io_data_out__191__ ,dram_io_data_out__190__ ,
            dram_io_data_out__189__ ,dram_io_data_out__188__ ,
            dram_io_data_out__187__ ,dram_io_data_out__186__ ,
            dram_io_data_out__185__ ,dram_io_data_out__184__ } ),
     .data_pos        ({dram_io_data_out__111__ ,dram_io_data_out__110__ ,
            dram_io_data_out__109__ ,dram_io_data_out__108__ ,
            dram_io_data_out__107__ ,dram_io_data_out__106__ ,
            dram_io_data_out__105__ ,dram_io_data_out__104__ ,
            dram_io_data_out__47__ ,dram_io_data_out__46__ ,
            dram_io_data_out__45__ ,dram_io_data_out__44__ ,
            dram_io_data_out__43__ ,dram_io_data_out__42__ ,
            dram_io_data_out__41__ ,dram_io_data_out__40__ } ),
     .io_dram_data_in ({io_dram_data_in__111__ ,io_dram_data_in__110__ ,
            io_dram_data_in__109__ ,io_dram_data_in__108__ ,
            io_dram_data_in__107__ ,io_dram_data_in__106__ ,
            io_dram_data_in__105__ ,io_dram_data_in__104__ ,
            io_dram_data_in__47__ ,io_dram_data_in__46__ ,
            io_dram_data_in__45__ ,io_dram_data_in__44__ ,
            io_dram_data_in__43__ ,io_dram_data_in__42__ ,
            io_dram_data_in__41__ ,io_dram_data_in__40__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__239__ ,io_dram_data_in__238__
             ,io_dram_data_in__237__ ,io_dram_data_in__236__ ,
            io_dram_data_in__235__ ,io_dram_data_in__234__ ,
            io_dram_data_in__233__ ,io_dram_data_in__232__ ,
            io_dram_data_in__175__ ,io_dram_data_in__174__ ,
            io_dram_data_in__173__ ,io_dram_data_in__172__ ,
            io_dram_data_in__171__ ,io_dram_data_in__170__ ,
            io_dram_data_in__169__ ,io_dram_data_in__168__ } ),
     .dq_pad          ({dram_dq__111__ ,dram_dq__110__ ,dram_dq__109__ ,
            dram_dq__108__ ,dram_dq__107__ ,dram_dq__106__ ,dram_dq__105__ ,
            dram_dq__104__ ,dram_dq__47__ ,dram_dq__46__ ,dram_dq__45__ ,
            dram_dq__44__ ,dram_dq__43__ ,dram_dq__42__ ,dram_dq__41__ ,
            dram_dq__40__ } ),
     .lpf_code_i_r    ({net1277[0] ,net1277[1] ,net1277[2] ,net1277[3] ,
            net1277[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net1280[0] ,net1280[1] } ),
     .pad_pos_cnt_i_r ({net1118[0] ,net1118[1] } ),
     .pad_neg_cnt_i_r ({net1286[0] ,net1286[1] } ),
     .cbu_i_r         ({net1290[0] ,net1290[1] ,net1290[2] ,net1290[3] ,
            net1290[4] ,net1290[5] ,net1290[6] ,net1290[7] } ),
     .cbd_i_r         ({net1122[0] ,net1122[1] ,net1122[2] ,net1122[3] ,
            net1122[4] ,net1122[5] ,net1122[6] ,net1122[7] } ),
     .dqs_pad         ({dram_dqs__32__ ,dram_dqs__23__ ,dram_dqs__14__ ,
            dram_dqs__5__ } ),
     .lpf_code_i_l    ({net1103[0] ,net1103[1] ,net1103[2] ,net1103[3] ,
            net1103[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net1097[0] ,net1097[1] } ),
     .pad_pos_cnt_i_l ({net1090[0] ,net1090[1] } ),
     .pad_neg_cnt_i_l ({net1264[0] ,net1264[1] } ),
     .cbu_i_l         ({net1107[0] ,net1107[1] ,net1107[2] ,net1107[3] ,
            net1107[4] ,net1107[5] ,net1107[6] ,net1107[7] } ),
     .cbd_i_l         ({net1106[0] ,net1106[1] ,net1106[2] ,net1106[3] ,
            net1106[4] ,net1106[5] ,net1106[6] ,net1106[7] } ),
     .bypass_enable_i_r (net1004 ),
     .ps_select_i_r   (net0640 ),
     .test_mode_i_l   (net0591 ),
     .testmode_l_i_l  (net1100 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0639 ),
     .strobe_i_r      (net1104 ),
     .burst_length_four_i_r (net1279 ),
     .dram_io_pad_enable_i_r (net1281 ),
     .dram_io_drive_enable_i_r (net1115 ),
     .rst_l_i_r       (net1278 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net1287 ),
     .dram_io_drive_data_i_r (net1121 ),
     .se_i_r          (net1291 ),
     .mode_ctrl_i_r   (net999 ),
     .update_dr_i_r   (net1171 ),
     .shift_dr_i_r    (net1001 ),
     .clock_dr_i_r    (net1002 ),
     .hiz_n_i_r       (net1003 ),
     .pad_clk_si      (pad_clk_so0_si1 ),
     .pad_clk_so      (pad_clk_so1_si2 ),
     .ctl_pad_0       (spare_ddr_pin[7] ),
     .ctl_pad_1       (dram_we_l ),
     .ctl_pad_3       (dram_cs_l[0] ),
     .ctl_pad_2       (dram_cas_l ),
     .ctl_data_0      (spare_ddr_data[7] ),
     .ctl_data_1      (dram_io_write_en_l ),
     .ctl_data_2      (dram_io_cas_l ),
     .ctl_data_3      (dram_io_cs_l[0] ),
     .bsi             (bso0_bsi1 ),
     .bso             (bso1_bsi2 ),
     .strobe_i_l      (net1254 ),
     .burst_length_four_i_l (net1257 ),
     .dram_io_pad_enable_i_l (net1259 ),
     .dram_io_drive_enable_i_l (net1260 ),
     .rst_l_i_l       (net1101 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net1089 ),
     .dram_io_drive_data_i_l (net1266 ),
     .se_i_l          (net1096 ),
     .mode_ctrl_i_l   (net963 ),
     .ps_select_i_l   (net0592 ),
     .shift_dr_i_l    (net1150 ),
     .clock_dr_i_l    (net1151 ),
     .testmode_l_i_r  (net1284 ),
     .hiz_n_i_l       (net982 ),
     .bypass_enable_i_l (net983 ),
     .update_dr_i_l   (net1149 ) );
bw_io_ddr_6sig_x4 I2 (
     .serial_in       ({serial_in[119:104] } ),
     .afo             ({afo[119:104] } ),
     .serial_out      ({serial_out[119:104] } ),
     .afi             ({afi[119:104] } ),
     .vrefcode_i_l    ({net0895[0] ,net0895[1] ,net0895[2] ,net0895[3] ,
            net0895[4] ,net0895[5] ,net0895[6] ,net0895[7] } ),
     .vrefcode_i_r    ({net0844[0] ,net0844[1] ,net0844[2] ,net0844[3] ,
            net0844[4] ,net0844[5] ,net0844[6] ,net0844[7] } ),
     .data_neg        ({dram_io_data_out__263__ ,dram_io_data_out__262__ ,
            dram_io_data_out__261__ ,dram_io_data_out__260__ ,
            dram_io_data_out__259__ ,dram_io_data_out__258__ ,
            dram_io_data_out__257__ ,dram_io_data_out__256__ ,
            dram_io_data_out__199__ ,dram_io_data_out__198__ ,
            dram_io_data_out__197__ ,dram_io_data_out__196__ ,
            dram_io_data_out__195__ ,dram_io_data_out__194__ ,
            dram_io_data_out__193__ ,dram_io_data_out__192__ } ),
     .data_pos        ({dram_io_data_out__119__ ,dram_io_data_out__118__ ,
            dram_io_data_out__117__ ,dram_io_data_out__116__ ,
            dram_io_data_out__115__ ,dram_io_data_out__114__ ,
            dram_io_data_out__113__ ,dram_io_data_out__112__ ,
            dram_io_data_out__55__ ,dram_io_data_out__54__ ,
            dram_io_data_out__53__ ,dram_io_data_out__52__ ,
            dram_io_data_out__51__ ,dram_io_data_out__50__ ,
            dram_io_data_out__49__ ,dram_io_data_out__48__ } ),
     .io_dram_data_in ({io_dram_data_in__119__ ,io_dram_data_in__118__ ,
            io_dram_data_in__117__ ,io_dram_data_in__116__ ,
            io_dram_data_in__115__ ,io_dram_data_in__114__ ,
            io_dram_data_in__113__ ,io_dram_data_in__112__ ,
            io_dram_data_in__55__ ,io_dram_data_in__54__ ,
            io_dram_data_in__53__ ,io_dram_data_in__52__ ,
            io_dram_data_in__51__ ,io_dram_data_in__50__ ,
            io_dram_data_in__49__ ,io_dram_data_in__48__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__247__ ,io_dram_data_in__246__
             ,io_dram_data_in__245__ ,io_dram_data_in__244__ ,
            io_dram_data_in__243__ ,io_dram_data_in__242__ ,
            io_dram_data_in__241__ ,io_dram_data_in__240__ ,
            io_dram_data_in__183__ ,io_dram_data_in__182__ ,
            io_dram_data_in__181__ ,io_dram_data_in__180__ ,
            io_dram_data_in__179__ ,io_dram_data_in__178__ ,
            io_dram_data_in__177__ ,io_dram_data_in__176__ } ),
     .dq_pad          ({dram_dq__119__ ,dram_dq__118__ ,dram_dq__117__ ,
            dram_dq__116__ ,dram_dq__115__ ,dram_dq__114__ ,dram_dq__113__ ,
            dram_dq__112__ ,dram_dq__55__ ,dram_dq__54__ ,dram_dq__53__ ,
            dram_dq__52__ ,dram_dq__51__ ,dram_dq__50__ ,dram_dq__49__ ,
            dram_dq__48__ } ),
     .lpf_code_i_r    ({net1155[0] ,net1155[1] ,net1155[2] ,net1155[3] ,
            net1155[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net1158[0] ,net1158[1] } ),
     .pad_pos_cnt_i_r ({net1163[0] ,net1163[1] } ),
     .pad_neg_cnt_i_r ({net1164[0] ,net1164[1] } ),
     .cbu_i_r         ({net997[0] ,net997[1] ,net997[2] ,net997[3] ,
            net997[4] ,net997[5] ,net997[6] ,net997[7] } ),
     .cbd_i_r         ({net1167[0] ,net1167[1] ,net1167[2] ,net1167[3] ,
            net1167[4] ,net1167[5] ,net1167[6] ,net1167[7] } ),
     .dqs_pad         ({dram_dqs__33__ ,dram_dqs__24__ ,dram_dqs__15__ ,
            dram_dqs__6__ } ),
     .lpf_code_i_l    ({net977[0] ,net977[1] ,net977[2] ,net977[3] ,
            net977[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net1136[0] ,net1136[1] } ),
     .pad_pos_cnt_i_l ({net966[0] ,net966[1] } ),
     .pad_neg_cnt_i_l ({net964[0] ,net964[1] } ),
     .cbu_i_l         ({net981[0] ,net981[1] ,net981[2] ,net981[3] ,
            net981[4] ,net981[5] ,net981[6] ,net981[7] } ),
     .cbd_i_l         ({net1145[0] ,net1145[1] ,net1145[2] ,net1145[3] ,
            net1145[4] ,net1145[5] ,net1145[6] ,net1145[7] } ),
     .bypass_enable_i_r (net1049 ),
     .ps_select_i_r   (net0736 ),
     .test_mode_i_l   (net0831 ),
     .testmode_l_i_l  (net974 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0735 ),
     .strobe_i_r      (net1154 ),
     .burst_length_four_i_r (net1157 ),
     .dram_io_pad_enable_i_r (net1159 ),
     .dram_io_drive_enable_i_r (net1160 ),
     .rst_l_i_r       (net1156 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net994 ),
     .dram_io_drive_data_i_r (net1166 ),
     .se_i_r          (net1169 ),
     .mode_ctrl_i_r   (net875 ),
     .update_dr_i_r   (net1045 ),
     .shift_dr_i_r    (net1046 ),
     .clock_dr_i_r    (net1047 ),
     .hiz_n_i_r       (net879 ),
     .pad_clk_si      (pad_clk_so1_si2 ),
     .pad_clk_so      (pad_clk_so2_si3 ),
     .ctl_pad_0       (dram_cs_l[1] ),
     .ctl_pad_1       (dram_cs_l[2] ),
     .ctl_pad_3       (spare_ddr_pin[2] ),
     .ctl_pad_2       (dram_cs_l[3] ),
     .ctl_data_0      (dram_io_cs_l[1] ),
     .ctl_data_1      (dram_io_cs_l[2] ),
     .ctl_data_2      (dram_io_cs_l[3] ),
     .ctl_data_3      (spare_ddr_data[2] ),
     .bsi             (bso1_bsi2 ),
     .bso             (bso2_bsi3 ),
     .strobe_i_l      (net973 ),
     .burst_length_four_i_l (net967 ),
     .dram_io_pad_enable_i_l (net1137 ),
     .dram_io_drive_enable_i_l (net968 ),
     .rst_l_i_l       (net1134 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net1143 ),
     .dram_io_drive_data_i_l (net1144 ),
     .se_i_l          (net971 ),
     .mode_ctrl_i_l   (net839 ),
     .ps_select_i_l   (net0832 ),
     .shift_dr_i_l    (net837 ),
     .clock_dr_i_l    (net1025 ),
     .testmode_l_i_r  (net991 ),
     .hiz_n_i_l       (net858 ),
     .bypass_enable_i_l (net1027 ),
     .update_dr_i_l   (net1023 ) );
bw_io_ddr_6sig_x4 I3 (
     .serial_in       ({serial_in[135:120] } ),
     .afo             ({afo[135:120] } ),
     .serial_out      ({serial_out[135:120] } ),
     .afi             ({afi[135:120] } ),
     .vrefcode_i_l    ({net0742[0] ,net0742[1] ,net0742[2] ,net0742[3] ,
            net0742[4] ,net0742[5] ,net0742[6] ,net0742[7] } ),
     .vrefcode_i_r    ({net0845[0] ,net0845[1] ,net0845[2] ,net0845[3] ,
            net0845[4] ,net0845[5] ,net0845[6] ,net0845[7] } ),
     .data_neg        ({dram_io_data_out__271__ ,dram_io_data_out__270__ ,
            dram_io_data_out__269__ ,dram_io_data_out__268__ ,
            dram_io_data_out__267__ ,dram_io_data_out__266__ ,
            dram_io_data_out__265__ ,dram_io_data_out__264__ ,
            dram_io_data_out__207__ ,dram_io_data_out__206__ ,
            dram_io_data_out__205__ ,dram_io_data_out__204__ ,
            dram_io_data_out__203__ ,dram_io_data_out__202__ ,
            dram_io_data_out__201__ ,dram_io_data_out__200__ } ),
     .data_pos        ({dram_io_data_out__127__ ,dram_io_data_out__126__ ,
            dram_io_data_out__125__ ,dram_io_data_out__124__ ,
            dram_io_data_out__123__ ,dram_io_data_out__122__ ,
            dram_io_data_out__121__ ,dram_io_data_out__120__ ,
            dram_io_data_out__63__ ,dram_io_data_out__62__ ,
            dram_io_data_out__61__ ,dram_io_data_out__60__ ,
            dram_io_data_out__59__ ,dram_io_data_out__58__ ,
            dram_io_data_out__57__ ,dram_io_data_out__56__ } ),
     .io_dram_data_in ({io_dram_data_in__127__ ,io_dram_data_in__126__ ,
            io_dram_data_in__125__ ,io_dram_data_in__124__ ,
            io_dram_data_in__123__ ,io_dram_data_in__122__ ,
            io_dram_data_in__121__ ,io_dram_data_in__120__ ,
            io_dram_data_in__63__ ,io_dram_data_in__62__ ,
            io_dram_data_in__61__ ,io_dram_data_in__60__ ,
            io_dram_data_in__59__ ,io_dram_data_in__58__ ,
            io_dram_data_in__57__ ,io_dram_data_in__56__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__255__ ,io_dram_data_in__254__
             ,io_dram_data_in__253__ ,io_dram_data_in__252__ ,
            io_dram_data_in__251__ ,io_dram_data_in__250__ ,
            io_dram_data_in__249__ ,io_dram_data_in__248__ ,
            io_dram_data_in__191__ ,io_dram_data_in__190__ ,
            io_dram_data_in__189__ ,io_dram_data_in__188__ ,
            io_dram_data_in__187__ ,io_dram_data_in__186__ ,
            io_dram_data_in__185__ ,io_dram_data_in__184__ } ),
     .dq_pad          ({dram_dq__127__ ,dram_dq__126__ ,dram_dq__125__ ,
            dram_dq__124__ ,dram_dq__123__ ,dram_dq__122__ ,dram_dq__121__ ,
            dram_dq__120__ ,dram_dq__63__ ,dram_dq__62__ ,dram_dq__61__ ,
            dram_dq__60__ ,dram_dq__59__ ,dram_dq__58__ ,dram_dq__57__ ,
            dram_dq__56__ } ),
     .lpf_code_i_r    ({net1029[0] ,net1029[1] ,net1029[2] ,net1029[3] ,
            net1029[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net863[0] ,net863[1] } ),
     .pad_pos_cnt_i_r ({net868[0] ,net868[1] } ),
     .pad_neg_cnt_i_r ({net1038[0] ,net1038[1] } ),
     .cbu_i_r         ({net1042[0] ,net1042[1] ,net1042[2] ,net1042[3] ,
            net1042[4] ,net1042[5] ,net1042[6] ,net1042[7] } ),
     .cbd_i_r         ({net872[0] ,net872[1] ,net872[2] ,net872[3] ,
            net872[4] ,net872[5] ,net872[6] ,net872[7] } ),
     .dqs_pad         ({dram_dqs__34__ ,dram_dqs__25__ ,dram_dqs__16__ ,
            dram_dqs__7__ } ),
     .lpf_code_i_l    ({net1007[0] ,net1007[1] ,net1007[2] ,net1007[3] ,
            net1007[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net848[0] ,net848[1] } ),
     .pad_pos_cnt_i_l ({net1015[0] ,net1015[1] } ),
     .pad_neg_cnt_i_l ({net1016[0] ,net1016[1] } ),
     .cbu_i_l         ({net857[0] ,net857[1] ,net857[2] ,net857[3] ,
            net857[4] ,net857[5] ,net857[6] ,net857[7] } ),
     .cbd_i_l         ({net856[0] ,net856[1] ,net856[2] ,net856[3] ,
            net856[4] ,net856[5] ,net856[6] ,net856[7] } ),
     .bypass_enable_i_r (net0419 ),
     .ps_select_i_r   (net0784 ),
     .test_mode_i_l   (net0687 ),
     .testmode_l_i_l  (net850 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0783 ),
     .strobe_i_r      (net1028 ),
     .burst_length_four_i_r (net862 ),
     .dram_io_pad_enable_i_r (net1033 ),
     .dram_io_drive_enable_i_r (net865 ),
     .rst_l_i_r       (net1030 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net870 ),
     .dram_io_drive_data_i_r (net871 ),
     .se_i_r          (net1043 ),
     .mode_ctrl_i_r   (net0414 ),
     .update_dr_i_r   (net0415 ),
     .shift_dr_i_r    (net0416 ),
     .clock_dr_i_r    (net0417 ),
     .hiz_n_i_r       (net0418 ),
     .pad_clk_si      (pad_clk_so2_si3 ),
     .pad_clk_so      (pad_clk_so3_si4 ),
     .ctl_pad_0       (spare_ddr_pin[3] ),
     .ctl_pad_1       (spare_ddr_pin[4] ),
     .ctl_pad_3       (spare_ddr_pin[6] ),
     .ctl_pad_2       (spare_ddr_pin[5] ),
     .ctl_data_0      (spare_ddr_data[3] ),
     .ctl_data_1      (spare_ddr_data[4] ),
     .ctl_data_2      (spare_ddr_data[5] ),
     .ctl_data_3      (spare_ddr_data[6] ),
     .bsi             (bso2_bsi3 ),
     .bso             (bso3_bsi4 ),
     .strobe_i_l      (net1006 ),
     .burst_length_four_i_l (net843 ),
     .dram_io_pad_enable_i_l (net852 ),
     .dram_io_drive_enable_i_l (net844 ),
     .rst_l_i_l       (net1008 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net1017 ),
     .dram_io_drive_data_i_l (net846 ),
     .se_i_l          (net847 ),
     .mode_ctrl_i_l   (net0370 ),
     .ps_select_i_l   (net0688 ),
     .shift_dr_i_l    (net0368 ),
     .clock_dr_i_l    (net0369 ),
     .testmode_l_i_r  (net1036 ),
     .hiz_n_i_l       (net0397 ),
     .bypass_enable_i_l (net0398 ),
     .update_dr_i_l   (net0394 ) );
bw_io_ddr_rptr_b I358 (
     .out14           ({cbd_o_l } ),
     .out13           ({cbu_o_l } ),
     .out10           ({net0509[0] ,net0509[1] } ),
     .out9            ({net0510[0] ,net0510[1] } ),
     .out4            ({net0514[0] ,net0514[1] } ),
     .in14            ({net0643[0] ,net0643[1] ,net0643[2] ,net0643[3] ,
            net0643[4] ,net0643[5] ,net0643[6] ,net0643[7] } ),
     .in13            ({net0644[0] ,net0644[1] ,net0644[2] ,net0644[3] ,
            net0644[4] ,net0644[5] ,net0644[6] ,net0644[7] } ),
     .out1            ({net0517[0] ,net0517[1] ,net0517[2] ,net0517[3] ,
            net0517[4] } ),
     .in10            ({pad_neg_cnt_i_l } ),
     .out25           ({net0324[0] ,net0324[1] ,net0324[2] ,net0324[3] ,
            net0324[4] ,net0324[5] ,net0324[6] ,net0324[7] } ),
     .in25            ({vrefcode_i_l } ),
     .in1             ({lpf_code_i_l } ),
     .in4             ({dram_io_ptr_clk_inv_i_l } ),
     .in9             ({pad_pos_cnt_i_l } ),
     .out21           (bypass_enable_o_l ),
     .out20           (hiz_n_o_l ),
     .out19           (clock_dr_o_l ),
     .out18           (shift_dr_o_l ),
     .out17           (update_dr_o_l ),
     .out16           (mode_ctrl_o_l ),
     .out15           (net0504 ),
     .out12           (net0507 ),
     .out8            (net0511 ),
     .out6            (net0512 ),
     .out5            (net0513 ),
     .out3            (net0515 ),
     .out2            (net0516 ),
     .in21            (net1275 ),
     .in20            (net1274 ),
     .in19            (net1273 ),
     .in18            (net1272 ),
     .in17            (net1271 ),
     .in16            (net1270 ),
     .in15            (se_i_l ),
     .in12            (dram_io_drive_data_i_l ),
     .out0            (net0518 ),
     .in22            (net0496 ),
     .out22           (ps_select_o_l ),
     .in24            (test_mode_i_l ),
     .out24           (net0495 ),
     .vdd18           (vdd_h ),
     .in2             (rst_l_i_l ),
     .in5             (dram_io_pad_enable_i_l ),
     .out11           (net0508 ),
     .in3             (burst_length_four_i_l ),
     .in11            (dram_io_channel_disabled_i_l ),
     .in0             (strobe_i_l ),
     .in6             (dram_io_drive_enable_i_l ),
     .in8             (testmode_l_i_l ) );
bw_io_ddr_rptr_b I359 (
     .out14           ({cbd_o_r } ),
     .out13           ({cbu_o_r } ),
     .out10           ({net0557[0] ,net0557[1] } ),
     .out9            ({net0558[0] ,net0558[1] } ),
     .out4            ({net0562[0] ,net0562[1] } ),
     .in14            ({net0601[0] ,net0601[1] ,net0601[2] ,net0601[3] ,
            net0601[4] ,net0601[5] ,net0601[6] ,net0601[7] } ),
     .in13            ({net0602[0] ,net0602[1] ,net0602[2] ,net0602[3] ,
            net0602[4] ,net0602[5] ,net0602[6] ,net0602[7] } ),
     .out1            ({net0565[0] ,net0565[1] ,net0565[2] ,net0565[3] ,
            net0565[4] } ),
     .in10            ({pad_neg_cnt_i_r } ),
     .out25           ({net0691[0] ,net0691[1] ,net0691[2] ,net0691[3] ,
            net0691[4] ,net0691[5] ,net0691[6] ,net0691[7] } ),
     .in25            ({vrefcode_i_r } ),
     .in1             ({lpf_code_i_r } ),
     .in4             ({dram_io_ptr_clk_inv_i_r } ),
     .in9             ({pad_pos_cnt_i_r } ),
     .out21           (bypass_enable_o_r ),
     .out20           (hiz_n_o_r ),
     .out19           (clock_dr_o_r ),
     .out18           (shift_dr_o_r ),
     .out17           (update_dr_o_r ),
     .out16           (mode_ctrl_o_r ),
     .out15           (net0552 ),
     .out12           (net0555 ),
     .out8            (net0559 ),
     .out6            (net0560 ),
     .out5            (net0561 ),
     .out3            (net0563 ),
     .out2            (net0564 ),
     .in21            (net1130 ),
     .in20            (net1296 ),
     .in19            (net1128 ),
     .in18            (net1294 ),
     .in17            (net1293 ),
     .in16            (net1125 ),
     .in15            (se_i_r ),
     .in12            (dram_io_drive_data_i_r ),
     .out0            (net0566 ),
     .in22            (net0544 ),
     .out22           (ps_select_o_r ),
     .in24            (test_mode_i_r ),
     .out24           (net0543 ),
     .vdd18           (vdd_h ),
     .in2             (rst_l_i_r ),
     .in5             (dram_io_pad_enable_i_r ),
     .out11           (net0556 ),
     .in3             (burst_length_four_i_r ),
     .in11            (dram_io_channel_disabled_i_r ),
     .in0             (strobe_i_r ),
     .in6             (dram_io_drive_enable_i_r ),
     .in8             (testmode_l_i_r ) );
bw_io_ddr_rptr_b I277 (
     .out14           ({net0643[0] ,net0643[1] ,net0643[2] ,net0643[3] ,
            net0643[4] ,net0643[5] ,net0643[6] ,net0643[7] } ),
     .out13           ({net0644[0] ,net0644[1] ,net0644[2] ,net0644[3] ,
            net0644[4] ,net0644[5] ,net0644[6] ,net0644[7] } ),
     .out10           ({net1264[0] ,net1264[1] } ),
     .out9            ({net1090[0] ,net1090[1] } ),
     .out4            ({net1097[0] ,net1097[1] } ),
     .in14            ({net1106[0] ,net1106[1] ,net1106[2] ,net1106[3] ,
            net1106[4] ,net1106[5] ,net1106[6] ,net1106[7] } ),
     .in13            ({net1107[0] ,net1107[1] ,net1107[2] ,net1107[3] ,
            net1107[4] ,net1107[5] ,net1107[6] ,net1107[7] } ),
     .out1            ({net1103[0] ,net1103[1] ,net1103[2] ,net1103[3] ,
            net1103[4] } ),
     .in10            ({net0509[0] ,net0509[1] } ),
     .out25           ({net0648[0] ,net0648[1] ,net0648[2] ,net0648[3] ,
            net0648[4] ,net0648[5] ,net0648[6] ,net0648[7] } ),
     .in25            ({net0324[0] ,net0324[1] ,net0324[2] ,net0324[3] ,
            net0324[4] ,net0324[5] ,net0324[6] ,net0324[7] } ),
     .in1             ({net0517[0] ,net0517[1] ,net0517[2] ,net0517[3] ,
            net0517[4] } ),
     .in4             ({net0514[0] ,net0514[1] } ),
     .in9             ({net0510[0] ,net0510[1] } ),
     .out21           (net1275 ),
     .out20           (net1274 ),
     .out19           (net1273 ),
     .out18           (net1272 ),
     .out17           (net1271 ),
     .out16           (net1270 ),
     .out15           (net1096 ),
     .out12           (net1266 ),
     .out8            (net1100 ),
     .out6            (net1260 ),
     .out5            (net1259 ),
     .out3            (net1257 ),
     .out2            (net1101 ),
     .in21            (net983 ),
     .in20            (net982 ),
     .in19            (net1151 ),
     .in18            (net1150 ),
     .in17            (net1149 ),
     .in16            (net963 ),
     .in15            (net0504 ),
     .in12            (net0507 ),
     .out0            (net1254 ),
     .in22            (net0592 ),
     .out22           (net0496 ),
     .in24            (net0495 ),
     .out24           (net0591 ),
     .vdd18           (vdd_h ),
     .in2             (net0516 ),
     .in5             (net0513 ),
     .out11           (net1089 ),
     .in3             (net0515 ),
     .in11            (net0508 ),
     .in0             (net0518 ),
     .in6             (net0512 ),
     .in8             (net0511 ) );
bw_io_ddr_rptr_b I278 (
     .out14           ({net0601[0] ,net0601[1] ,net0601[2] ,net0601[3] ,
            net0601[4] ,net0601[5] ,net0601[6] ,net0601[7] } ),
     .out13           ({net0602[0] ,net0602[1] ,net0602[2] ,net0602[3] ,
            net0602[4] ,net0602[5] ,net0602[6] ,net0602[7] } ),
     .out10           ({net1286[0] ,net1286[1] } ),
     .out9            ({net1118[0] ,net1118[1] } ),
     .out4            ({net1280[0] ,net1280[1] } ),
     .in14            ({net1122[0] ,net1122[1] ,net1122[2] ,net1122[3] ,
            net1122[4] ,net1122[5] ,net1122[6] ,net1122[7] } ),
     .in13            ({net1290[0] ,net1290[1] ,net1290[2] ,net1290[3] ,
            net1290[4] ,net1290[5] ,net1290[6] ,net1290[7] } ),
     .out1            ({net1277[0] ,net1277[1] ,net1277[2] ,net1277[3] ,
            net1277[4] } ),
     .in10            ({net0557[0] ,net0557[1] } ),
     .out25           ({net0699[0] ,net0699[1] ,net0699[2] ,net0699[3] ,
            net0699[4] ,net0699[5] ,net0699[6] ,net0699[7] } ),
     .in25            ({net0691[0] ,net0691[1] ,net0691[2] ,net0691[3] ,
            net0691[4] ,net0691[5] ,net0691[6] ,net0691[7] } ),
     .in1             ({net0565[0] ,net0565[1] ,net0565[2] ,net0565[3] ,
            net0565[4] } ),
     .in4             ({net0562[0] ,net0562[1] } ),
     .in9             ({net0558[0] ,net0558[1] } ),
     .out21           (net1130 ),
     .out20           (net1296 ),
     .out19           (net1128 ),
     .out18           (net1294 ),
     .out17           (net1293 ),
     .out16           (net1125 ),
     .out15           (net1291 ),
     .out12           (net1121 ),
     .out8            (net1284 ),
     .out6            (net1115 ),
     .out5            (net1281 ),
     .out3            (net1279 ),
     .out2            (net1278 ),
     .in21            (net1004 ),
     .in20            (net1003 ),
     .in19            (net1002 ),
     .in18            (net1001 ),
     .in17            (net1171 ),
     .in16            (net999 ),
     .in15            (net0552 ),
     .in12            (net0555 ),
     .out0            (net1104 ),
     .in22            (net0640 ),
     .out22           (net0544 ),
     .in24            (net0543 ),
     .out24           (net0639 ),
     .vdd18           (vdd_h ),
     .in2             (net0564 ),
     .in5             (net0561 ),
     .out11           (net1287 ),
     .in3             (net0563 ),
     .in11            (net0556 ),
     .in0             (net0566 ),
     .in6             (net0560 ),
     .in8             (net0559 ) );
bw_io_ddr_rptr_b I279 (
     .out14           ({net1106[0] ,net1106[1] ,net1106[2] ,net1106[3] ,
            net1106[4] ,net1106[5] ,net1106[6] ,net1106[7] } ),
     .out13           ({net1107[0] ,net1107[1] ,net1107[2] ,net1107[3] ,
            net1107[4] ,net1107[5] ,net1107[6] ,net1107[7] } ),
     .out10           ({net964[0] ,net964[1] } ),
     .out9            ({net966[0] ,net966[1] } ),
     .out4            ({net1136[0] ,net1136[1] } ),
     .in14            ({net1145[0] ,net1145[1] ,net1145[2] ,net1145[3] ,
            net1145[4] ,net1145[5] ,net1145[6] ,net1145[7] } ),
     .in13            ({net981[0] ,net981[1] ,net981[2] ,net981[3] ,
            net981[4] ,net981[5] ,net981[6] ,net981[7] } ),
     .out1            ({net977[0] ,net977[1] ,net977[2] ,net977[3] ,
            net977[4] } ),
     .in10            ({net1264[0] ,net1264[1] } ),
     .out25           ({net0895[0] ,net0895[1] ,net0895[2] ,net0895[3] ,
            net0895[4] ,net0895[5] ,net0895[6] ,net0895[7] } ),
     .in25            ({net0648[0] ,net0648[1] ,net0648[2] ,net0648[3] ,
            net0648[4] ,net0648[5] ,net0648[6] ,net0648[7] } ),
     .in1             ({net1103[0] ,net1103[1] ,net1103[2] ,net1103[3] ,
            net1103[4] } ),
     .in4             ({net1097[0] ,net1097[1] } ),
     .in9             ({net1090[0] ,net1090[1] } ),
     .out21           (net983 ),
     .out20           (net982 ),
     .out19           (net1151 ),
     .out18           (net1150 ),
     .out17           (net1149 ),
     .out16           (net963 ),
     .out15           (net971 ),
     .out12           (net1144 ),
     .out8            (net974 ),
     .out6            (net968 ),
     .out5            (net1137 ),
     .out3            (net967 ),
     .out2            (net1134 ),
     .in21            (net1027 ),
     .in20            (net858 ),
     .in19            (net1025 ),
     .in18            (net837 ),
     .in17            (net1023 ),
     .in16            (net839 ),
     .in15            (net1096 ),
     .in12            (net1266 ),
     .out0            (net973 ),
     .in22            (net0832 ),
     .out22           (net0592 ),
     .in24            (net0591 ),
     .out24           (net0831 ),
     .vdd18           (vdd_h ),
     .in2             (net1101 ),
     .in5             (net1259 ),
     .out11           (net1143 ),
     .in3             (net1257 ),
     .in11            (net1089 ),
     .in0             (net1254 ),
     .in6             (net1260 ),
     .in8             (net1100 ) );
bw_io_ddr_6sig_x2_async I181 (
     .serial_out      ({serial_out[143:136] } ),
     .serial_in       ({serial_in[143:136] } ),
     .afo             ({afo[143:136] } ),
     .afi             ({afi[143:136] } ),
     .vrefcode_i_l    ({net0974[0] ,net0974[1] ,net0974[2] ,net0974[3] ,
            net0974[4] ,net0974[5] ,net0974[6] ,net0974[7] } ),
     .vrefcode_i_r    ({net0945[0] ,net0945[1] ,net0945[2] ,net0945[3] ,
            net0945[4] ,net0945[5] ,net0945[6] ,net0945[7] } ),
     .dq_pad          ({dram_cb } ),
     .io_dram_data_in ({io_dram_ecc_in__15__ ,io_dram_ecc_in__14__ ,
            io_dram_ecc_in__13__ ,io_dram_ecc_in__12__ ,
            io_dram_ecc_in__11__ ,io_dram_ecc_in__10__ ,io_dram_ecc_in__9__
             ,io_dram_ecc_in__8__ } ),
     .io_dram_data_in_hi ({io_dram_ecc_in__31__ ,io_dram_ecc_in__30__ ,
            io_dram_ecc_in__29__ ,io_dram_ecc_in__28__ ,
            io_dram_ecc_in__27__ ,io_dram_ecc_in__26__ ,
            io_dram_ecc_in__25__ ,io_dram_ecc_in__24__ } ),
     .data_neg        ({dram_io_data_out__287__ ,dram_io_data_out__286__ ,
            dram_io_data_out__285__ ,dram_io_data_out__284__ ,
            dram_io_data_out__283__ ,dram_io_data_out__282__ ,
            dram_io_data_out__281__ ,dram_io_data_out__280__ } ),
     .data_pos        ({dram_io_data_out__143__ ,dram_io_data_out__142__ ,
            dram_io_data_out__141__ ,dram_io_data_out__140__ ,
            dram_io_data_out__139__ ,dram_io_data_out__138__ ,
            dram_io_data_out__137__ ,dram_io_data_out__136__ } ),
     .dqs_pad         ({dram_dqs__35__ ,dram_dqs__26__ } ),
     .lpf_code_i_r    ({net0399[0] ,net0399[1] ,net0399[2] ,net0399[3] ,
            net0399[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net0402[0] ,net0402[1] } ),
     .pad_pos_cnt_i_r ({net0407[0] ,net0407[1] } ),
     .pad_neg_cnt_i_r ({net0408[0] ,net0408[1] } ),
     .cbu_i_r         ({cbu_i_r } ),
     .cbd_i_r         ({cbd_i_r } ),
     .lpf_code_i_l    ({net0390[0] ,net0390[1] ,net0390[2] ,net0390[3] ,
            net0390[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net0381[0] ,net0381[1] } ),
     .pad_pos_cnt_i_l ({net0373[0] ,net0373[1] } ),
     .pad_neg_cnt_i_l ({net0371[0] ,net0371[1] } ),
     .cbu_i_l         ({cbu_i_l } ),
     .cbd_i_l         ({cbd_i_l } ),
     .ps_select_i_l   (ps_select_i_l ),
     .testmode_l_i_l  (net0387 ),
     .test_mode_i_l   (net0879 ),
     .testmode_l_i_r  (net0406 ),
     .test_mode_i_r   (net0884 ),
     .pad_clk_so      (pad_clk_so ),
     .async_pad_0     (spare_ddr_pin[1] ),
     .async_pad_1     (spare_ddr_pin[0] ),
     .ps_select_i_r   (ps_select_i_r ),
     .bso             (bso ),
     .ctl_data_0      (spare_ddr_data[1] ),
     .pad_clk_si      (pad_clk_so3_si4 ),
     .bypass_enable_i_l (bypass_enable_i_l ),
     .vdd_h           (vdd_h ),
     .strobe_i_r      (net0393 ),
     .burst_length_four_i_r (net0401 ),
     .dram_io_pad_enable_i_r (net0403 ),
     .dram_io_drive_enable_i_r (net0404 ),
     .rst_l_i_r       (net0400 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net0409 ),
     .dram_io_drive_data_i_r (net0410 ),
     .se_i_r          (net0413 ),
     .mode_ctrl_i_r   (mode_ctrl_i_r ),
     .shift_dr_i_r    (shift_dr_i_r ),
     .clock_dr_i_r    (clock_dr_i_r ),
     .hiz_n_i_r       (hiz_n_i_r ),
     .update_dr_i_r   (update_dr_i_r ),
     .strobe_i_l      (net0386 ),
     .burst_length_four_i_l (net0374 ),
     .dram_io_pad_enable_i_l (net0389 ),
     .dram_io_drive_enable_i_l (dram_io_drive_enable_o_l ),
     .ctl_data_1      (spare_ddr_data[0] ),
     .rst_l_i_l       (net0388 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net0372 ),
     .dram_io_drive_data_i_l (net0377 ),
     .se_i_l          (se_o_l ),
     .mode_ctrl_i_l   (mode_ctrl_i_l ),
     .shift_dr_i_l    (shift_dr_i_l ),
     .clock_dr_i_l    (clock_dr_i_l ),
     .hiz_n_i_l       (hiz_n_i_l ),
     .update_dr_i_l   (update_dr_i_l ),
     .rclk            (rclk ),
     .bypass_enable_i_r (bypass_enable_i_r ),
     .bsi             (bso3_bsi4 ) );
bw_io_ddr_rptr_b I280 (
     .out14           ({net1122[0] ,net1122[1] ,net1122[2] ,net1122[3] ,
            net1122[4] ,net1122[5] ,net1122[6] ,net1122[7] } ),
     .out13           ({net1290[0] ,net1290[1] ,net1290[2] ,net1290[3] ,
            net1290[4] ,net1290[5] ,net1290[6] ,net1290[7] } ),
     .out10           ({net1164[0] ,net1164[1] } ),
     .out9            ({net1163[0] ,net1163[1] } ),
     .out4            ({net1158[0] ,net1158[1] } ),
     .in14            ({net1167[0] ,net1167[1] ,net1167[2] ,net1167[3] ,
            net1167[4] ,net1167[5] ,net1167[6] ,net1167[7] } ),
     .in13            ({net997[0] ,net997[1] ,net997[2] ,net997[3] ,
            net997[4] ,net997[5] ,net997[6] ,net997[7] } ),
     .out1            ({net1155[0] ,net1155[1] ,net1155[2] ,net1155[3] ,
            net1155[4] } ),
     .in10            ({net1286[0] ,net1286[1] } ),
     .out25           ({net0844[0] ,net0844[1] ,net0844[2] ,net0844[3] ,
            net0844[4] ,net0844[5] ,net0844[6] ,net0844[7] } ),
     .in25            ({net0699[0] ,net0699[1] ,net0699[2] ,net0699[3] ,
            net0699[4] ,net0699[5] ,net0699[6] ,net0699[7] } ),
     .in1             ({net1277[0] ,net1277[1] ,net1277[2] ,net1277[3] ,
            net1277[4] } ),
     .in4             ({net1280[0] ,net1280[1] } ),
     .in9             ({net1118[0] ,net1118[1] } ),
     .out21           (net1004 ),
     .out20           (net1003 ),
     .out19           (net1002 ),
     .out18           (net1001 ),
     .out17           (net1171 ),
     .out16           (net999 ),
     .out15           (net1169 ),
     .out12           (net1166 ),
     .out8            (net991 ),
     .out6            (net1160 ),
     .out5            (net1159 ),
     .out3            (net1157 ),
     .out2            (net1156 ),
     .in21            (net1049 ),
     .in20            (net879 ),
     .in19            (net1047 ),
     .in18            (net1046 ),
     .in17            (net1045 ),
     .in16            (net875 ),
     .in15            (net1291 ),
     .in12            (net1121 ),
     .out0            (net1154 ),
     .in22            (net0736 ),
     .out22           (net0640 ),
     .in24            (net0639 ),
     .out24           (net0735 ),
     .vdd18           (vdd_h ),
     .in2             (net1278 ),
     .in5             (net1281 ),
     .out11           (net994 ),
     .in3             (net1279 ),
     .in11            (net1287 ),
     .in0             (net1104 ),
     .in6             (net1115 ),
     .in8             (net1284 ) );
bw_io_ddr_rptr_b I281 (
     .out14           ({net1145[0] ,net1145[1] ,net1145[2] ,net1145[3] ,
            net1145[4] ,net1145[5] ,net1145[6] ,net1145[7] } ),
     .out13           ({net981[0] ,net981[1] ,net981[2] ,net981[3] ,
            net981[4] ,net981[5] ,net981[6] ,net981[7] } ),
     .out10           ({net1016[0] ,net1016[1] } ),
     .out9            ({net1015[0] ,net1015[1] } ),
     .out4            ({net848[0] ,net848[1] } ),
     .in14            ({net856[0] ,net856[1] ,net856[2] ,net856[3] ,
            net856[4] ,net856[5] ,net856[6] ,net856[7] } ),
     .in13            ({net857[0] ,net857[1] ,net857[2] ,net857[3] ,
            net857[4] ,net857[5] ,net857[6] ,net857[7] } ),
     .out1            ({net1007[0] ,net1007[1] ,net1007[2] ,net1007[3] ,
            net1007[4] } ),
     .in10            ({net964[0] ,net964[1] } ),
     .out25           ({net0742[0] ,net0742[1] ,net0742[2] ,net0742[3] ,
            net0742[4] ,net0742[5] ,net0742[6] ,net0742[7] } ),
     .in25            ({net0895[0] ,net0895[1] ,net0895[2] ,net0895[3] ,
            net0895[4] ,net0895[5] ,net0895[6] ,net0895[7] } ),
     .in1             ({net977[0] ,net977[1] ,net977[2] ,net977[3] ,
            net977[4] } ),
     .in4             ({net1136[0] ,net1136[1] } ),
     .in9             ({net966[0] ,net966[1] } ),
     .out21           (net1027 ),
     .out20           (net858 ),
     .out19           (net1025 ),
     .out18           (net837 ),
     .out17           (net1023 ),
     .out16           (net839 ),
     .out15           (net847 ),
     .out12           (net846 ),
     .out8            (net850 ),
     .out6            (net844 ),
     .out5            (net852 ),
     .out3            (net843 ),
     .out2            (net1008 ),
     .in21            (net0398 ),
     .in20            (net0397 ),
     .in19            (net0369 ),
     .in18            (net0368 ),
     .in17            (net0394 ),
     .in16            (net0370 ),
     .in15            (net971 ),
     .in12            (net1144 ),
     .out0            (net1006 ),
     .in22            (net0688 ),
     .out22           (net0832 ),
     .in24            (net0831 ),
     .out24           (net0687 ),
     .vdd18           (vdd_h ),
     .in2             (net1134 ),
     .in5             (net1137 ),
     .out11           (net1017 ),
     .in3             (net967 ),
     .in11            (net1143 ),
     .in0             (net973 ),
     .in6             (net968 ),
     .in8             (net974 ) );
bw_io_ddr_rptr_b I282 (
     .out14           ({net1167[0] ,net1167[1] ,net1167[2] ,net1167[3] ,
            net1167[4] ,net1167[5] ,net1167[6] ,net1167[7] } ),
     .out13           ({net997[0] ,net997[1] ,net997[2] ,net997[3] ,
            net997[4] ,net997[5] ,net997[6] ,net997[7] } ),
     .out10           ({net1038[0] ,net1038[1] } ),
     .out9            ({net868[0] ,net868[1] } ),
     .out4            ({net863[0] ,net863[1] } ),
     .in14            ({net872[0] ,net872[1] ,net872[2] ,net872[3] ,
            net872[4] ,net872[5] ,net872[6] ,net872[7] } ),
     .in13            ({net1042[0] ,net1042[1] ,net1042[2] ,net1042[3] ,
            net1042[4] ,net1042[5] ,net1042[6] ,net1042[7] } ),
     .out1            ({net1029[0] ,net1029[1] ,net1029[2] ,net1029[3] ,
            net1029[4] } ),
     .in10            ({net1164[0] ,net1164[1] } ),
     .out25           ({net0845[0] ,net0845[1] ,net0845[2] ,net0845[3] ,
            net0845[4] ,net0845[5] ,net0845[6] ,net0845[7] } ),
     .in25            ({net0844[0] ,net0844[1] ,net0844[2] ,net0844[3] ,
            net0844[4] ,net0844[5] ,net0844[6] ,net0844[7] } ),
     .in1             ({net1155[0] ,net1155[1] ,net1155[2] ,net1155[3] ,
            net1155[4] } ),
     .in4             ({net1158[0] ,net1158[1] } ),
     .in9             ({net1163[0] ,net1163[1] } ),
     .out21           (net1049 ),
     .out20           (net879 ),
     .out19           (net1047 ),
     .out18           (net1046 ),
     .out17           (net1045 ),
     .out16           (net875 ),
     .out15           (net1043 ),
     .out12           (net871 ),
     .out8            (net1036 ),
     .out6            (net865 ),
     .out5            (net1033 ),
     .out3            (net862 ),
     .out2            (net1030 ),
     .in21            (net0419 ),
     .in20            (net0418 ),
     .in19            (net0417 ),
     .in18            (net0416 ),
     .in17            (net0415 ),
     .in16            (net0414 ),
     .in15            (net1169 ),
     .in12            (net1166 ),
     .out0            (net1028 ),
     .in22            (net0784 ),
     .out22           (net0736 ),
     .in24            (net0735 ),
     .out24           (net0783 ),
     .vdd18           (vdd_h ),
     .in2             (net1156 ),
     .in5             (net1159 ),
     .out11           (net870 ),
     .in3             (net1157 ),
     .in11            (net994 ),
     .in0             (net1154 ),
     .in6             (net1160 ),
     .in8             (net991 ) );
bw_io_ddr_rptr_b I283 (
     .out14           ({net856[0] ,net856[1] ,net856[2] ,net856[3] ,
            net856[4] ,net856[5] ,net856[6] ,net856[7] } ),
     .out13           ({net857[0] ,net857[1] ,net857[2] ,net857[3] ,
            net857[4] ,net857[5] ,net857[6] ,net857[7] } ),
     .out10           ({net0371[0] ,net0371[1] } ),
     .out9            ({net0373[0] ,net0373[1] } ),
     .out4            ({net0381[0] ,net0381[1] } ),
     .in14            ({cbd_i_l } ),
     .in13            ({cbu_i_l } ),
     .out1            ({net0390[0] ,net0390[1] ,net0390[2] ,net0390[3] ,
            net0390[4] } ),
     .in10            ({net1016[0] ,net1016[1] } ),
     .out25           ({net0974[0] ,net0974[1] ,net0974[2] ,net0974[3] ,
            net0974[4] ,net0974[5] ,net0974[6] ,net0974[7] } ),
     .in25            ({net0742[0] ,net0742[1] ,net0742[2] ,net0742[3] ,
            net0742[4] ,net0742[5] ,net0742[6] ,net0742[7] } ),
     .in1             ({net1007[0] ,net1007[1] ,net1007[2] ,net1007[3] ,
            net1007[4] } ),
     .in4             ({net848[0] ,net848[1] } ),
     .in9             ({net1015[0] ,net1015[1] } ),
     .out21           (net0398 ),
     .out20           (net0397 ),
     .out19           (net0369 ),
     .out18           (net0368 ),
     .out17           (net0394 ),
     .out16           (net0370 ),
     .out15           (se_o_l ),
     .out12           (net0377 ),
     .out8            (net0387 ),
     .out6            (dram_io_drive_enable_o_l ),
     .out5            (net0389 ),
     .out3            (net0374 ),
     .out2            (net0388 ),
     .in21            (bypass_enable_i_l ),
     .in20            (hiz_n_i_l ),
     .in19            (clock_dr_i_l ),
     .in18            (shift_dr_i_l ),
     .in17            (update_dr_i_l ),
     .in16            (mode_ctrl_i_l ),
     .in15            (net847 ),
     .in12            (net846 ),
     .out0            (net0386 ),
     .in22            (ps_select_i_l ),
     .out22           (net0688 ),
     .in24            (net0687 ),
     .out24           (net0879 ),
     .vdd18           (vdd_h ),
     .in2             (net1008 ),
     .in5             (net852 ),
     .out11           (net0372 ),
     .in3             (net843 ),
     .in11            (net1017 ),
     .in0             (net1006 ),
     .in6             (net844 ),
     .in8             (net850 ) );
bw_io_ddr_rptr_b I284 (
     .out14           ({net872[0] ,net872[1] ,net872[2] ,net872[3] ,
            net872[4] ,net872[5] ,net872[6] ,net872[7] } ),
     .out13           ({net1042[0] ,net1042[1] ,net1042[2] ,net1042[3] ,
            net1042[4] ,net1042[5] ,net1042[6] ,net1042[7] } ),
     .out10           ({net0408[0] ,net0408[1] } ),
     .out9            ({net0407[0] ,net0407[1] } ),
     .out4            ({net0402[0] ,net0402[1] } ),
     .in14            ({cbd_i_r } ),
     .in13            ({cbu_i_r } ),
     .out1            ({net0399[0] ,net0399[1] ,net0399[2] ,net0399[3] ,
            net0399[4] } ),
     .in10            ({net1038[0] ,net1038[1] } ),
     .out25           ({net0945[0] ,net0945[1] ,net0945[2] ,net0945[3] ,
            net0945[4] ,net0945[5] ,net0945[6] ,net0945[7] } ),
     .in25            ({net0845[0] ,net0845[1] ,net0845[2] ,net0845[3] ,
            net0845[4] ,net0845[5] ,net0845[6] ,net0845[7] } ),
     .in1             ({net1029[0] ,net1029[1] ,net1029[2] ,net1029[3] ,
            net1029[4] } ),
     .in4             ({net863[0] ,net863[1] } ),
     .in9             ({net868[0] ,net868[1] } ),
     .out21           (net0419 ),
     .out20           (net0418 ),
     .out19           (net0417 ),
     .out18           (net0416 ),
     .out17           (net0415 ),
     .out16           (net0414 ),
     .out15           (net0413 ),
     .out12           (net0410 ),
     .out8            (net0406 ),
     .out6            (net0404 ),
     .out5            (net0403 ),
     .out3            (net0401 ),
     .out2            (net0400 ),
     .in21            (bypass_enable_i_r ),
     .in20            (hiz_n_i_r ),
     .in19            (clock_dr_i_r ),
     .in18            (shift_dr_i_r ),
     .in17            (update_dr_i_r ),
     .in16            (mode_ctrl_i_r ),
     .in15            (net1043 ),
     .in12            (net871 ),
     .out0            (net0393 ),
     .in22            (ps_select_i_r ),
     .out22           (net0784 ),
     .in24            (net0783 ),
     .out24           (net0884 ),
     .vdd18           (vdd_h ),
     .in2             (net1030 ),
     .in5             (net1033 ),
     .out11           (net0409 ),
     .in3             (net862 ),
     .in11            (net870 ),
     .in0             (net1028 ),
     .in6             (net865 ),
     .in8             (net1036 ) );
assign arst_l_out = arst_l_i_l;
endmodule
