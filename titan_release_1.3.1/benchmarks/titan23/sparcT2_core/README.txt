---------------------------------------------------------------------------
OpenSPARC T2 Core - FPGA Benchmark
---------------------------------------------------------------------------

This benchmark is based off of the OpenSPARC project:
    http://www.opensparc.net/opensparc-t2/index.html
with modifications by Henry Wong for compatibility with Altera's 
Quartus 2 tool.

It consists of a single SPARC T2 CPU core.

The top level module is called 'spc', and can be found in the file:
    orig/design/sys/iop/spc/rtl/spc.v

---------------------------------------------------------------------------
Running the benchmark
---------------------------------------------------------------------------

A Quartus 2 project (cpu.qpf) can be found in the 'quartus2_proj'
directory.

Resource usage for StratixIV:
    ALUTs   : 169593
    REGs    : 109624
    DSP     : 0
    MEMBITS : 371917

A post technology mapping VQM file generated by Quartus 2 targeting
the StratixIV device family can be found in the 'vqm' directory.

A BLIF file created by the vqm2blif tool can be found in the 'blif'
directory.

---------------------------------------------------------------------------
Liscensing
---------------------------------------------------------------------------
See License_info.txt

