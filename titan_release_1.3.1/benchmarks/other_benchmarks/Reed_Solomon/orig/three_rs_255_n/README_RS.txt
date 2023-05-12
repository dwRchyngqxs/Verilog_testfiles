README for RS_Decoder

This design implements a triple decoder RS (255,n) decoding system in Verilog.
The main module "top_rs_decode.v", is paramaterized via which switch (ex. `define K217) is turned on at the top of the module.
Ensure only one switch is active at any time for correct operation.
The system contains three decoders, with varying thresholds.
The valid K values are 217,221,225,233,237, and 239.
There are seperate vector waveform files for each k value (top_rs_decode217, etc), which can be used for testing.
In addition, Verilog testbench files (top_rs_decode<N>.vt) have been created from the results of simulating at 50MHz.
The size of the design varies with K, from 14k LUTs for K=239, to 28k LUTs for K=217.

Input Vectors are preloaded into memory.