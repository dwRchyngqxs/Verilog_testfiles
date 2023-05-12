// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_io_ddr_sig_top_b.v
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
module bw_io_ddr_sig_top_b(se_o_l ,dram_io_drive_enable_o_l ,
     vrefcode_i_l ,vrefcode_i_r ,afo ,mode_ctrl_out ,update_dr_out ,
     shift_dr_out ,clock_dr_out ,hiz_n_out ,bypass_enable_out ,
     ps_select_out ,serial_in ,serial_out ,afi ,test_mode_i_r ,cbu_o_l ,
     cbd_o_l ,strobe_i_r ,lpf_code_i_r ,testmode_l_i_l ,
     burst_length_four_i_r ,dram_io_ptr_clk_inv_i_r ,
     dram_io_pad_enable_i_r ,dram_io_drive_enable_i_r ,rst_l_i_r , arst_l_i_r,
     pad_pos_cnt_i_r ,pad_neg_cnt_i_r ,dram_io_channel_disabled_i_r ,
     dram_io_drive_data_i_r ,cbu_i_r ,cbd_i_r ,cbu_o_r ,se_i_r ,
     mode_ctrl_i_r ,shift_dr_i_r ,clock_dr_i_r ,hiz_n_i_r ,update_dr_i_r
      ,cbd_o_r ,spare_ddr_data ,vdd_h ,strobe_i_l ,bypass_enable_i_l ,
     ps_select_i_r ,ps_select_i_l ,test_mode_i_l ,testmode_l_i_r ,
     lpf_code_i_l ,dram_io_pad_enable_i_l ,dram_io_ptr_clk_inv_i_l ,
     burst_length_four_i_l ,dram_io_data_out__95__ ,dram_io_data_out__94__
      ,dram_io_data_out__93__ ,dram_io_data_out__92__ ,
     dram_io_data_out__91__ ,dram_io_data_out__90__ ,dram_io_data_out__89__
      ,dram_io_data_out__88__ ,dram_io_data_out__87__ ,
     dram_io_data_out__86__ ,dram_io_data_out__85__ ,dram_io_data_out__84__
      ,dram_io_data_out__83__ ,dram_io_data_out__82__ ,
     dram_io_data_out__81__ ,dram_io_data_out__80__ ,dram_io_data_out__79__
      ,dram_io_data_out__78__ ,dram_io_data_out__77__ ,
     dram_io_data_out__76__ ,dram_io_data_out__75__ ,dram_io_data_out__74__
      ,dram_io_data_out__73__ ,dram_io_data_out__72__ ,
     dram_io_data_out__71__ ,dram_io_data_out__70__ ,dram_io_data_out__69__
      ,dram_io_data_out__68__ ,dram_io_data_out__67__ ,
     dram_io_data_out__66__ ,dram_io_data_out__65__ ,dram_io_data_out__64__
      ,dram_io_data_out__31__ ,dram_io_data_out__30__ ,
     dram_io_data_out__29__ ,dram_io_data_out__28__ ,dram_io_data_out__27__
      ,dram_io_data_out__26__ ,dram_io_data_out__25__ ,
     dram_io_data_out__24__ ,dram_io_data_out__23__ ,dram_io_data_out__22__
      ,dram_io_data_out__21__ ,dram_io_data_out__20__ ,
     dram_io_data_out__19__ ,dram_io_data_out__18__ ,dram_io_data_out__17__
      ,dram_io_data_out__16__ ,dram_io_data_out__15__ ,
     dram_io_data_out__14__ ,dram_io_data_out__13__ ,dram_io_data_out__12__
      ,dram_io_data_out__11__ ,dram_io_data_out__10__ ,
     dram_io_data_out__9__ ,dram_io_data_out__8__ ,dram_io_data_out__7__ ,
     dram_io_data_out__6__ ,dram_io_data_out__5__ ,dram_io_data_out__4__ ,
     dram_io_data_out__3__ ,dram_io_data_out__2__ ,dram_io_data_out__1__ ,
     dram_io_data_out__0__ ,dram_io_channel_disabled_i_l ,cbd_i_l ,
     dram_io_drive_enable_i_l ,rclk ,dram_io_data_out__175__ ,
     dram_io_data_out__174__ ,dram_io_data_out__173__ ,
     dram_io_data_out__172__ ,dram_io_data_out__171__ ,
     dram_io_data_out__170__ ,dram_io_data_out__169__ ,
     dram_io_data_out__168__ ,dram_io_data_out__167__ ,
     dram_io_data_out__166__ ,dram_io_data_out__165__ ,
     dram_io_data_out__164__ ,dram_io_data_out__163__ ,
     dram_io_data_out__162__ ,dram_io_data_out__161__ ,
     dram_io_data_out__160__ ,dram_io_data_out__159__ ,
     dram_io_data_out__158__ ,dram_io_data_out__157__ ,
     dram_io_data_out__156__ ,dram_io_data_out__155__ ,
     dram_io_data_out__154__ ,dram_io_data_out__153__ ,
     dram_io_data_out__152__ ,dram_io_data_out__151__ ,
     dram_io_data_out__150__ ,dram_io_data_out__149__ ,
     dram_io_data_out__148__ ,dram_io_data_out__147__ ,
     dram_io_data_out__146__ ,dram_io_data_out__145__ ,
     dram_io_data_out__144__ ,dram_io_data_out__279__ ,
     dram_io_data_out__278__ ,dram_io_data_out__277__ ,
     dram_io_data_out__276__ ,dram_io_data_out__275__ ,
     dram_io_data_out__274__ ,dram_io_data_out__273__ ,
     dram_io_data_out__272__ ,io_dram_data_in__223__ ,
     io_dram_data_in__222__ ,io_dram_data_in__221__ ,io_dram_data_in__220__
      ,io_dram_data_in__219__ ,io_dram_data_in__218__ ,
     io_dram_data_in__217__ ,io_dram_data_in__216__ ,io_dram_data_in__215__
      ,io_dram_data_in__214__ ,io_dram_data_in__213__ ,
     io_dram_data_in__212__ ,io_dram_data_in__211__ ,io_dram_data_in__210__
      ,io_dram_data_in__209__ ,io_dram_data_in__208__ ,
     io_dram_data_in__207__ ,io_dram_data_in__206__ ,io_dram_data_in__205__
      ,io_dram_data_in__204__ ,io_dram_data_in__203__ ,
     io_dram_data_in__202__ ,io_dram_data_in__201__ ,io_dram_data_in__200__
      ,io_dram_data_in__199__ ,io_dram_data_in__198__ ,
     io_dram_data_in__197__ ,io_dram_data_in__196__ ,io_dram_data_in__195__
      ,io_dram_data_in__194__ ,io_dram_data_in__193__ ,
     io_dram_data_in__192__ ,dram_io_data_out__135__ ,
     dram_io_data_out__134__ ,dram_io_data_out__133__ ,
     dram_io_data_out__132__ ,dram_io_data_out__131__ ,
     dram_io_data_out__130__ ,dram_io_data_out__129__ ,
     dram_io_data_out__128__ ,io_dram_ecc_in__23__ ,io_dram_ecc_in__22__ ,
     io_dram_ecc_in__21__ ,io_dram_ecc_in__20__ ,io_dram_ecc_in__19__ ,
     io_dram_ecc_in__18__ ,io_dram_ecc_in__17__ ,io_dram_ecc_in__16__ ,
     io_dram_ecc_in__7__ ,io_dram_ecc_in__6__ ,io_dram_ecc_in__5__ ,
     io_dram_ecc_in__4__ ,io_dram_ecc_in__3__ ,io_dram_ecc_in__2__ ,
     io_dram_ecc_in__1__ ,io_dram_ecc_in__0__ ,io_dram_data_in__159__ ,
     io_dram_data_in__158__ ,io_dram_data_in__157__ ,io_dram_data_in__156__
      ,io_dram_data_in__155__ ,io_dram_data_in__154__ ,
     io_dram_data_in__153__ ,io_dram_data_in__152__ ,io_dram_data_in__151__
      ,io_dram_data_in__150__ ,io_dram_data_in__149__ ,
     io_dram_data_in__148__ ,io_dram_data_in__147__ ,io_dram_data_in__146__
      ,io_dram_data_in__145__ ,io_dram_data_in__144__ ,
     io_dram_data_in__143__ ,io_dram_data_in__142__ ,io_dram_data_in__141__
      ,io_dram_data_in__140__ ,io_dram_data_in__139__ ,
     io_dram_data_in__138__ ,io_dram_data_in__137__ ,io_dram_data_in__136__
      ,io_dram_data_in__135__ ,io_dram_data_in__134__ ,
     io_dram_data_in__133__ ,io_dram_data_in__132__ ,io_dram_data_in__131__
      ,io_dram_data_in__130__ ,io_dram_data_in__129__ ,
     io_dram_data_in__128__ ,io_dram_data_in__31__ ,io_dram_data_in__30__ ,
     io_dram_data_in__29__ ,io_dram_data_in__28__ ,io_dram_data_in__27__ ,
     io_dram_data_in__26__ ,io_dram_data_in__25__ ,io_dram_data_in__24__ ,
     io_dram_data_in__23__ ,io_dram_data_in__22__ ,io_dram_data_in__21__ ,
     io_dram_data_in__20__ ,io_dram_data_in__19__ ,io_dram_data_in__18__ ,
     io_dram_data_in__17__ ,io_dram_data_in__16__ ,io_dram_data_in__15__ ,
     io_dram_data_in__14__ ,io_dram_data_in__13__ ,io_dram_data_in__12__ ,
     io_dram_data_in__11__ ,io_dram_data_in__10__ ,io_dram_data_in__9__ ,
     io_dram_data_in__8__ ,io_dram_data_in__7__ ,io_dram_data_in__6__ ,
     io_dram_data_in__5__ ,io_dram_data_in__4__ ,io_dram_data_in__3__ ,
     io_dram_data_in__2__ ,io_dram_data_in__1__ ,io_dram_data_in__0__ ,
     pad_clk_so ,pad_clk_si ,dram_addr__9__ ,dram_addr__8__ ,dram_addr__7__
      ,dram_addr__6__ ,dram_addr__5__ ,dram_addr__4__ ,dram_addr__3__ ,
     dram_addr__2__ ,dram_addr__1__ ,dram_addr__0__ ,dram_io_addr__9__ ,
     dram_io_addr__8__ ,dram_io_addr__7__ ,dram_io_addr__6__ ,
     dram_io_addr__5__ ,dram_io_addr__4__ ,dram_io_addr__3__ ,
     dram_io_addr__2__ ,dram_io_addr__1__ ,dram_io_addr__0__ ,dram_dqs__12__
      ,dram_dqs__11__ ,dram_dqs__10__ ,dram_dqs__9__ ,dram_dqs__8__ ,bso ,
     spare_ddr_pin ,bsi ,dram_io_clk_enable ,dram_ck_n ,dram_ck_p ,
     dram_io_bank ,dram_addr__14__ ,dram_addr__13__ ,dram_addr__12__ ,
     dram_addr__11__ ,dram_cke ,dram_ba ,dram_io_cke ,dram_io_addr__14__ ,
     dram_io_addr__13__ ,dram_io_addr__12__ ,dram_io_addr__11__ ,
     dram_dq__95__ ,dram_dq__94__ ,dram_dq__93__ ,dram_dq__92__ ,
     dram_dq__91__ ,dram_dq__90__ ,dram_dq__89__ ,dram_dq__88__ ,
     dram_dq__87__ ,dram_dq__86__ ,dram_dq__85__ ,dram_dq__84__ ,
     dram_dq__83__ ,dram_dq__82__ ,dram_dq__81__ ,dram_dq__80__ ,
     dram_dq__79__ ,dram_dq__78__ ,dram_dq__77__ ,dram_dq__76__ ,
     dram_dq__75__ ,dram_dq__74__ ,dram_dq__73__ ,dram_dq__72__ ,
     dram_dq__71__ ,dram_dq__70__ ,dram_dq__69__ ,dram_dq__68__ ,
     dram_dq__67__ ,dram_dq__66__ ,dram_dq__65__ ,dram_dq__64__ ,
     dram_dq__31__ ,dram_dq__30__ ,dram_dq__29__ ,dram_dq__28__ ,
     dram_dq__27__ ,dram_dq__26__ ,dram_dq__25__ ,dram_dq__24__ ,
     dram_dq__23__ ,dram_dq__22__ ,dram_dq__21__ ,dram_dq__20__ ,
     dram_dq__19__ ,dram_dq__18__ ,dram_dq__17__ ,dram_dq__16__ ,
     dram_dq__15__ ,dram_dq__14__ ,dram_dq__13__ ,dram_dq__12__ ,
     dram_dq__11__ ,dram_dq__10__ ,dram_dq__9__ ,dram_dq__8__ ,dram_dq__7__ ,
     dram_dq__6__ ,dram_dq__5__ ,dram_dq__4__ ,dram_dq__3__ ,dram_dq__2__ ,
     dram_dq__1__ ,dram_dq__0__ ,dram_dqs__3__ ,dram_dqs__2__ ,dram_dqs__1__
      ,dram_dqs__0__ ,dram_dqs__21__ ,dram_dqs__20__ ,dram_dqs__19__ ,
     dram_dqs__18__ ,dram_dqs__17__ ,dram_dqs__30__ ,dram_dqs__29__ ,
     dram_dqs__28__ ,dram_dqs__27__ ,pad_neg_cnt_i_l ,rst_l_i_l , arst_l_i_l,
     bypass_enable_i_r ,hiz_n_i_l ,cbu_i_l ,shift_dr_i_l ,mode_ctrl_i_l
      ,dram_cb ,dram_io_drive_data_i_l ,se_i_l ,pad_pos_cnt_i_l ,
     update_dr_i_l ,clock_dr_i_l ,io_dram_data_in__95__ ,
     io_dram_data_in__94__ ,io_dram_data_in__93__ ,io_dram_data_in__92__ ,
     io_dram_data_in__91__ ,io_dram_data_in__90__ ,io_dram_data_in__89__ ,
     io_dram_data_in__88__ ,io_dram_data_in__87__ ,io_dram_data_in__86__ ,
     io_dram_data_in__85__ ,io_dram_data_in__84__ ,io_dram_data_in__83__ ,
     io_dram_data_in__82__ ,io_dram_data_in__81__ ,io_dram_data_in__80__ ,
     io_dram_data_in__79__ ,io_dram_data_in__78__ ,io_dram_data_in__77__ ,
     io_dram_data_in__76__ ,io_dram_data_in__75__ ,io_dram_data_in__74__ ,
     io_dram_data_in__73__ ,io_dram_data_in__72__ ,io_dram_data_in__71__ ,
     io_dram_data_in__70__ ,io_dram_data_in__69__ ,io_dram_data_in__68__ ,
     io_dram_data_in__67__ ,io_dram_data_in__66__ ,io_dram_data_in__65__ ,
     io_dram_data_in__64__ ,dram_io_data_out__239__ ,
     dram_io_data_out__238__ ,dram_io_data_out__237__ ,
     dram_io_data_out__236__ ,dram_io_data_out__235__ ,
     dram_io_data_out__234__ ,dram_io_data_out__233__ ,
     dram_io_data_out__232__ ,dram_io_data_out__231__ ,
     dram_io_data_out__230__ ,dram_io_data_out__229__ ,
     dram_io_data_out__228__ ,dram_io_data_out__227__ ,
     dram_io_data_out__226__ ,dram_io_data_out__225__ ,
     dram_io_data_out__224__ ,dram_io_data_out__223__ ,
     dram_io_data_out__222__ ,dram_io_data_out__221__ ,
     dram_io_data_out__220__ ,dram_io_data_out__219__ ,
     dram_io_data_out__218__ ,dram_io_data_out__217__ ,
     dram_io_data_out__216__ ,dram_io_data_out__215__ ,
     dram_io_data_out__214__ ,dram_io_data_out__213__ ,
     dram_io_data_out__212__ ,dram_io_data_out__211__ ,
     dram_io_data_out__210__ ,dram_io_data_out__209__ ,
     dram_io_data_out__208__ );
