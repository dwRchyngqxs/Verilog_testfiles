// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_clk_cl_iobdg_jbus.v
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
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:	iobdg clock macro
//  Description:        Clock macro that encapsulates the cluster header.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include "../../include/sys.h" // system level definition file which contains the 
			// time scale definition
`include "../../include/iop.h"


////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////


module bw_clk_cl_iobdg_jbus (/*AUTOARG*/
   // Outputs
   so, rclk, dbginit_l, cluster_grst_l, 
   // Inputs
   si, se, grst_l, gdbginit_l, gclk, cluster_cken, arst_l, 
   adbginit_l
   );
   
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		adbginit_l;		// To cluster_header of cluster_header.v
   input		arst_l;			// To cluster_header of cluster_header.v
   input		cluster_cken;		// To cluster_header of cluster_header.v
   input		gclk;			// To cluster_header of cluster_header.v
   input		gdbginit_l;		// To cluster_header of cluster_header.v
   input		grst_l;			// To cluster_header of cluster_header.v
   input		se;			// To cluster_header of cluster_header.v
   input		si;			// To cluster_header of cluster_header.v
   // End of automatics
   
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		cluster_grst_l;		// From cluster_header of cluster_header.v
   output		dbginit_l;		// From cluster_header of cluster_header.v
   output		rclk;			// From cluster_header of cluster_header.v
   output		so;			// From cluster_header of cluster_header.v
   // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   // End of automatics

   
////////////////////////////////////////////////////////////////////////
// Code start here 
////////////////////////////////////////////////////////////////////////
   cluster_header cluster_header (/*AUTOINST*/
				  // Outputs
				  .dbginit_l(dbginit_l),
				  .cluster_grst_l(cluster_grst_l),
				  .rclk	(rclk),
				  .so	(so),
				  // Inputs
				  .gclk	(gclk),
				  .cluster_cken(cluster_cken),
				  .arst_l(arst_l),
				  .grst_l(grst_l),
				  .adbginit_l(adbginit_l),
				  .gdbginit_l(gdbginit_l),
				  .si	(si),
				  .se	(se));


endmodule // bw_clk_cl_iobdg_jbus


// Local Variables:
// verilog-library-directories:("." "../../common/rtl")
// End:
