// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_clk_cclk_hdr_64x.v
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
module bw_clk_cclk_hdr_64x (/*AUTOARG*/
   // Outputs
   rst_l, dbginit_l, clk, so, 
   // Inputs
   gclk, cluster_cken, arst_l, grst_l, adbginit_l, gdbginit_l, si, se,
	rclk
   );

   input       gclk;
   input       rclk;
   input       cluster_cken;
   input       arst_l;
   input       grst_l;
   input       adbginit_l;
   input       gdbginit_l; 
   output      dbginit_l; 
   output      rst_l;
   output      clk;

   input       si;  //scan ports for reset flop repeaters
   input       se;
   output      so;
   
   wire        pre_sync_enable;
   wire        sync_enable;
   wire        cluster_grst_l;
   wire        dbginit_l;
   wire        rst_sync_so;

   bw_u1_syncff_4x sync_cluster_master ( // no scan hook-up
                                        .so(),
                                        .q (pre_sync_enable),
                                        .ck (gclk),
                                        .d (cluster_cken),
                                        .sd(1'b0),
                                        .se(1'b0)
				        );
   

   bw_u1_scanlg_2x sync_cluster_slave ( // use scan lock-up latch
                                       .so (sync_enable),
                                       .ck (gclk),
                                       .sd (pre_sync_enable),
                                       .se(1'b1)
        			       );
   
// NOTE! Pound delay in the below statement is meant to provide 10 ps
// delay between gclk and rclk to allow the synchronizer for rst, dbginit,
// and sync pulses to be modelled accurately.  gclk and rclk need to have 
// at least one simulator timestep separation to allow the flop->flop 
// synchronizer to work correctly.
   assign #10 clk = gclk & sync_enable;

   synchronizer_asr rst_repeater (
				 .sync_out(rst_l),
				 .so(rst_sync_so),
				 .async_in(grst_l),
				 .gclk(gclk),
				 .rclk(rclk),
				 .arst_l(arst_l),
				 .si(si),
				 .se(se)
				 );
   
   synchronizer_asr dbginit_repeater (
				     .sync_out(dbginit_l),
				     .so(so),
				     .async_in(gdbginit_l),
				     .gclk(gclk),
				     .rclk(rclk),
				     .arst_l(adbginit_l),
				     .si(rst_sync_so),
				     .se(se)
				     );


endmodule // bw_clk_cclk_hdr_64x