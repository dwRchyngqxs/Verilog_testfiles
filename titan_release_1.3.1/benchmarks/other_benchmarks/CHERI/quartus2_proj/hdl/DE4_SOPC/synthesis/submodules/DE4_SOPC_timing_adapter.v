// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------
// altera message_level level1

`timescale 1ns / 100ps
module DE4_SOPC_timing_adapter (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [31: 0] in_data,
      input              in_error,
      input              in_startofpacket,
      input              in_endofpacket,
      input      [ 1: 0] in_empty,
      // Interface: out
      input              out_ready,
      output reg         out_valid,
      output reg [31: 0] out_data,
      output reg         out_error,
      output reg         out_startofpacket,
      output reg         out_endofpacket,
      output reg [ 1: 0] out_empty
);




   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------

   reg  [36: 0] in_payload;
   wire [36: 0] out_payload;
   wire         in_ready_wire;
   wire         out_valid_wire;
   wire [ 3: 0] fifo_fill;
   reg  [ 0: 0] ready;


   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data,in_error,in_startofpacket,in_endofpacket,in_empty};
     {out_data,out_error,out_startofpacket,out_endofpacket,out_empty} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| FIFO
   // ---------------------------------------------------------------------
   DE4_SOPC_timing_adapter_fifo DE4_SOPC_timing_adapter_fifo 
     ( 
       .clk        (clk),
       .reset_n    (reset_n),
       .in_ready   (),
       .in_valid   (in_valid),      
       .in_data    (in_payload),
       .out_ready  (ready[0]),
       .out_valid  (out_valid_wire),      
       .out_data   (out_payload),
       .fill_level (fifo_fill)
       );

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
      in_ready = (fifo_fill < 4 );
      out_valid = out_valid_wire;
      ready[0] = out_ready;
   end



endmodule

