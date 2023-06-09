// Verilog has syntax for raw identifiers, where you start it with \ and end it with a space.
// This test crashes Quartus due to it parsing \a[10] as a wire slice and not a raw identifier.
module top();
  (* keep *) wire [31:0] \a[10] ;
  (* keep *) wire b;
  assign b = \a[10] [31];
endmodule
