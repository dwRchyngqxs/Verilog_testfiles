module top;
parameter DATADEPTH=2;
parameter DATAWIDTH=1;
(* keep, nomem2reg *) reg [DATAWIDTH-1:0] data1 [DATADEPTH-1:0];
(* keep, mem2reg *) reg [DATAWIDTH-1:0] data2 [DATADEPTH-1:0];
endmodule
