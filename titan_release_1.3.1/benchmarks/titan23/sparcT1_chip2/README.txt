---------------------------------------------------------------------------
OpenSPARC T1 Chip 2 - FPGA Benchmark
---------------------------------------------------------------------------

This benchmark is based off of the OpenSPARC project:
    http://www.opensparc.net/opensparc-t1/index.html
with modifications by Henry Wong and Kevin Murray for compatibility with 
Altera's Quartus 2 tool.

It consists of two SPARC T1 CPU cores along with all of the associated
chip level blocks (Cache Crossbar, DDR controllers etc.), excluding 
the L2 cache data.

The top level module is called 'OpenSPARCT1', and the original can be found 
in the file:
    quartus2_proj/hdl_src/design/sys/iop/rtl/iop.v

This benchmark has been scaled to fit on the largest StratixIV device
(EP4SE820F43I3), where it successfully completes place and route with 
Quartus 2 v12.0 at 95% LAB utilization.

This benchmark can be scaled by changing what blocks are instantiated 
at the to level by modifying: 
    quartus2_proj/hdl_src/design/sys/iop/include/chip_config.h
Large blocks should also be placed in design partitions within Quartus 2. 

---------------------------------------------------------------------------
Running the benchmark
---------------------------------------------------------------------------

A Quartus 2 project (opensparcT1_chip2.qpf) can be found in the 'quartus2_proj'
directory.

Resource usage for StratixIV:
    ALUTs   : 368430
    REGs    : 429350
    DSP     : 24
    MEMBITS : 1585435

A post technology mapping VQM file generated by Quartus 2 targeting
the StratixIV device family can be found in the 'vqm' directory.

A BLIF file created by the vqm2blif tool can be found in the 'blif'
directory.

---------------------------------------------------------------------------
Liscensing
---------------------------------------------------------------------------
See License_info.txt

