--------------------------------------------------------------------------------
              TITAN - Large and Complex Benchmarks for Academic CAD
--------------------------------------------------------------------------------

Change Log
-------------------------------------------------
v1.3.1 - K. E. Murray - Nov 2019
   * Architecture file compatibility updates (e.g. <tiles> tags)
   * Added 'picosoc' and 'murax' benchmarks from symbiflow to 'other_benchmarks'

v1.3.0 - K. E. Murray - May 2019
   * Significantly improved routing architecture capture (hierarchcial wiring, switch box)
   * Improved SDC constraints (fix some bugs and ignores small clocks)
   * Fix grounded clock in sparcT1_chip2
   * Fix share-chain timing model bug
   * Improved IO routing channel connectivity modelling
   * Extended 3-sided routing architecture to non-LAB blocks
   * Improved direct-connect modelling for non-LAB blocks
   * Architecture file compatibility updates for VTR 8

v1.2.10 - K. E. Murray - August 2018
   * Regenerated netlists with Quartus v18.0
   * Architecture file compatibility updates for VTR

v1.2.6 - K. E. Murray - August 2017
   * Added minimum delay timing model for hold timing analysis (thanks to Jasmine Wang!)
   * Improved PLL floorplan modeling

v1.2.0 - K. E. Murray - April 2017
   * Added primitive internal timing for RAM and DSP blocks to stratixiv_arch.timing.xml
   * Added missing pack-patterns for DSP blocks to stratixiv_arch.timing.xml
   * Regenerated netlists with Quartus v16.1
   * Updated vqm2blif to include multi-clock primitives

v1.1.0 - K. E. Murray - July 2014
   * Improved benchmark compatibility with VPR
   * Enhanced architecture capture of Stratix IV
   * Added timing model for Stratix IV
   * Added equivalent VPR and Quartus II timing constraints
   * Fix vqm2blif compatibility with GNU Bison 3.0

v1.0.0 - K. E. Murray - June 2013
   * Initial release

Introduction
-------------------------------------------------
This is a release of the Titan flow and Titan23 benchmark suite.  It also
inclues a VPR compatible architecture description of Altera's Stratix IV
device family including a calibrated timing model.

The Titan23 are a set of 23 large FPGA designs suitable for evaluating new FPGA
Architectures and CAD algorithms.  These designs are significantly larger and 
more complex than the MCNC and VTR benchmarks. They range in size from 91K to 
1869K netlist primitives, and make use of a variety of heterogeneous resources 
such as DSP and RAM blocks.  See benchmarks/benchmark_stats.pdf for more 
information about the benchmarks.

The Titan flow uses Altera's Quartus CAD tool to perform Hardware 
Description Language (HDL) synthesis and elaboration, producing a .vqm file.  
The .vqm file is then converted to the academic .blif format by our vqm2blif 
tool.  The blif file can then be used with tools such as VPR.

This release includes already generated BLIF and VQM netlists.  They were 
generated to target the stratixiv_arch.timing.xml architecture file.

For more information, please see our ACM TRETS paper:
    K. E. Murray, S. Whitty, S. Liu, J. Luu and V. Betz, "Timing Driven Titan: 
          Enabling Large Benchmarks and Exploring the Gap Between Academic and
          Commercial CAD" ACM TRETS, 2014


Directory Structure
-------------------------------------------------
The top level folder of this release should contain the following folders:

    arch:
        Contains architecture files for use with the Titan flow and benchmarks.

    benchmarks:
        Contains both the titan23 benchmark set, and a set of other smaller
        benchmarks.  Each benchmark includes source HDL, along with VQM
        and BLIF netlists.

    scripts:
        Contains scripts for running the titan flow to generate VQM and BLIF 
        files.

    vqm_to_blif:
        Contains the source code for the VQM2BLIF tool which converts from VQM
        to BLIF.

Each directory should contain a README.txt which further describes its 
contents.


Using the BLIF Benchmarks with VPR
-------------------------------------------------
This release includes pre-converted blif files for use with VPR.  These blif
files were converted using the stratixiv_arch.timing.xml architecture, and can be run as 
follows (shown for the smallest 'radar20' benchmark):

    vpr $TITAN_BASE_DIR/arch/stratixiv_arch.timing.xml $TITAN_BASE_DIR/benchmarks/other_benchmarks/radar20/netlists/radar20_stratixiv_arch_timing.blif --route_chan_width 300

where $TITAN_BASE_DIR is the path to the titan release directory (which should
contain this README.txt file).

Notes on options:
    '--route_chan_width 300':   Specifies the channel width to be 300 tracks
                                during routing.


Re-generating or Generating New Netlists
-------------------------------------------------
This can be done using the titan_flow.py script or vqm2blif.exe directly.  See 
scripts/README.txt and vqm_to_blif/README.txt for details.

Acknowledgements
-------------------------------------------------
Authors: Kevin E. Murray, Scott Whitty, Suya Liu, Jason Luu, Vaughn Betz

Funding: NSERC, QEII-GSST, Altera, Texas Instruments, SRC

Compute Resources: SciNet

Benchmark Contributors: Altera, Braiden Brousseau, Deming Chen, Jason Cong, 
                        George Constinides, Zefu Dai, Joseph Garvey, IWLS2005, 
                        Mark Jervis, LegUP, Simon Moore, OpenCores.org, 
                        OpenSparc.net, Kalin Ovtcharov, Alex Rodionov, 
                        Russ Tessier, Danyao Wang, Wei Zhang, and Jianwen Zhu.  

Useful Discussion: David Lewis, Jonathan Rose and Tim Liu