output [71:0]	serial_out ;
output [71:0]	afi ;
output [8:1]	cbu_o_l ;
output [8:1]	cbd_o_l ;
output [8:1]	cbu_o_r ;
output [8:1]	cbd_o_r ;
input [7:0]	vrefcode_i_l ;
input [7:0]	vrefcode_i_r ;
input [71:0]	afo ;
input [71:0]	serial_in ;
input [4:0]	lpf_code_i_r ;
input [1:0]	dram_io_ptr_clk_inv_i_r ;
input [1:0]	pad_pos_cnt_i_r ;
input [1:0]	pad_neg_cnt_i_r ;
input [8:1]	cbu_i_r ;
input [8:1]	cbd_i_r ;
input [9:8]	spare_ddr_data ;
input [4:0]	lpf_code_i_l ;
input [1:0]	dram_io_ptr_clk_inv_i_l ;
input [8:1]	cbd_i_l ;
input [2:2]	dram_io_bank ;
input [1:0]	pad_neg_cnt_i_l ;
input [8:1]	cbu_i_l ;
input [1:0]	pad_pos_cnt_i_l ;
inout [9:8]	spare_ddr_pin ;
inout [3:0]	dram_ck_n ;
inout [3:0]	dram_ck_p ;
inout [2:2]	dram_ba ;
inout [7:0]	dram_cb ;
output		se_o_l ;
output		dram_io_drive_enable_o_l ;
output		mode_ctrl_out ;
output		update_dr_out ;
output		shift_dr_out ;
output		clock_dr_out ;
output		hiz_n_out ;
output		bypass_enable_out ;
output		ps_select_out ;
output		io_dram_data_in__223__ ;
output		io_dram_data_in__222__ ;
output		io_dram_data_in__221__ ;
output		io_dram_data_in__220__ ;
output		io_dram_data_in__219__ ;
output		io_dram_data_in__218__ ;
output		io_dram_data_in__217__ ;
output		io_dram_data_in__216__ ;
output		io_dram_data_in__215__ ;
output		io_dram_data_in__214__ ;
output		io_dram_data_in__213__ ;
output		io_dram_data_in__212__ ;
output		io_dram_data_in__211__ ;
output		io_dram_data_in__210__ ;
output		io_dram_data_in__209__ ;
output		io_dram_data_in__208__ ;
output		io_dram_data_in__207__ ;
output		io_dram_data_in__206__ ;
output		io_dram_data_in__205__ ;
output		io_dram_data_in__204__ ;
output		io_dram_data_in__203__ ;
output		io_dram_data_in__202__ ;
output		io_dram_data_in__201__ ;
output		io_dram_data_in__200__ ;
output		io_dram_data_in__199__ ;
output		io_dram_data_in__198__ ;
output		io_dram_data_in__197__ ;
output		io_dram_data_in__196__ ;
output		io_dram_data_in__195__ ;
output		io_dram_data_in__194__ ;
output		io_dram_data_in__193__ ;
output		io_dram_data_in__192__ ;
output		io_dram_ecc_in__23__ ;
output		io_dram_ecc_in__22__ ;
output		io_dram_ecc_in__21__ ;
output		io_dram_ecc_in__20__ ;
output		io_dram_ecc_in__19__ ;
output		io_dram_ecc_in__18__ ;
output		io_dram_ecc_in__17__ ;
output		io_dram_ecc_in__16__ ;
output		io_dram_ecc_in__7__ ;
output		io_dram_ecc_in__6__ ;
output		io_dram_ecc_in__5__ ;
output		io_dram_ecc_in__4__ ;
output		io_dram_ecc_in__3__ ;
output		io_dram_ecc_in__2__ ;
output		io_dram_ecc_in__1__ ;
output		io_dram_ecc_in__0__ ;
output		io_dram_data_in__159__ ;
output		io_dram_data_in__158__ ;
output		io_dram_data_in__157__ ;
output		io_dram_data_in__156__ ;
output		io_dram_data_in__155__ ;
output		io_dram_data_in__154__ ;
output		io_dram_data_in__153__ ;
output		io_dram_data_in__152__ ;
output		io_dram_data_in__151__ ;
output		io_dram_data_in__150__ ;
output		io_dram_data_in__149__ ;
output		io_dram_data_in__148__ ;
output		io_dram_data_in__147__ ;
output		io_dram_data_in__146__ ;
output		io_dram_data_in__145__ ;
output		io_dram_data_in__144__ ;
output		io_dram_data_in__143__ ;
output		io_dram_data_in__142__ ;
output		io_dram_data_in__141__ ;
output		io_dram_data_in__140__ ;
output		io_dram_data_in__139__ ;
output		io_dram_data_in__138__ ;
output		io_dram_data_in__137__ ;
output		io_dram_data_in__136__ ;
output		io_dram_data_in__135__ ;
output		io_dram_data_in__134__ ;
output		io_dram_data_in__133__ ;
output		io_dram_data_in__132__ ;
output		io_dram_data_in__131__ ;
output		io_dram_data_in__130__ ;
output		io_dram_data_in__129__ ;
output		io_dram_data_in__128__ ;
output		io_dram_data_in__31__ ;
output		io_dram_data_in__30__ ;
output		io_dram_data_in__29__ ;
output		io_dram_data_in__28__ ;
output		io_dram_data_in__27__ ;
output		io_dram_data_in__26__ ;
output		io_dram_data_in__25__ ;
output		io_dram_data_in__24__ ;
output		io_dram_data_in__23__ ;
output		io_dram_data_in__22__ ;
output		io_dram_data_in__21__ ;
output		io_dram_data_in__20__ ;
output		io_dram_data_in__19__ ;
output		io_dram_data_in__18__ ;
output		io_dram_data_in__17__ ;
output		io_dram_data_in__16__ ;
output		io_dram_data_in__15__ ;
output		io_dram_data_in__14__ ;
output		io_dram_data_in__13__ ;
output		io_dram_data_in__12__ ;
output		io_dram_data_in__11__ ;
output		io_dram_data_in__10__ ;
output		io_dram_data_in__9__ ;
output		io_dram_data_in__8__ ;
output		io_dram_data_in__7__ ;
output		io_dram_data_in__6__ ;
output		io_dram_data_in__5__ ;
output		io_dram_data_in__4__ ;
output		io_dram_data_in__3__ ;
output		io_dram_data_in__2__ ;
output		io_dram_data_in__1__ ;
output		io_dram_data_in__0__ ;
output		pad_clk_so ;
output		bso ;
output		io_dram_data_in__95__ ;
output		io_dram_data_in__94__ ;
output		io_dram_data_in__93__ ;
output		io_dram_data_in__92__ ;
output		io_dram_data_in__91__ ;
output		io_dram_data_in__90__ ;
output		io_dram_data_in__89__ ;
output		io_dram_data_in__88__ ;
output		io_dram_data_in__87__ ;
output		io_dram_data_in__86__ ;
output		io_dram_data_in__85__ ;
output		io_dram_data_in__84__ ;
output		io_dram_data_in__83__ ;
output		io_dram_data_in__82__ ;
output		io_dram_data_in__81__ ;
output		io_dram_data_in__80__ ;
output		io_dram_data_in__79__ ;
output		io_dram_data_in__78__ ;
output		io_dram_data_in__77__ ;
output		io_dram_data_in__76__ ;
output		io_dram_data_in__75__ ;
output		io_dram_data_in__74__ ;
output		io_dram_data_in__73__ ;
output		io_dram_data_in__72__ ;
output		io_dram_data_in__71__ ;
output		io_dram_data_in__70__ ;
output		io_dram_data_in__69__ ;
output		io_dram_data_in__68__ ;
output		io_dram_data_in__67__ ;
output		io_dram_data_in__66__ ;
output		io_dram_data_in__65__ ;
output		io_dram_data_in__64__ ;
input		test_mode_i_r ;
input		strobe_i_r ;
input		testmode_l_i_l ;
input		burst_length_four_i_r ;
input		dram_io_pad_enable_i_r ;
input		dram_io_drive_enable_i_r ;
input		rst_l_i_r ;
input		arst_l_i_r ;
input		dram_io_channel_disabled_i_r ;
input		dram_io_drive_data_i_r ;
input		se_i_r ;
input		mode_ctrl_i_r ;
input		shift_dr_i_r ;
input		clock_dr_i_r ;
input		hiz_n_i_r ;
input		update_dr_i_r ;
input		vdd_h ;
input		strobe_i_l ;
input		bypass_enable_i_l ;
input		ps_select_i_r ;
input		ps_select_i_l ;
input		test_mode_i_l ;
input		testmode_l_i_r ;
input		dram_io_pad_enable_i_l ;
input		burst_length_four_i_l ;
input		dram_io_data_out__95__ ;
input		dram_io_data_out__94__ ;
input		dram_io_data_out__93__ ;
input		dram_io_data_out__92__ ;
input		dram_io_data_out__91__ ;
input		dram_io_data_out__90__ ;
input		dram_io_data_out__89__ ;
input		dram_io_data_out__88__ ;
input		dram_io_data_out__87__ ;
input		dram_io_data_out__86__ ;
input		dram_io_data_out__85__ ;
input		dram_io_data_out__84__ ;
input		dram_io_data_out__83__ ;
input		dram_io_data_out__82__ ;
input		dram_io_data_out__81__ ;
input		dram_io_data_out__80__ ;
input		dram_io_data_out__79__ ;
input		dram_io_data_out__78__ ;
input		dram_io_data_out__77__ ;
input		dram_io_data_out__76__ ;
input		dram_io_data_out__75__ ;
input		dram_io_data_out__74__ ;
input		dram_io_data_out__73__ ;
input		dram_io_data_out__72__ ;
input		dram_io_data_out__71__ ;
input		dram_io_data_out__70__ ;
input		dram_io_data_out__69__ ;
input		dram_io_data_out__68__ ;
input		dram_io_data_out__67__ ;
input		dram_io_data_out__66__ ;
input		dram_io_data_out__65__ ;
input		dram_io_data_out__64__ ;
input		dram_io_data_out__31__ ;
input		dram_io_data_out__30__ ;
input		dram_io_data_out__29__ ;
input		dram_io_data_out__28__ ;
input		dram_io_data_out__27__ ;
input		dram_io_data_out__26__ ;
input		dram_io_data_out__25__ ;
input		dram_io_data_out__24__ ;
input		dram_io_data_out__23__ ;
input		dram_io_data_out__22__ ;
input		dram_io_data_out__21__ ;
input		dram_io_data_out__20__ ;
input		dram_io_data_out__19__ ;
input		dram_io_data_out__18__ ;
input		dram_io_data_out__17__ ;
input		dram_io_data_out__16__ ;
input		dram_io_data_out__15__ ;
input		dram_io_data_out__14__ ;
input		dram_io_data_out__13__ ;
input		dram_io_data_out__12__ ;
input		dram_io_data_out__11__ ;
input		dram_io_data_out__10__ ;
input		dram_io_data_out__9__ ;
input		dram_io_data_out__8__ ;
input		dram_io_data_out__7__ ;
input		dram_io_data_out__6__ ;
input		dram_io_data_out__5__ ;
input		dram_io_data_out__4__ ;
input		dram_io_data_out__3__ ;
input		dram_io_data_out__2__ ;
input		dram_io_data_out__1__ ;
input		dram_io_data_out__0__ ;
input		dram_io_channel_disabled_i_l ;
input		dram_io_drive_enable_i_l ;
input		rclk ;
input		dram_io_data_out__175__ ;
input		dram_io_data_out__174__ ;
input		dram_io_data_out__173__ ;
input		dram_io_data_out__172__ ;
input		dram_io_data_out__171__ ;
input		dram_io_data_out__170__ ;
input		dram_io_data_out__169__ ;
input		dram_io_data_out__168__ ;
input		dram_io_data_out__167__ ;
input		dram_io_data_out__166__ ;
input		dram_io_data_out__165__ ;
input		dram_io_data_out__164__ ;
input		dram_io_data_out__163__ ;
input		dram_io_data_out__162__ ;
input		dram_io_data_out__161__ ;
input		dram_io_data_out__160__ ;
input		dram_io_data_out__159__ ;
input		dram_io_data_out__158__ ;
input		dram_io_data_out__157__ ;
input		dram_io_data_out__156__ ;
input		dram_io_data_out__155__ ;
input		dram_io_data_out__154__ ;
input		dram_io_data_out__153__ ;
input		dram_io_data_out__152__ ;
input		dram_io_data_out__151__ ;
input		dram_io_data_out__150__ ;
input		dram_io_data_out__149__ ;
input		dram_io_data_out__148__ ;
input		dram_io_data_out__147__ ;
input		dram_io_data_out__146__ ;
input		dram_io_data_out__145__ ;
input		dram_io_data_out__144__ ;
input		dram_io_data_out__279__ ;
input		dram_io_data_out__278__ ;
input		dram_io_data_out__277__ ;
input		dram_io_data_out__276__ ;
input		dram_io_data_out__275__ ;
input		dram_io_data_out__274__ ;
input		dram_io_data_out__273__ ;
input		dram_io_data_out__272__ ;
input		dram_io_data_out__135__ ;
input		dram_io_data_out__134__ ;
input		dram_io_data_out__133__ ;
input		dram_io_data_out__132__ ;
input		dram_io_data_out__131__ ;
input		dram_io_data_out__130__ ;
input		dram_io_data_out__129__ ;
input		dram_io_data_out__128__ ;
input		pad_clk_si ;
input		dram_io_addr__9__ ;
input		dram_io_addr__8__ ;
input		dram_io_addr__7__ ;
input		dram_io_addr__6__ ;
input		dram_io_addr__5__ ;
input		dram_io_addr__4__ ;
input		dram_io_addr__3__ ;
input		dram_io_addr__2__ ;
input		dram_io_addr__1__ ;
input		dram_io_addr__0__ ;
input		bsi ;
input		dram_io_clk_enable ;
input		dram_io_cke ;
input		dram_io_addr__14__ ;
input		dram_io_addr__13__ ;
input		dram_io_addr__12__ ;
input		dram_io_addr__11__ ;
input		rst_l_i_l ;
input		arst_l_i_l ;
input		bypass_enable_i_r ;
input		hiz_n_i_l ;
input		shift_dr_i_l ;
input		mode_ctrl_i_l ;
input		dram_io_drive_data_i_l ;
input		se_i_l ;
input		update_dr_i_l ;
input		clock_dr_i_l ;
input		dram_io_data_out__239__ ;
input		dram_io_data_out__238__ ;
input		dram_io_data_out__237__ ;
input		dram_io_data_out__236__ ;
input		dram_io_data_out__235__ ;
input		dram_io_data_out__234__ ;
input		dram_io_data_out__233__ ;
input		dram_io_data_out__232__ ;
input		dram_io_data_out__231__ ;
input		dram_io_data_out__230__ ;
input		dram_io_data_out__229__ ;
input		dram_io_data_out__228__ ;
input		dram_io_data_out__227__ ;
input		dram_io_data_out__226__ ;
input		dram_io_data_out__225__ ;
input		dram_io_data_out__224__ ;
input		dram_io_data_out__223__ ;
input		dram_io_data_out__222__ ;
input		dram_io_data_out__221__ ;
input		dram_io_data_out__220__ ;
input		dram_io_data_out__219__ ;
input		dram_io_data_out__218__ ;
input		dram_io_data_out__217__ ;
input		dram_io_data_out__216__ ;
input		dram_io_data_out__215__ ;
input		dram_io_data_out__214__ ;
input		dram_io_data_out__213__ ;
input		dram_io_data_out__212__ ;
input		dram_io_data_out__211__ ;
input		dram_io_data_out__210__ ;
input		dram_io_data_out__209__ ;
input		dram_io_data_out__208__ ;
inout		dram_addr__9__ ;
inout		dram_addr__8__ ;
inout		dram_addr__7__ ;
inout		dram_addr__6__ ;
inout		dram_addr__5__ ;
inout		dram_addr__4__ ;
inout		dram_addr__3__ ;
inout		dram_addr__2__ ;
inout		dram_addr__1__ ;
inout		dram_addr__0__ ;
inout		dram_dqs__12__ ;
inout		dram_dqs__11__ ;
inout		dram_dqs__10__ ;
inout		dram_dqs__9__ ;
inout		dram_dqs__8__ ;
inout		dram_addr__14__ ;
inout		dram_addr__13__ ;
inout		dram_addr__12__ ;
inout		dram_addr__11__ ;
inout		dram_cke ;
inout		dram_dq__95__ ;
inout		dram_dq__94__ ;
inout		dram_dq__93__ ;
inout		dram_dq__92__ ;
inout		dram_dq__91__ ;
inout		dram_dq__90__ ;
inout		dram_dq__89__ ;
inout		dram_dq__88__ ;
inout		dram_dq__87__ ;
inout		dram_dq__86__ ;
inout		dram_dq__85__ ;
inout		dram_dq__84__ ;
inout		dram_dq__83__ ;
inout		dram_dq__82__ ;
inout		dram_dq__81__ ;
inout		dram_dq__80__ ;
inout		dram_dq__79__ ;
inout		dram_dq__78__ ;
inout		dram_dq__77__ ;
inout		dram_dq__76__ ;
inout		dram_dq__75__ ;
inout		dram_dq__74__ ;
inout		dram_dq__73__ ;
inout		dram_dq__72__ ;
inout		dram_dq__71__ ;
inout		dram_dq__70__ ;
inout		dram_dq__69__ ;
inout		dram_dq__68__ ;
inout		dram_dq__67__ ;
inout		dram_dq__66__ ;
inout		dram_dq__65__ ;
inout		dram_dq__64__ ;
inout		dram_dq__31__ ;
inout		dram_dq__30__ ;
inout		dram_dq__29__ ;
inout		dram_dq__28__ ;
inout		dram_dq__27__ ;
inout		dram_dq__26__ ;
inout		dram_dq__25__ ;
inout		dram_dq__24__ ;
inout		dram_dq__23__ ;
inout		dram_dq__22__ ;
inout		dram_dq__21__ ;
inout		dram_dq__20__ ;
inout		dram_dq__19__ ;
inout		dram_dq__18__ ;
inout		dram_dq__17__ ;
inout		dram_dq__16__ ;
inout		dram_dq__15__ ;
inout		dram_dq__14__ ;
inout		dram_dq__13__ ;
inout		dram_dq__12__ ;
inout		dram_dq__11__ ;
inout		dram_dq__10__ ;
inout		dram_dq__9__ ;
inout		dram_dq__8__ ;
inout		dram_dq__7__ ;
inout		dram_dq__6__ ;
inout		dram_dq__5__ ;
inout		dram_dq__4__ ;
inout		dram_dq__3__ ;
inout		dram_dq__2__ ;
inout		dram_dq__1__ ;
inout		dram_dq__0__ ;
inout		dram_dqs__3__ ;
inout		dram_dqs__2__ ;
inout		dram_dqs__1__ ;
inout		dram_dqs__0__ ;
inout		dram_dqs__21__ ;
inout		dram_dqs__20__ ;
inout		dram_dqs__19__ ;
inout		dram_dqs__18__ ;
inout		dram_dqs__17__ ;
inout		dram_dqs__30__ ;
inout		dram_dqs__29__ ;
inout		dram_dqs__28__ ;
inout		dram_dqs__27__ ;
 
wire [7:0]	net704 ;
wire [7:0]	net952 ;
wire [4:0]	net692 ;
wire [7:0]	net0429 ;
wire [1:0]	net943 ;
wire [1:0]	net799 ;
wire [7:0]	net0684 ;
wire [7:0]	net0888 ;
wire [4:0]	net818 ;
wire [4:0]	net918 ;
wire [7:0]	net0786 ;
wire [7:0]	net953 ;
wire [7:0]	net569 ;
wire [7:0]	net0334 ;
wire [1:0]	net565 ;
wire [7:0]	net0480 ;
wire [7:0]	net570 ;
wire [1:0]	net826 ;
wire [7:0]	net830 ;
wire [7:0]	net931 ;
wire [4:0]	net438 ;
wire [4:0]	net579 ;
wire [7:0]	net831 ;
wire [7:0]	net0531 ;
wire [7:0]	net930 ;
wire [1:0]	net673 ;
wire [7:0]	net682 ;
wire [7:0]	net0837 ;
wire [1:0]	net700 ;
wire [7:0]	net0633 ;
wire [4:0]	net940 ;
wire [7:0]	net0735 ;
wire [7:0]	net705 ;
wire [7:0]	net809 ;
wire [7:0]	net592 ;
wire [7:0]	net683 ;
wire [7:0]	net591 ;
wire [7:0]	net808 ;
wire [1:0]	net948 ;
wire [1:0]	net566 ;
wire [4:0]	net670 ;
wire [1:0]	net678 ;
wire [1:0]	net582 ;
wire [1:0]	net701 ;
wire [1:0]	net413 ;
wire [4:0]	net796 ;
wire [1:0]	net921 ;
wire [1:0]	net827 ;
wire [1:0]	net949 ;
wire [4:0]	net557 ;
wire [1:0]	net679 ;
wire [1:0]	net587 ;
wire [4:0]	net410 ;
wire [1:0]	net804 ;
wire [1:0]	net695 ;
wire [1:0]	net430 ;
wire [1:0]	net926 ;
wire [1:0]	net440 ;
wire [1:0]	net560 ;
wire [1:0]	net588 ;
wire [1:0]	net805 ;
wire [1:0]	net821 ;
wire [1:0]	net429 ;
wire [1:0]	net927 ;
wire [1:0]	net435 ;
wire [1:0]	net441 ;
wire		net01157 ;
wire		net580 ;
wire		net581 ;
wire		net680 ;
wire		net583 ;
wire		net681 ;
wire		net584 ;
wire		net586 ;
wire		net684 ;
wire		net685 ;
wire		net800 ;
wire		net702 ;
wire		net686 ;
wire		net409 ;
wire		net801 ;
wire		net703 ;
wire		net687 ;
wire		net589 ;
wire		net688 ;
wire		net803 ;
wire		net689 ;
wire		net706 ;
wire		net707 ;
wire		net708 ;
wire		net806 ;
wire		net709 ;
wire		net807 ;
wire		net0482 ;
wire		net590 ;
wire		net411 ;
wire		net412 ;
wire		net0386 ;
wire		net690 ;
wire		net414 ;
wire		net593 ;
wire		net691 ;
wire		net594 ;
wire		net415 ;
wire		net0487 ;
wire		net710 ;
wire		net595 ;
wire		net416 ;
wire		net693 ;
wire		net711 ;
wire		net596 ;
wire		net694 ;
wire		net712 ;
wire		net597 ;
wire		net418 ;
wire		net810 ;
wire		net696 ;
wire		net598 ;
wire		net419 ;
wire		net811 ;
wire		net697 ;
wire		net599 ;
wire		net795 ;
wire		net812 ;
wire		net813 ;
wire		net814 ;
wire		net699 ;
wire		net797 ;
wire		net798 ;
wire		net815 ;
wire		net816 ;
wire		net0530 ;
wire		net817 ;
wire		net420 ;
wire		net421 ;
wire		net917 ;
wire		net422 ;
wire		net0631 ;
wire		net423 ;
wire		net919 ;
wire		net0535 ;
wire		net424 ;
wire		net427 ;
wire		net428 ;
wire		net820 ;
wire		bso0_bsi1 ;
wire		net822 ;
wire		net920 ;
wire		net823 ;
wire		bso2_bsi3 ;
wire		net922 ;
wire		net825 ;
wire		bso4_bsi5 ;
wire		net925 ;
wire		net828 ;
wire		net829 ;
wire		net432 ;
wire		net928 ;
wire		net433 ;
wire		net929 ;
wire		net434 ;
wire		net436 ;
wire		net437 ;
wire		net439 ;
wire		net832 ;
wire		net833 ;
wire		net834 ;
wire		net835 ;
wire		net836 ;
wire		net837 ;
wire		net838 ;
wire		net0434 ;
wire		net442 ;
wire		net939 ;
wire		net443 ;
wire		pad_clk_so1_si2 ;
wire		net0439 ;
wire		net446 ;
wire		net447 ;
wire		net448 ;
wire		net449 ;
wire		pad_clk_so2_si3 ;
wire		net942 ;
wire		net0818 ;
wire		net944 ;
wire		net450 ;
wire		net945 ;
wire		net451 ;
wire		pad_clk_so0_si1 ;
wire		net452 ;
wire		net947 ;
wire		net0722 ;
wire		net556 ;
wire		net0823 ;
wire		net558 ;
wire		net950 ;
wire		net01234 ;
wire		net559 ;
wire		net951 ;
wire		net0727 ;
wire		net954 ;
wire		net0391 ;
wire		net955 ;
wire		pad_clk_so3_si4 ;
wire		net956 ;
wire		net957 ;
wire		net958 ;
wire		net959 ;
wire		net561 ;
wire		net562 ;
wire		pad_clk_so4_si5 ;
wire		net564 ;
wire		net0770 ;
wire		net0674 ;
wire		net567 ;
wire		net568 ;
wire		net960 ;
wire		net0578 ;
wire		bso1_bsi2 ;
wire		net0775 ;
wire		net0679 ;
wire		net669 ;
wire		bso3_bsi4 ;
wire		net571 ;
wire		net572 ;
wire		net0583 ;
wire		net573 ;
wire		net671 ;
wire		net574 ;
wire		net672 ;
wire		net575 ;
wire		net576 ;
wire		net674 ;
wire		net577 ;
wire		net675 ;
wire		net578 ;
wire		net677 ;
 
 
bw_io_ddr_6sig_x4 I0 (
     .serial_in       ({serial_in[15:0] } ),
     .afo             ({afo[15:0] } ),
     .serial_out      ({serial_out[15:0] } ),
     .afi             ({afi[15:0] } ),
     .vrefcode_i_l    ({net0684[0] ,net0684[1] ,net0684[2] ,net0684[3] ,
            net0684[4] ,net0684[5] ,net0684[6] ,net0684[7] } ),
     .vrefcode_i_r    ({net0735[0] ,net0735[1] ,net0735[2] ,net0735[3] ,
            net0735[4] ,net0735[5] ,net0735[6] ,net0735[7] } ),
     .data_neg        ({dram_io_data_out__215__ ,dram_io_data_out__214__ ,
            dram_io_data_out__213__ ,dram_io_data_out__212__ ,
            dram_io_data_out__211__ ,dram_io_data_out__210__ ,
            dram_io_data_out__209__ ,dram_io_data_out__208__ ,
            dram_io_data_out__151__ ,dram_io_data_out__150__ ,
            dram_io_data_out__149__ ,dram_io_data_out__148__ ,
            dram_io_data_out__147__ ,dram_io_data_out__146__ ,
            dram_io_data_out__145__ ,dram_io_data_out__144__ } ),
     .data_pos        ({dram_io_data_out__71__ ,dram_io_data_out__70__ ,
            dram_io_data_out__69__ ,dram_io_data_out__68__ ,
            dram_io_data_out__67__ ,dram_io_data_out__66__ ,
            dram_io_data_out__65__ ,dram_io_data_out__64__ ,
            dram_io_data_out__7__ ,dram_io_data_out__6__ ,
            dram_io_data_out__5__ ,dram_io_data_out__4__ ,
            dram_io_data_out__3__ ,dram_io_data_out__2__ ,
            dram_io_data_out__1__ ,dram_io_data_out__0__ } ),
     .io_dram_data_in ({io_dram_data_in__71__ ,io_dram_data_in__70__ ,
            io_dram_data_in__69__ ,io_dram_data_in__68__ ,
            io_dram_data_in__67__ ,io_dram_data_in__66__ ,
            io_dram_data_in__65__ ,io_dram_data_in__64__ ,
            io_dram_data_in__7__ ,io_dram_data_in__6__ ,
            io_dram_data_in__5__ ,io_dram_data_in__4__ ,
            io_dram_data_in__3__ ,io_dram_data_in__2__ ,
            io_dram_data_in__1__ ,io_dram_data_in__0__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__199__ ,io_dram_data_in__198__
             ,io_dram_data_in__197__ ,io_dram_data_in__196__ ,
            io_dram_data_in__195__ ,io_dram_data_in__194__ ,
            io_dram_data_in__193__ ,io_dram_data_in__192__ ,
            io_dram_data_in__135__ ,io_dram_data_in__134__ ,
            io_dram_data_in__133__ ,io_dram_data_in__132__ ,
            io_dram_data_in__131__ ,io_dram_data_in__130__ ,
            io_dram_data_in__129__ ,io_dram_data_in__128__ } ),
     .dq_pad          ({dram_dq__71__ ,dram_dq__70__ ,dram_dq__69__ ,
            dram_dq__68__ ,dram_dq__67__ ,dram_dq__66__ ,dram_dq__65__ ,
            dram_dq__64__ ,dram_dq__7__ ,dram_dq__6__ ,dram_dq__5__ ,
            dram_dq__4__ ,dram_dq__3__ ,dram_dq__2__ ,dram_dq__1__ ,
            dram_dq__0__ } ),
     .lpf_code_i_r    ({net940[0] ,net940[1] ,net940[2] ,net940[3] ,
            net940[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net943[0] ,net943[1] } ),
     .pad_pos_cnt_i_r ({net948[0] ,net948[1] } ),
     .pad_neg_cnt_i_r ({net949[0] ,net949[1] } ),
     .cbu_i_r         ({cbu_i_r } ),
     .cbd_i_r         ({cbd_i_r } ),
     .dqs_pad         ({dram_dqs__27__ ,dram_dqs__18__ ,dram_dqs__9__ ,
            dram_dqs__0__ } ),
     .lpf_code_i_l    ({net918[0] ,net918[1] ,net918[2] ,net918[3] ,
            net918[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net921[0] ,net921[1] } ),
     .pad_pos_cnt_i_l ({net926[0] ,net926[1] } ),
     .pad_neg_cnt_i_l ({net927[0] ,net927[1] } ),
     .cbu_i_l         ({cbu_i_l } ),
     .cbd_i_l         ({cbd_i_l } ),
     .bypass_enable_i_r (net960 ),
     .ps_select_i_r   (net0674 ),
     .test_mode_i_l   (net0631 ),
     .testmode_l_i_l  (net925 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0679 ),
     .strobe_i_r      (net939 ),
     .burst_length_four_i_r (net942 ),
     .dram_io_pad_enable_i_r (net944 ),
     .dram_io_drive_enable_i_r (net945 ),
     .rst_l_i_r       (net01234 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net950 ),
     .dram_io_drive_data_i_r (net951 ),
     .se_i_r          (net954 ),
     .mode_ctrl_i_r   (net955 ),
     .update_dr_i_r   (net956 ),
     .shift_dr_i_r    (net957 ),
     .clock_dr_i_r    (net958 ),
     .hiz_n_i_r       (net959 ),
     .pad_clk_si      (pad_clk_si ),
     .pad_clk_so      (pad_clk_so0_si1 ),
     .ctl_pad_0       (spare_ddr_pin[9] ),
     .ctl_pad_1       (dram_addr__14__ ),
     .ctl_pad_3       (dram_cke ),
     .ctl_pad_2       (dram_addr__13__ ),
     .ctl_data_0      (spare_ddr_data[9] ),
     .ctl_data_1      (dram_io_addr__14__ ),
     .ctl_data_2      (dram_io_addr__13__ ),
     .ctl_data_3      (dram_io_cke ),
     .bsi             (bsi ),
     .bso             (bso0_bsi1 ),
     .strobe_i_l      (net917 ),
     .burst_length_four_i_l (net920 ),
     .dram_io_pad_enable_i_l (net922 ),
     .dram_io_drive_enable_i_l (dram_io_drive_enable_o_l ),
     .rst_l_i_l       (net919 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net928 ),
     .dram_io_drive_data_i_l (net929 ),
     .se_i_l          (se_o_l ),
     .mode_ctrl_i_l   (mode_ctrl_out ),
     .ps_select_i_l   (ps_select_out ),
     .shift_dr_i_l    (shift_dr_out ),
     .clock_dr_i_l    (clock_dr_out ),
     .testmode_l_i_r  (net947 ),
     .hiz_n_i_l       (hiz_n_out ),
     .bypass_enable_i_l (bypass_enable_out ),
     .update_dr_i_l   (update_dr_out ) );
bw_io_ddr_6sig_x4 I1 (
     .serial_in       ({serial_in[31:16] } ),
     .afo             ({afo[31:16] } ),
     .serial_out      ({serial_out[31:16] } ),
     .afi             ({afi[31:16] } ),
     .vrefcode_i_l    ({net0888[0] ,net0888[1] ,net0888[2] ,net0888[3] ,
            net0888[4] ,net0888[5] ,net0888[6] ,net0888[7] } ),
     .vrefcode_i_r    ({net0633[0] ,net0633[1] ,net0633[2] ,net0633[3] ,
            net0633[4] ,net0633[5] ,net0633[6] ,net0633[7] } ),
     .data_neg        ({dram_io_data_out__223__ ,dram_io_data_out__222__ ,
            dram_io_data_out__221__ ,dram_io_data_out__220__ ,
            dram_io_data_out__219__ ,dram_io_data_out__218__ ,
            dram_io_data_out__217__ ,dram_io_data_out__216__ ,
            dram_io_data_out__159__ ,dram_io_data_out__158__ ,
            dram_io_data_out__157__ ,dram_io_data_out__156__ ,
            dram_io_data_out__155__ ,dram_io_data_out__154__ ,
            dram_io_data_out__153__ ,dram_io_data_out__152__ } ),
     .data_pos        ({dram_io_data_out__79__ ,dram_io_data_out__78__ ,
            dram_io_data_out__77__ ,dram_io_data_out__76__ ,
            dram_io_data_out__75__ ,dram_io_data_out__74__ ,
            dram_io_data_out__73__ ,dram_io_data_out__72__ ,
            dram_io_data_out__15__ ,dram_io_data_out__14__ ,
            dram_io_data_out__13__ ,dram_io_data_out__12__ ,
            dram_io_data_out__11__ ,dram_io_data_out__10__ ,
            dram_io_data_out__9__ ,dram_io_data_out__8__ } ),
     .io_dram_data_in ({io_dram_data_in__79__ ,io_dram_data_in__78__ ,
            io_dram_data_in__77__ ,io_dram_data_in__76__ ,
            io_dram_data_in__75__ ,io_dram_data_in__74__ ,
            io_dram_data_in__73__ ,io_dram_data_in__72__ ,
            io_dram_data_in__15__ ,io_dram_data_in__14__ ,
            io_dram_data_in__13__ ,io_dram_data_in__12__ ,
            io_dram_data_in__11__ ,io_dram_data_in__10__ ,
            io_dram_data_in__9__ ,io_dram_data_in__8__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__207__ ,io_dram_data_in__206__
             ,io_dram_data_in__205__ ,io_dram_data_in__204__ ,
            io_dram_data_in__203__ ,io_dram_data_in__202__ ,
            io_dram_data_in__201__ ,io_dram_data_in__200__ ,
            io_dram_data_in__143__ ,io_dram_data_in__142__ ,
            io_dram_data_in__141__ ,io_dram_data_in__140__ ,
            io_dram_data_in__139__ ,io_dram_data_in__138__ ,
            io_dram_data_in__137__ ,io_dram_data_in__136__ } ),
     .dq_pad          ({dram_dq__79__ ,dram_dq__78__ ,dram_dq__77__ ,
            dram_dq__76__ ,dram_dq__75__ ,dram_dq__74__ ,dram_dq__73__ ,
            dram_dq__72__ ,dram_dq__15__ ,dram_dq__14__ ,dram_dq__13__ ,
            dram_dq__12__ ,dram_dq__11__ ,dram_dq__10__ ,dram_dq__9__ ,
            dram_dq__8__ } ),
     .lpf_code_i_r    ({net818[0] ,net818[1] ,net818[2] ,net818[3] ,
            net818[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net821[0] ,net821[1] } ),
     .pad_pos_cnt_i_r ({net826[0] ,net826[1] } ),
     .pad_neg_cnt_i_r ({net827[0] ,net827[1] } ),
     .cbu_i_r         ({net953[0] ,net953[1] ,net953[2] ,net953[3] ,
            net953[4] ,net953[5] ,net953[6] ,net953[7] } ),
     .cbd_i_r         ({net952[0] ,net952[1] ,net952[2] ,net952[3] ,
            net952[4] ,net952[5] ,net952[6] ,net952[7] } ),
     .dqs_pad         ({dram_dqs__28__ ,dram_dqs__19__ ,dram_dqs__10__ ,
            dram_dqs__1__ } ),
     .lpf_code_i_l    ({net796[0] ,net796[1] ,net796[2] ,net796[3] ,
            net796[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net799[0] ,net799[1] } ),
     .pad_pos_cnt_i_l ({net804[0] ,net804[1] } ),
     .pad_neg_cnt_i_l ({net805[0] ,net805[1] } ),
     .cbu_i_l         ({net931[0] ,net931[1] ,net931[2] ,net931[3] ,
            net931[4] ,net931[5] ,net931[6] ,net931[7] } ),
     .cbd_i_l         ({net930[0] ,net930[1] ,net930[2] ,net930[3] ,
            net930[4] ,net930[5] ,net930[6] ,net930[7] } ),
     .bypass_enable_i_r (net838 ),
     .ps_select_i_r   (net0578 ),
     .test_mode_i_l   (net0823 ),
     .testmode_l_i_l  (net803 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0583 ),
     .strobe_i_r      (net817 ),
     .burst_length_four_i_r (net820 ),
     .dram_io_pad_enable_i_r (net822 ),
     .dram_io_drive_enable_i_r (net823 ),
     .rst_l_i_r       (net01157 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net828 ),
     .dram_io_drive_data_i_r (net829 ),
     .se_i_r          (net832 ),
     .mode_ctrl_i_r   (net833 ),
     .update_dr_i_r   (net834 ),
     .shift_dr_i_r    (net835 ),
     .clock_dr_i_r    (net836 ),
     .hiz_n_i_r       (net837 ),
     .pad_clk_si      (pad_clk_so0_si1 ),
     .pad_clk_so      (pad_clk_so1_si2 ),
     .ctl_pad_0       (dram_ba[2] ),
     .ctl_pad_1       (dram_addr__12__ ),
     .ctl_pad_3       (dram_addr__9__ ),
     .ctl_pad_2       (dram_addr__11__ ),
     .ctl_data_0      (dram_io_bank[2] ),
     .ctl_data_1      (dram_io_addr__12__ ),
     .ctl_data_2      (dram_io_addr__11__ ),
     .ctl_data_3      (dram_io_addr__9__ ),
     .bsi             (bso0_bsi1 ),
     .bso             (bso1_bsi2 ),
     .strobe_i_l      (net795 ),
     .burst_length_four_i_l (net798 ),
     .dram_io_pad_enable_i_l (net800 ),
     .dram_io_drive_enable_i_l (net801 ),
     .rst_l_i_l       (net797 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net806 ),
     .dram_io_drive_data_i_l (net807 ),
     .se_i_l          (net810 ),
     .mode_ctrl_i_l   (net811 ),
     .ps_select_i_l   (net0818 ),
     .shift_dr_i_l    (net813 ),
     .clock_dr_i_l    (net814 ),
     .testmode_l_i_r  (net825 ),
     .hiz_n_i_l       (net815 ),
     .bypass_enable_i_l (net816 ),
     .update_dr_i_l   (net812 ) );
bw_io_ddr_6sig_x4 I2 (
     .serial_in       ({serial_in[47:32] } ),
     .afo             ({afo[47:32] } ),
     .serial_out      ({serial_out[47:32] } ),
     .afi             ({afi[47:32] } ),
     .vrefcode_i_l    ({net0429[0] ,net0429[1] ,net0429[2] ,net0429[3] ,
            net0429[4] ,net0429[5] ,net0429[6] ,net0429[7] } ),
     .vrefcode_i_r    ({net0531[0] ,net0531[1] ,net0531[2] ,net0531[3] ,
            net0531[4] ,net0531[5] ,net0531[6] ,net0531[7] } ),
     .data_neg        ({dram_io_data_out__231__ ,dram_io_data_out__230__ ,
            dram_io_data_out__229__ ,dram_io_data_out__228__ ,
            dram_io_data_out__227__ ,dram_io_data_out__226__ ,
            dram_io_data_out__225__ ,dram_io_data_out__224__ ,
            dram_io_data_out__167__ ,dram_io_data_out__166__ ,
            dram_io_data_out__165__ ,dram_io_data_out__164__ ,
            dram_io_data_out__163__ ,dram_io_data_out__162__ ,
            dram_io_data_out__161__ ,dram_io_data_out__160__ } ),
     .data_pos        ({dram_io_data_out__87__ ,dram_io_data_out__86__ ,
            dram_io_data_out__85__ ,dram_io_data_out__84__ ,
            dram_io_data_out__83__ ,dram_io_data_out__82__ ,
            dram_io_data_out__81__ ,dram_io_data_out__80__ ,
            dram_io_data_out__23__ ,dram_io_data_out__22__ ,
            dram_io_data_out__21__ ,dram_io_data_out__20__ ,
            dram_io_data_out__19__ ,dram_io_data_out__18__ ,
            dram_io_data_out__17__ ,dram_io_data_out__16__ } ),
     .io_dram_data_in ({io_dram_data_in__87__ ,io_dram_data_in__86__ ,
            io_dram_data_in__85__ ,io_dram_data_in__84__ ,
            io_dram_data_in__83__ ,io_dram_data_in__82__ ,
            io_dram_data_in__81__ ,io_dram_data_in__80__ ,
            io_dram_data_in__23__ ,io_dram_data_in__22__ ,
            io_dram_data_in__21__ ,io_dram_data_in__20__ ,
            io_dram_data_in__19__ ,io_dram_data_in__18__ ,
            io_dram_data_in__17__ ,io_dram_data_in__16__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__215__ ,io_dram_data_in__214__
             ,io_dram_data_in__213__ ,io_dram_data_in__212__ ,
            io_dram_data_in__211__ ,io_dram_data_in__210__ ,
            io_dram_data_in__209__ ,io_dram_data_in__208__ ,
            io_dram_data_in__151__ ,io_dram_data_in__150__ ,
            io_dram_data_in__149__ ,io_dram_data_in__148__ ,
            io_dram_data_in__147__ ,io_dram_data_in__146__ ,
            io_dram_data_in__145__ ,io_dram_data_in__144__ } ),
     .dq_pad          ({dram_dq__87__ ,dram_dq__86__ ,dram_dq__85__ ,
            dram_dq__84__ ,dram_dq__83__ ,dram_dq__82__ ,dram_dq__81__ ,
            dram_dq__80__ ,dram_dq__23__ ,dram_dq__22__ ,dram_dq__21__ ,
            dram_dq__20__ ,dram_dq__19__ ,dram_dq__18__ ,dram_dq__17__ ,
            dram_dq__16__ } ),
     .lpf_code_i_r    ({net692[0] ,net692[1] ,net692[2] ,net692[3] ,
            net692[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net695[0] ,net695[1] } ),
     .pad_pos_cnt_i_r ({net700[0] ,net700[1] } ),
     .pad_neg_cnt_i_r ({net701[0] ,net701[1] } ),
     .cbu_i_r         ({net831[0] ,net831[1] ,net831[2] ,net831[3] ,
            net831[4] ,net831[5] ,net831[6] ,net831[7] } ),
     .cbd_i_r         ({net830[0] ,net830[1] ,net830[2] ,net830[3] ,
            net830[4] ,net830[5] ,net830[6] ,net830[7] } ),
     .dqs_pad         ({dram_dqs__29__ ,dram_dqs__20__ ,dram_dqs__11__ ,
            dram_dqs__2__ } ),
     .lpf_code_i_l    ({net670[0] ,net670[1] ,net670[2] ,net670[3] ,
            net670[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net673[0] ,net673[1] } ),
     .pad_pos_cnt_i_l ({net678[0] ,net678[1] } ),
     .pad_neg_cnt_i_l ({net679[0] ,net679[1] } ),
     .cbu_i_l         ({net809[0] ,net809[1] ,net809[2] ,net809[3] ,
            net809[4] ,net809[5] ,net809[6] ,net809[7] } ),
     .cbd_i_l         ({net808[0] ,net808[1] ,net808[2] ,net808[3] ,
            net808[4] ,net808[5] ,net808[6] ,net808[7] } ),
     .bypass_enable_i_r (net712 ),
     .ps_select_i_r   (net0482 ),
     .test_mode_i_l   (net0391 ),
     .testmode_l_i_l  (net677 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0487 ),
     .strobe_i_r      (net691 ),
     .burst_length_four_i_r (net694 ),
     .dram_io_pad_enable_i_r (net696 ),
     .dram_io_drive_enable_i_r (net697 ),
     .rst_l_i_r       (net693 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net702 ),
     .dram_io_drive_data_i_r (net703 ),
     .se_i_r          (net706 ),
     .mode_ctrl_i_r   (net707 ),
     .update_dr_i_r   (net708 ),
     .shift_dr_i_r    (net709 ),
     .clock_dr_i_r    (net710 ),
     .hiz_n_i_r       (net711 ),
     .pad_clk_si      (pad_clk_so1_si2 ),
     .pad_clk_so      (pad_clk_so2_si3 ),
     .ctl_pad_0       (dram_addr__8__ ),
     .ctl_pad_1       (dram_addr__7__ ),
     .ctl_pad_3       (dram_addr__6__ ),
     .ctl_pad_2       (spare_ddr_pin[8] ),
     .ctl_data_0      (dram_io_addr__8__ ),
     .ctl_data_1      (dram_io_addr__7__ ),
     .ctl_data_2      (spare_ddr_data[8] ),
     .ctl_data_3      (dram_io_addr__6__ ),
     .bsi             (bso1_bsi2 ),
     .bso             (bso2_bsi3 ),
     .strobe_i_l      (net669 ),
     .burst_length_four_i_l (net672 ),
     .dram_io_pad_enable_i_l (net674 ),
     .dram_io_drive_enable_i_l (net675 ),
     .rst_l_i_l       (net671 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net680 ),
     .dram_io_drive_data_i_l (net681 ),
     .se_i_l          (net684 ),
     .mode_ctrl_i_l   (net685 ),
     .ps_select_i_l   (net0386 ),
     .shift_dr_i_l    (net687 ),
     .clock_dr_i_l    (net688 ),
     .testmode_l_i_r  (net699 ),
     .hiz_n_i_l       (net689 ),
     .bypass_enable_i_l (net690 ),
     .update_dr_i_l   (net686 ) );
bw_io_ddr_6sig_x4 I3 (
     .serial_in       ({serial_in[63:48] } ),
     .afo             ({afo[63:48] } ),
     .serial_out      ({serial_out[63:48] } ),
     .afi             ({afi[63:48] } ),
     .vrefcode_i_l    ({net0480[0] ,net0480[1] ,net0480[2] ,net0480[3] ,
            net0480[4] ,net0480[5] ,net0480[6] ,net0480[7] } ),
     .vrefcode_i_r    ({net0786[0] ,net0786[1] ,net0786[2] ,net0786[3] ,
            net0786[4] ,net0786[5] ,net0786[6] ,net0786[7] } ),
     .data_neg        ({dram_io_data_out__279__ ,dram_io_data_out__278__ ,
            dram_io_data_out__277__ ,dram_io_data_out__276__ ,
            dram_io_data_out__275__ ,dram_io_data_out__274__ ,
            dram_io_data_out__273__ ,dram_io_data_out__272__ ,
            dram_io_data_out__175__ ,dram_io_data_out__174__ ,
            dram_io_data_out__173__ ,dram_io_data_out__172__ ,
            dram_io_data_out__171__ ,dram_io_data_out__170__ ,
            dram_io_data_out__169__ ,dram_io_data_out__168__ } ),
     .data_pos        ({dram_io_data_out__135__ ,dram_io_data_out__134__ ,
            dram_io_data_out__133__ ,dram_io_data_out__132__ ,
            dram_io_data_out__131__ ,dram_io_data_out__130__ ,
            dram_io_data_out__129__ ,dram_io_data_out__128__ ,
            dram_io_data_out__31__ ,dram_io_data_out__30__ ,
            dram_io_data_out__29__ ,dram_io_data_out__28__ ,
            dram_io_data_out__27__ ,dram_io_data_out__26__ ,
            dram_io_data_out__25__ ,dram_io_data_out__24__ } ),
     .io_dram_data_in ({io_dram_ecc_in__7__ ,io_dram_ecc_in__6__ ,
            io_dram_ecc_in__5__ ,io_dram_ecc_in__4__ ,io_dram_ecc_in__3__ ,
            io_dram_ecc_in__2__ ,io_dram_ecc_in__1__ ,io_dram_ecc_in__0__ ,
            io_dram_data_in__31__ ,io_dram_data_in__30__ ,
            io_dram_data_in__29__ ,io_dram_data_in__28__ ,
            io_dram_data_in__27__ ,io_dram_data_in__26__ ,
            io_dram_data_in__25__ ,io_dram_data_in__24__ } ),
     .io_dram_data_in_hi ({io_dram_ecc_in__23__ ,io_dram_ecc_in__22__ ,
            io_dram_ecc_in__21__ ,io_dram_ecc_in__20__ ,
            io_dram_ecc_in__19__ ,io_dram_ecc_in__18__ ,
            io_dram_ecc_in__17__ ,io_dram_ecc_in__16__ ,
            io_dram_data_in__159__ ,io_dram_data_in__158__ ,
            io_dram_data_in__157__ ,io_dram_data_in__156__ ,
            io_dram_data_in__155__ ,io_dram_data_in__154__ ,
            io_dram_data_in__153__ ,io_dram_data_in__152__ } ),
     .dq_pad          ({dram_cb[7:0] ,dram_dq__31__ ,dram_dq__30__ ,
            dram_dq__29__ ,dram_dq__28__ ,dram_dq__27__ ,dram_dq__26__ ,
            dram_dq__25__ ,dram_dq__24__ } ),
     .lpf_code_i_r    ({net579[0] ,net579[1] ,net579[2] ,net579[3] ,
            net579[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net582[0] ,net582[1] } ),
     .pad_pos_cnt_i_r ({net587[0] ,net587[1] } ),
     .pad_neg_cnt_i_r ({net588[0] ,net588[1] } ),
     .cbu_i_r         ({net705[0] ,net705[1] ,net705[2] ,net705[3] ,
            net705[4] ,net705[5] ,net705[6] ,net705[7] } ),
     .cbd_i_r         ({net704[0] ,net704[1] ,net704[2] ,net704[3] ,
            net704[4] ,net704[5] ,net704[6] ,net704[7] } ),
     .dqs_pad         ({dram_dqs__17__ ,dram_dqs__8__ ,dram_dqs__12__ ,
            dram_dqs__3__ } ),
     .lpf_code_i_l    ({net557[0] ,net557[1] ,net557[2] ,net557[3] ,
            net557[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net560[0] ,net560[1] } ),
     .pad_pos_cnt_i_l ({net565[0] ,net565[1] } ),
     .pad_neg_cnt_i_l ({net566[0] ,net566[1] } ),
     .cbu_i_l         ({net683[0] ,net683[1] ,net683[2] ,net683[3] ,
            net683[4] ,net683[5] ,net683[6] ,net683[7] } ),
     .cbd_i_l         ({net682[0] ,net682[1] ,net682[2] ,net682[3] ,
            net682[4] ,net682[5] ,net682[6] ,net682[7] } ),
     .bypass_enable_i_r (net599 ),
     .ps_select_i_r   (net0722 ),
     .test_mode_i_l   (net0439 ),
     .testmode_l_i_l  (net564 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ),
     .test_mode_i_r   (net0727 ),
     .strobe_i_r      (net578 ),
     .burst_length_four_i_r (net581 ),
     .dram_io_pad_enable_i_r (net583 ),
     .dram_io_drive_enable_i_r (net584 ),
     .rst_l_i_r       (net580 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net589 ),
     .dram_io_drive_data_i_r (net590 ),
     .se_i_r          (net593 ),
     .mode_ctrl_i_r   (net594 ),
     .update_dr_i_r   (net595 ),
     .shift_dr_i_r    (net596 ),
     .clock_dr_i_r    (net597 ),
     .hiz_n_i_r       (net598 ),
     .pad_clk_si      (pad_clk_so2_si3 ),
     .pad_clk_so      (pad_clk_so3_si4 ),
     .ctl_pad_0       (dram_addr__5__ ),
     .ctl_pad_1       (dram_addr__4__ ),
     .ctl_pad_3       (dram_addr__2__ ),
     .ctl_pad_2       (dram_addr__3__ ),
     .ctl_data_0      (dram_io_addr__5__ ),
     .ctl_data_1      (dram_io_addr__4__ ),
     .ctl_data_2      (dram_io_addr__3__ ),
     .ctl_data_3      (dram_io_addr__2__ ),
     .bsi             (bso2_bsi3 ),
     .bso             (bso3_bsi4 ),
     .strobe_i_l      (net556 ),
     .burst_length_four_i_l (net559 ),
     .dram_io_pad_enable_i_l (net561 ),
     .dram_io_drive_enable_i_l (net562 ),
     .rst_l_i_l       (net558 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net567 ),
     .dram_io_drive_data_i_l (net568 ),
     .se_i_l          (net571 ),
     .mode_ctrl_i_l   (net572 ),
     .ps_select_i_l   (net0434 ),
     .shift_dr_i_l    (net574 ),
     .clock_dr_i_l    (net575 ),
     .testmode_l_i_r  (net586 ),
     .hiz_n_i_l       (net576 ),
     .bypass_enable_i_l (net577 ),
     .update_dr_i_l   (net573 ) );
bw_io_ddr_rptr_c I248 (
     .out14           ({cbd_o_l } ),
     .out13           ({cbu_o_l } ),
     .out10           ({net441[0] ,net441[1] } ),
     .out9            ({net440[0] ,net440[1] } ),
     .out4            ({net435[0] ,net435[1] } ),
     .in14            ({net569[0] ,net569[1] ,net569[2] ,net569[3] ,
            net569[4] ,net569[5] ,net569[6] ,net569[7] } ),
     .in13            ({net570[0] ,net570[1] ,net570[2] ,net570[3] ,
            net570[4] ,net570[5] ,net570[6] ,net570[7] } ),
     .out1            ({net438[0] ,net438[1] ,net438[2] ,net438[3] ,
            net438[4] } ),
     .in10            ({pad_neg_cnt_i_l } ),
     .out25           ({net0837[0] ,net0837[1] ,net0837[2] ,net0837[3] ,
            net0837[4] ,net0837[5] ,net0837[6] ,net0837[7] } ),
     .in25            ({vrefcode_i_l } ),
     .in1             ({lpf_code_i_l } ),
     .in4             ({dram_io_ptr_clk_inv_i_l } ),
     .in9             ({pad_pos_cnt_i_l } ),
     .out21           (net448 ),
     .out20           (net450 ),
     .out19           (net451 ),
     .out18           (net447 ),
     .out17           (net446 ),
     .out16           (net449 ),
     .out15           (net452 ),
     .out12           (net442 ),
     .out8            (net432 ),
     .out6            (net436 ),
     .out5            (net434 ),
     .out3            (net437 ),
     .out2            (net433 ),
     .in21            (bypass_enable_i_l ),
     .in20            (hiz_n_i_l ),
     .in19            (clock_dr_i_l ),
     .in18            (shift_dr_i_l ),
     .in17            (update_dr_i_l ),
     .in16            (mode_ctrl_i_l ),
     .in15            (se_i_l ),
     .in12            (dram_io_drive_data_i_l ),
     .out0            (net439 ),
     .in22            (ps_select_i_l ),
     .out22           (net0770 ),
     .in24            (test_mode_i_l ),
     .out24           (net0775 ),
     .vdd18           (vdd_h ),
     .in2             (rst_l_i_l ),
     .in5             (dram_io_pad_enable_i_l ),
     .out11           (net443 ),
     .in3             (burst_length_four_i_l ),
     .in11            (dram_io_channel_disabled_i_l ),
     .in0             (strobe_i_l ),
     .in6             (dram_io_drive_enable_i_l ),
     .in8             (testmode_l_i_l ) );
bw_io_ddr_rptr_c I249 (
     .out14           ({cbd_o_r } ),
     .out13           ({cbu_o_r } ),
     .out10           ({net429[0] ,net429[1] } ),
     .out9            ({net430[0] ,net430[1] } ),
     .out4            ({net413[0] ,net413[1] } ),
     .in14            ({net591[0] ,net591[1] ,net591[2] ,net591[3] ,
            net591[4] ,net591[5] ,net591[6] ,net591[7] } ),
     .in13            ({net592[0] ,net592[1] ,net592[2] ,net592[3] ,
            net592[4] ,net592[5] ,net592[6] ,net592[7] } ),
     .out1            ({net410[0] ,net410[1] ,net410[2] ,net410[3] ,
            net410[4] } ),
     .in10            ({pad_neg_cnt_i_r } ),
     .out25           ({net0334[0] ,net0334[1] ,net0334[2] ,net0334[3] ,
            net0334[4] ,net0334[5] ,net0334[6] ,net0334[7] } ),
     .in25            ({vrefcode_i_r } ),
     .in1             ({lpf_code_i_r } ),
     .in4             ({dram_io_ptr_clk_inv_i_r } ),
     .in9             ({pad_pos_cnt_i_r } ),
     .out21           (net422 ),
     .out20           (net420 ),
     .out19           (net419 ),
     .out18           (net423 ),
     .out17           (net424 ),
     .out16           (net421 ),
     .out15           (net418 ),
     .out12           (net428 ),
     .out8            (net416 ),
     .out6            (net412 ),
     .out5            (net414 ),
     .out3            (net411 ),
     .out2            (net415 ),
     .in21            (bypass_enable_i_r ),
     .in20            (hiz_n_i_r ),
     .in19            (clock_dr_i_r ),
     .in18            (shift_dr_i_r ),
     .in17            (update_dr_i_r ),
     .in16            (mode_ctrl_i_r ),
     .in15            (se_i_r ),
     .in12            (dram_io_drive_data_i_r ),
     .out0            (net409 ),
     .in22            (ps_select_i_r ),
     .out22           (net0530 ),
     .in24            (test_mode_i_r ),
     .out24           (net0535 ),
     .vdd18           (vdd_h ),
     .in2             (rst_l_i_r ),
     .in5             (dram_io_pad_enable_i_r ),
     .out11           (net427 ),
     .in3             (burst_length_four_i_r ),
     .in11            (dram_io_channel_disabled_i_r ),
     .in0             (strobe_i_r ),
     .in6             (dram_io_drive_enable_i_r ),
     .in8             (testmode_l_i_r ) );
bw_io_ddr_rptr_c I250 (
     .out14           ({net569[0] ,net569[1] ,net569[2] ,net569[3] ,
            net569[4] ,net569[5] ,net569[6] ,net569[7] } ),
     .out13           ({net570[0] ,net570[1] ,net570[2] ,net570[3] ,
            net570[4] ,net570[5] ,net570[6] ,net570[7] } ),
     .out10           ({net566[0] ,net566[1] } ),
     .out9            ({net565[0] ,net565[1] } ),
     .out4            ({net560[0] ,net560[1] } ),
     .in14            ({net682[0] ,net682[1] ,net682[2] ,net682[3] ,
            net682[4] ,net682[5] ,net682[6] ,net682[7] } ),
     .in13            ({net683[0] ,net683[1] ,net683[2] ,net683[3] ,
            net683[4] ,net683[5] ,net683[6] ,net683[7] } ),
     .out1            ({net557[0] ,net557[1] ,net557[2] ,net557[3] ,
            net557[4] } ),
     .in10            ({net441[0] ,net441[1] } ),
     .out25           ({net0480[0] ,net0480[1] ,net0480[2] ,net0480[3] ,
            net0480[4] ,net0480[5] ,net0480[6] ,net0480[7] } ),
     .in25            ({net0837[0] ,net0837[1] ,net0837[2] ,net0837[3] ,
            net0837[4] ,net0837[5] ,net0837[6] ,net0837[7] } ),
     .in1             ({net438[0] ,net438[1] ,net438[2] ,net438[3] ,
            net438[4] } ),
     .in4             ({net435[0] ,net435[1] } ),
     .in9             ({net440[0] ,net440[1] } ),
     .out21           (net577 ),
     .out20           (net576 ),
     .out19           (net575 ),
     .out18           (net574 ),
     .out17           (net573 ),
     .out16           (net572 ),
     .out15           (net571 ),
     .out12           (net568 ),
     .out8            (net564 ),
     .out6            (net562 ),
     .out5            (net561 ),
     .out3            (net559 ),
     .out2            (net558 ),
     .in21            (net448 ),
     .in20            (net450 ),
     .in19            (net451 ),
     .in18            (net447 ),
     .in17            (net446 ),
     .in16            (net449 ),
     .in15            (net452 ),
     .in12            (net442 ),
     .out0            (net556 ),
     .in22            (net0770 ),
     .out22           (net0434 ),
     .in24            (net0775 ),
     .out24           (net0439 ),
     .vdd18           (vdd_h ),
     .in2             (net433 ),
     .in5             (net434 ),
     .out11           (net567 ),
     .in3             (net437 ),
     .in11            (net443 ),
     .in0             (net439 ),
     .in6             (net436 ),
     .in8             (net432 ) );
bw_io_ddr_rptr_c I251 (
     .out14           ({net591[0] ,net591[1] ,net591[2] ,net591[3] ,
            net591[4] ,net591[5] ,net591[6] ,net591[7] } ),
     .out13           ({net592[0] ,net592[1] ,net592[2] ,net592[3] ,
            net592[4] ,net592[5] ,net592[6] ,net592[7] } ),
     .out10           ({net588[0] ,net588[1] } ),
     .out9            ({net587[0] ,net587[1] } ),
     .out4            ({net582[0] ,net582[1] } ),
     .in14            ({net704[0] ,net704[1] ,net704[2] ,net704[3] ,
            net704[4] ,net704[5] ,net704[6] ,net704[7] } ),
     .in13            ({net705[0] ,net705[1] ,net705[2] ,net705[3] ,
            net705[4] ,net705[5] ,net705[6] ,net705[7] } ),
     .out1            ({net579[0] ,net579[1] ,net579[2] ,net579[3] ,
            net579[4] } ),
     .in10            ({net429[0] ,net429[1] } ),
     .out25           ({net0786[0] ,net0786[1] ,net0786[2] ,net0786[3] ,
            net0786[4] ,net0786[5] ,net0786[6] ,net0786[7] } ),
     .in25            ({net0334[0] ,net0334[1] ,net0334[2] ,net0334[3] ,
            net0334[4] ,net0334[5] ,net0334[6] ,net0334[7] } ),
     .in1             ({net410[0] ,net410[1] ,net410[2] ,net410[3] ,
            net410[4] } ),
     .in4             ({net413[0] ,net413[1] } ),
     .in9             ({net430[0] ,net430[1] } ),
     .out21           (net599 ),
     .out20           (net598 ),
     .out19           (net597 ),
     .out18           (net596 ),
     .out17           (net595 ),
     .out16           (net594 ),
     .out15           (net593 ),
     .out12           (net590 ),
     .out8            (net586 ),
     .out6            (net584 ),
     .out5            (net583 ),
     .out3            (net581 ),
     .out2            (net580 ),
     .in21            (net422 ),
     .in20            (net420 ),
     .in19            (net419 ),
     .in18            (net423 ),
     .in17            (net424 ),
     .in16            (net421 ),
     .in15            (net418 ),
     .in12            (net428 ),
     .out0            (net578 ),
     .in22            (net0530 ),
     .out22           (net0722 ),
     .in24            (net0535 ),
     .out24           (net0727 ),
     .vdd18           (vdd_h ),
     .in2             (net415 ),
     .in5             (net414 ),
     .out11           (net589 ),
     .in3             (net411 ),
     .in11            (net427 ),
     .in0             (net409 ),
     .in6             (net412 ),
     .in8             (net416 ) );
bw_io_ddr_rptr_c I252 (
     .out14           ({net682[0] ,net682[1] ,net682[2] ,net682[3] ,
            net682[4] ,net682[5] ,net682[6] ,net682[7] } ),
     .out13           ({net683[0] ,net683[1] ,net683[2] ,net683[3] ,
            net683[4] ,net683[5] ,net683[6] ,net683[7] } ),
     .out10           ({net679[0] ,net679[1] } ),
     .out9            ({net678[0] ,net678[1] } ),
     .out4            ({net673[0] ,net673[1] } ),
     .in14            ({net808[0] ,net808[1] ,net808[2] ,net808[3] ,
            net808[4] ,net808[5] ,net808[6] ,net808[7] } ),
     .in13            ({net809[0] ,net809[1] ,net809[2] ,net809[3] ,
            net809[4] ,net809[5] ,net809[6] ,net809[7] } ),
     .out1            ({net670[0] ,net670[1] ,net670[2] ,net670[3] ,
            net670[4] } ),
     .in10            ({net566[0] ,net566[1] } ),
     .out25           ({net0429[0] ,net0429[1] ,net0429[2] ,net0429[3] ,
            net0429[4] ,net0429[5] ,net0429[6] ,net0429[7] } ),
     .in25            ({net0480[0] ,net0480[1] ,net0480[2] ,net0480[3] ,
            net0480[4] ,net0480[5] ,net0480[6] ,net0480[7] } ),
     .in1             ({net557[0] ,net557[1] ,net557[2] ,net557[3] ,
            net557[4] } ),
     .in4             ({net560[0] ,net560[1] } ),
     .in9             ({net565[0] ,net565[1] } ),
     .out21           (net690 ),
     .out20           (net689 ),
     .out19           (net688 ),
     .out18           (net687 ),
     .out17           (net686 ),
     .out16           (net685 ),
     .out15           (net684 ),
     .out12           (net681 ),
     .out8            (net677 ),
     .out6            (net675 ),
     .out5            (net674 ),
     .out3            (net672 ),
     .out2            (net671 ),
     .in21            (net577 ),
     .in20            (net576 ),
     .in19            (net575 ),
     .in18            (net574 ),
     .in17            (net573 ),
     .in16            (net572 ),
     .in15            (net571 ),
     .in12            (net568 ),
     .out0            (net669 ),
     .in22            (net0434 ),
     .out22           (net0386 ),
     .in24            (net0439 ),
     .out24           (net0391 ),
     .vdd18           (vdd_h ),
     .in2             (net558 ),
     .in5             (net561 ),
     .out11           (net680 ),
     .in3             (net559 ),
     .in11            (net567 ),
     .in0             (net556 ),
     .in6             (net562 ),
     .in8             (net564 ) );
bw_io_ddr_rptr_c I253 (
     .out14           ({net704[0] ,net704[1] ,net704[2] ,net704[3] ,
            net704[4] ,net704[5] ,net704[6] ,net704[7] } ),
     .out13           ({net705[0] ,net705[1] ,net705[2] ,net705[3] ,
            net705[4] ,net705[5] ,net705[6] ,net705[7] } ),
     .out10           ({net701[0] ,net701[1] } ),
     .out9            ({net700[0] ,net700[1] } ),
     .out4            ({net695[0] ,net695[1] } ),
     .in14            ({net830[0] ,net830[1] ,net830[2] ,net830[3] ,
            net830[4] ,net830[5] ,net830[6] ,net830[7] } ),
     .in13            ({net831[0] ,net831[1] ,net831[2] ,net831[3] ,
            net831[4] ,net831[5] ,net831[6] ,net831[7] } ),
     .out1            ({net692[0] ,net692[1] ,net692[2] ,net692[3] ,
            net692[4] } ),
     .in10            ({net588[0] ,net588[1] } ),
     .out25           ({net0531[0] ,net0531[1] ,net0531[2] ,net0531[3] ,
            net0531[4] ,net0531[5] ,net0531[6] ,net0531[7] } ),
     .in25            ({net0786[0] ,net0786[1] ,net0786[2] ,net0786[3] ,
            net0786[4] ,net0786[5] ,net0786[6] ,net0786[7] } ),
     .in1             ({net579[0] ,net579[1] ,net579[2] ,net579[3] ,
            net579[4] } ),
     .in4             ({net582[0] ,net582[1] } ),
     .in9             ({net587[0] ,net587[1] } ),
     .out21           (net712 ),
     .out20           (net711 ),
     .out19           (net710 ),
     .out18           (net709 ),
     .out17           (net708 ),
     .out16           (net707 ),
     .out15           (net706 ),
     .out12           (net703 ),
     .out8            (net699 ),
     .out6            (net697 ),
     .out5            (net696 ),
     .out3            (net694 ),
     .out2            (net693 ),
     .in21            (net599 ),
     .in20            (net598 ),
     .in19            (net597 ),
     .in18            (net596 ),
     .in17            (net595 ),
     .in16            (net594 ),
     .in15            (net593 ),
     .in12            (net590 ),
     .out0            (net691 ),
     .in22            (net0722 ),
     .out22           (net0482 ),
     .in24            (net0727 ),
     .out24           (net0487 ),
     .vdd18           (vdd_h ),
     .in2             (net580 ),
     .in5             (net583 ),
     .out11           (net702 ),
     .in3             (net581 ),
     .in11            (net589 ),
     .in0             (net578 ),
     .in6             (net584 ),
     .in8             (net586 ) );
bw_io_ddr_rptr_c I254 (
     .out14           ({net808[0] ,net808[1] ,net808[2] ,net808[3] ,
            net808[4] ,net808[5] ,net808[6] ,net808[7] } ),
     .out13           ({net809[0] ,net809[1] ,net809[2] ,net809[3] ,
            net809[4] ,net809[5] ,net809[6] ,net809[7] } ),
     .out10           ({net805[0] ,net805[1] } ),
     .out9            ({net804[0] ,net804[1] } ),
     .out4            ({net799[0] ,net799[1] } ),
     .in14            ({net930[0] ,net930[1] ,net930[2] ,net930[3] ,
            net930[4] ,net930[5] ,net930[6] ,net930[7] } ),
     .in13            ({net931[0] ,net931[1] ,net931[2] ,net931[3] ,
            net931[4] ,net931[5] ,net931[6] ,net931[7] } ),
     .out1            ({net796[0] ,net796[1] ,net796[2] ,net796[3] ,
            net796[4] } ),
     .in10            ({net679[0] ,net679[1] } ),
     .out25           ({net0888[0] ,net0888[1] ,net0888[2] ,net0888[3] ,
            net0888[4] ,net0888[5] ,net0888[6] ,net0888[7] } ),
     .in25            ({net0429[0] ,net0429[1] ,net0429[2] ,net0429[3] ,
            net0429[4] ,net0429[5] ,net0429[6] ,net0429[7] } ),
     .in1             ({net670[0] ,net670[1] ,net670[2] ,net670[3] ,
            net670[4] } ),
     .in4             ({net673[0] ,net673[1] } ),
     .in9             ({net678[0] ,net678[1] } ),
     .out21           (net816 ),
     .out20           (net815 ),
     .out19           (net814 ),
     .out18           (net813 ),
     .out17           (net812 ),
     .out16           (net811 ),
     .out15           (net810 ),
     .out12           (net807 ),
     .out8            (net803 ),
     .out6            (net801 ),
     .out5            (net800 ),
     .out3            (net798 ),
     .out2            (net797 ),
     .in21            (net690 ),
     .in20            (net689 ),
     .in19            (net688 ),
     .in18            (net687 ),
     .in17            (net686 ),
     .in16            (net685 ),
     .in15            (net684 ),
     .in12            (net681 ),
     .out0            (net795 ),
     .in22            (net0386 ),
     .out22           (net0818 ),
     .in24            (net0391 ),
     .out24           (net0823 ),
     .vdd18           (vdd_h ),
     .in2             (net671 ),
     .in5             (net674 ),
     .out11           (net806 ),
     .in3             (net672 ),
     .in11            (net680 ),
     .in0             (net669 ),
     .in6             (net675 ),
     .in8             (net677 ) );
bw_io_ddr_rptr_c I255 (
     .out14           ({net830[0] ,net830[1] ,net830[2] ,net830[3] ,
            net830[4] ,net830[5] ,net830[6] ,net830[7] } ),
     .out13           ({net831[0] ,net831[1] ,net831[2] ,net831[3] ,
            net831[4] ,net831[5] ,net831[6] ,net831[7] } ),
     .out10           ({net827[0] ,net827[1] } ),
     .out9            ({net826[0] ,net826[1] } ),
     .out4            ({net821[0] ,net821[1] } ),
     .in14            ({net952[0] ,net952[1] ,net952[2] ,net952[3] ,
            net952[4] ,net952[5] ,net952[6] ,net952[7] } ),
     .in13            ({net953[0] ,net953[1] ,net953[2] ,net953[3] ,
            net953[4] ,net953[5] ,net953[6] ,net953[7] } ),
     .out1            ({net818[0] ,net818[1] ,net818[2] ,net818[3] ,
            net818[4] } ),
     .in10            ({net701[0] ,net701[1] } ),
     .out25           ({net0633[0] ,net0633[1] ,net0633[2] ,net0633[3] ,
            net0633[4] ,net0633[5] ,net0633[6] ,net0633[7] } ),
     .in25            ({net0531[0] ,net0531[1] ,net0531[2] ,net0531[3] ,
            net0531[4] ,net0531[5] ,net0531[6] ,net0531[7] } ),
     .in1             ({net692[0] ,net692[1] ,net692[2] ,net692[3] ,
            net692[4] } ),
     .in4             ({net695[0] ,net695[1] } ),
     .in9             ({net700[0] ,net700[1] } ),
     .out21           (net838 ),
     .out20           (net837 ),
     .out19           (net836 ),
     .out18           (net835 ),
     .out17           (net834 ),
     .out16           (net833 ),
     .out15           (net832 ),
     .out12           (net829 ),
     .out8            (net825 ),
     .out6            (net823 ),
     .out5            (net822 ),
     .out3            (net820 ),
     .out2            (net01157 ),
     .in21            (net712 ),
     .in20            (net711 ),
     .in19            (net710 ),
     .in18            (net709 ),
     .in17            (net708 ),
     .in16            (net707 ),
     .in15            (net706 ),
     .in12            (net703 ),
     .out0            (net817 ),
     .in22            (net0482 ),
     .out22           (net0578 ),
     .in24            (net0487 ),
     .out24           (net0583 ),
     .vdd18           (vdd_h ),
     .in2             (net693 ),
     .in5             (net696 ),
     .out11           (net828 ),
     .in3             (net694 ),
     .in11            (net702 ),
     .in0             (net691 ),
     .in6             (net697 ),
     .in8             (net699 ) );
bw_io_ddr_rptr_c I256 (
     .out14           ({net930[0] ,net930[1] ,net930[2] ,net930[3] ,
            net930[4] ,net930[5] ,net930[6] ,net930[7] } ),
     .out13           ({net931[0] ,net931[1] ,net931[2] ,net931[3] ,
            net931[4] ,net931[5] ,net931[6] ,net931[7] } ),
     .out10           ({net927[0] ,net927[1] } ),
     .out9            ({net926[0] ,net926[1] } ),
     .out4            ({net921[0] ,net921[1] } ),
     .in14            ({cbd_i_l } ),
     .in13            ({cbu_i_l } ),
     .out1            ({net918[0] ,net918[1] ,net918[2] ,net918[3] ,
            net918[4] } ),
     .in10            ({net805[0] ,net805[1] } ),
     .out25           ({net0684[0] ,net0684[1] ,net0684[2] ,net0684[3] ,
            net0684[4] ,net0684[5] ,net0684[6] ,net0684[7] } ),
     .in25            ({net0888[0] ,net0888[1] ,net0888[2] ,net0888[3] ,
            net0888[4] ,net0888[5] ,net0888[6] ,net0888[7] } ),
     .in1             ({net796[0] ,net796[1] ,net796[2] ,net796[3] ,
            net796[4] } ),
     .in4             ({net799[0] ,net799[1] } ),
     .in9             ({net804[0] ,net804[1] } ),
     .out21           (bypass_enable_out ),
     .out20           (hiz_n_out ),
     .out19           (clock_dr_out ),
     .out18           (shift_dr_out ),
     .out17           (update_dr_out ),
     .out16           (mode_ctrl_out ),
     .out15           (se_o_l ),
     .out12           (net929 ),
     .out8            (net925 ),
     .out6            (dram_io_drive_enable_o_l ),
     .out5            (net922 ),
     .out3            (net920 ),
     .out2            (net919 ),
     .in21            (net816 ),
     .in20            (net815 ),
     .in19            (net814 ),
     .in18            (net813 ),
     .in17            (net812 ),
     .in16            (net811 ),
     .in15            (net810 ),
     .in12            (net807 ),
     .out0            (net917 ),
     .in22            (net0818 ),
     .out22           (ps_select_out ),
     .in24            (net0823 ),
     .out24           (net0631 ),
     .vdd18           (vdd_h ),
     .in2             (net797 ),
     .in5             (net800 ),
     .out11           (net928 ),
     .in3             (net798 ),
     .in11            (net806 ),
     .in0             (net795 ),
     .in6             (net801 ),
     .in8             (net803 ) );
bw_io_ddr_rptr_c I257 (
     .out14           ({net952[0] ,net952[1] ,net952[2] ,net952[3] ,
            net952[4] ,net952[5] ,net952[6] ,net952[7] } ),
     .out13           ({net953[0] ,net953[1] ,net953[2] ,net953[3] ,
            net953[4] ,net953[5] ,net953[6] ,net953[7] } ),
     .out10           ({net949[0] ,net949[1] } ),
     .out9            ({net948[0] ,net948[1] } ),
     .out4            ({net943[0] ,net943[1] } ),
     .in14            ({cbd_i_r } ),
     .in13            ({cbu_i_r } ),
     .out1            ({net940[0] ,net940[1] ,net940[2] ,net940[3] ,
            net940[4] } ),
     .in10            ({net827[0] ,net827[1] } ),
     .out25           ({net0735[0] ,net0735[1] ,net0735[2] ,net0735[3] ,
            net0735[4] ,net0735[5] ,net0735[6] ,net0735[7] } ),
     .in25            ({net0633[0] ,net0633[1] ,net0633[2] ,net0633[3] ,
            net0633[4] ,net0633[5] ,net0633[6] ,net0633[7] } ),
     .in1             ({net818[0] ,net818[1] ,net818[2] ,net818[3] ,
            net818[4] } ),
     .in4             ({net821[0] ,net821[1] } ),
     .in9             ({net826[0] ,net826[1] } ),
     .out21           (net960 ),
     .out20           (net959 ),
     .out19           (net958 ),
     .out18           (net957 ),
     .out17           (net956 ),
     .out16           (net955 ),
     .out15           (net954 ),
     .out12           (net951 ),
     .out8            (net947 ),
     .out6            (net945 ),
     .out5            (net944 ),
     .out3            (net942 ),
     .out2            (net01234 ),
     .in21            (net838 ),
     .in20            (net837 ),
     .in19            (net836 ),
     .in18            (net835 ),
     .in17            (net834 ),
     .in16            (net833 ),
     .in15            (net832 ),
     .in12            (net829 ),
     .out0            (net939 ),
     .in22            (net0578 ),
     .out22           (net0674 ),
     .in24            (net0583 ),
     .out24           (net0679 ),
     .vdd18           (vdd_h ),
     .in2             (net01157 ),
     .in5             (net822 ),
     .out11           (net950 ),
     .in3             (net820 ),
     .in11            (net828 ),
     .in0             (net817 ),
     .in6             (net823 ),
     .in8             (net825 ) );
bw_io_ddr_6sig_x2 I110 (
     .serial_out      ({serial_out[71:64] } ),
     .serial_in       ({serial_in[71:64] } ),
     .afo             ({afo[71:64] } ),
     .afi             ({afi[71:64] } ),
     .vrefcode_i_l    ({net0837[0] ,net0837[1] ,net0837[2] ,net0837[3] ,
            net0837[4] ,net0837[5] ,net0837[6] ,net0837[7] } ),
     .vrefcode_i_r    ({net0334[0] ,net0334[1] ,net0334[2] ,net0334[3] ,
            net0334[4] ,net0334[5] ,net0334[6] ,net0334[7] } ),
     .dq_pad          ({dram_dq__95__ ,dram_dq__94__ ,dram_dq__93__ ,
            dram_dq__92__ ,dram_dq__91__ ,dram_dq__90__ ,dram_dq__89__ ,
            dram_dq__88__ } ),
     .io_dram_data_in ({io_dram_data_in__95__ ,io_dram_data_in__94__ ,
            io_dram_data_in__93__ ,io_dram_data_in__92__ ,
            io_dram_data_in__91__ ,io_dram_data_in__90__ ,
            io_dram_data_in__89__ ,io_dram_data_in__88__ } ),
     .io_dram_data_in_hi ({io_dram_data_in__223__ ,io_dram_data_in__222__
             ,io_dram_data_in__221__ ,io_dram_data_in__220__ ,
            io_dram_data_in__219__ ,io_dram_data_in__218__ ,
            io_dram_data_in__217__ ,io_dram_data_in__216__ } ),
     .data_neg        ({dram_io_data_out__239__ ,dram_io_data_out__238__ ,
            dram_io_data_out__237__ ,dram_io_data_out__236__ ,
            dram_io_data_out__235__ ,dram_io_data_out__234__ ,
            dram_io_data_out__233__ ,dram_io_data_out__232__ } ),
     .data_pos        ({dram_io_data_out__95__ ,dram_io_data_out__94__ ,
            dram_io_data_out__93__ ,dram_io_data_out__92__ ,
            dram_io_data_out__91__ ,dram_io_data_out__90__ ,
            dram_io_data_out__89__ ,dram_io_data_out__88__ } ),
     .dqs_pad         ({dram_dqs__30__ ,dram_dqs__21__ } ),
     .lpf_code_i_r    ({net410[0] ,net410[1] ,net410[2] ,net410[3] ,
            net410[4] } ),
     .dram_io_ptr_clk_inv_i_r ({net413[0] ,net413[1] } ),
     .pad_pos_cnt_i_r ({net430[0] ,net430[1] } ),
     .pad_neg_cnt_i_r ({net429[0] ,net429[1] } ),
     .cbu_i_r         ({net592[0] ,net592[1] ,net592[2] ,net592[3] ,
            net592[4] ,net592[5] ,net592[6] ,net592[7] } ),
     .cbd_i_r         ({net591[0] ,net591[1] ,net591[2] ,net591[3] ,
            net591[4] ,net591[5] ,net591[6] ,net591[7] } ),
     .lpf_code_i_l    ({net438[0] ,net438[1] ,net438[2] ,net438[3] ,
            net438[4] } ),
     .dram_io_ptr_clk_inv_i_l ({net435[0] ,net435[1] } ),
     .pad_pos_cnt_i_l ({net440[0] ,net440[1] } ),
     .pad_neg_cnt_i_l ({net441[0] ,net441[1] } ),
     .cbu_i_l         ({net570[0] ,net570[1] ,net570[2] ,net570[3] ,
            net570[4] ,net570[5] ,net570[6] ,net570[7] } ),
     .cbd_i_l         ({net569[0] ,net569[1] ,net569[2] ,net569[3] ,
            net569[4] ,net569[5] ,net569[6] ,net569[7] } ),
     .ps_select_i_l   (net0770 ),
     .testmode_l_i_l  (net432 ),
     .test_mode_i_l   (net0775 ),
     .testmode_l_i_r  (net416 ),
     .test_mode_i_r   (net0535 ),
     .pad_clk_so      (pad_clk_so4_si5 ),
     .ps_select_i_r   (net0530 ),
     .ctl_pad_1       (dram_addr__0__ ),
     .bso             (bso4_bsi5 ),
     .ctl_data_0      (dram_io_addr__1__ ),
     .pad_clk_si      (pad_clk_so3_si4 ),
     .bypass_enable_i_l (net448 ),
     .vdd_h           (vdd_h ),
     .strobe_i_r      (net409 ),
     .burst_length_four_i_r (net411 ),
     .dram_io_pad_enable_i_r (net414 ),
     .dram_io_drive_enable_i_r (net412 ),
     .rst_l_i_r       (net415 ),
     .arst_l_i_r      (arst_l_i_r ),
     .dram_io_channel_disabled_i_r (net427 ),
     .dram_io_drive_data_i_r (net428 ),
     .se_i_r          (net418 ),
     .mode_ctrl_i_r   (net421 ),
     .shift_dr_i_r    (net423 ),
     .clock_dr_i_r    (net419 ),
     .hiz_n_i_r       (net420 ),
     .update_dr_i_r   (net424 ),
     .strobe_i_l      (net439 ),
     .burst_length_four_i_l (net437 ),
     .dram_io_pad_enable_i_l (net434 ),
     .dram_io_drive_enable_i_l (net436 ),
     .ctl_data_1      (dram_io_addr__0__ ),
     .rst_l_i_l       (net433 ),
     .arst_l_i_l      (arst_l_i_l ),
     .dram_io_channel_disabled_i_l (net443 ),
     .dram_io_drive_data_i_l (net442 ),
     .se_i_l          (net452 ),
     .mode_ctrl_i_l   (net449 ),
     .shift_dr_i_l    (net447 ),
     .clock_dr_i_l    (net451 ),
     .hiz_n_i_l       (net450 ),
     .update_dr_i_l   (net446 ),
     .rclk            (rclk ),
     .bypass_enable_i_r (net422 ),
     .bsi             (bso3_bsi4 ),
     .ctl_pad_0       (dram_addr__1__ ) );
bw_io_ddr_4sig_clk_x2 I119 (
     .vrefcode_i_l    ({net0837[0] ,net0837[1] ,net0837[2] ,net0837[3] ,
            net0837[4] ,net0837[5] ,net0837[6] ,net0837[7] } ),
     .vrefcode_i_r    ({net0334[0] ,net0334[1] ,net0334[2] ,net0334[3] ,
            net0334[4] ,net0334[5] ,net0334[6] ,net0334[7] } ),
     .dram_ck_n       ({dram_ck_n } ),
     .dram_ck_p       ({dram_ck_p } ),
     .cbd_i_l         ({net569[0] ,net569[1] ,net569[2] ,net569[3] ,
            net569[4] ,net569[5] ,net569[6] ,net569[7] } ),
     .cbu_i_l         ({net570[0] ,net570[1] ,net570[2] ,net570[3] ,
            net570[4] ,net570[5] ,net570[6] ,net570[7] } ),
     .cbu_i_r         ({net592[0] ,net592[1] ,net592[2] ,net592[3] ,
            net592[4] ,net592[5] ,net592[6] ,net592[7] } ),
     .cbd_i_r         ({net591[0] ,net591[1] ,net591[2] ,net591[3] ,
            net591[4] ,net591[5] ,net591[6] ,net591[7] } ),
     .pad_clk_si      (pad_clk_so4_si5 ),
     .testmode_l_i_r  (net416 ),
     .pad_clk_so      (pad_clk_so ),
     .testmode_l_i_l  (net432 ),
     .shift_dr_i_l    (net447 ),
     .clock_dr_i_l    (net451 ),
     .se_i_l          (net452 ),
     .update_dr_i_l   (net446 ),
     .mode_ctrl_i_l   (net449 ),
     .hiz_n_i_l       (net450 ),
     .dram_io_clk_enable (dram_io_clk_enable ),
     .bso             (bso ),
     .bsi             (bso4_bsi5 ),
     .se_i_r          (net418 ),
     .mode_ctrl_i_r   (net421 ),
     .shift_dr_i_r    (net423 ),
     .clock_dr_i_r    (net419 ),
     .hiz_n_i_r       (net420 ),
     .update_dr_i_r   (net424 ),
     .rclk            (rclk ),
     .vdd_h           (vdd_h ) );
endmodule
