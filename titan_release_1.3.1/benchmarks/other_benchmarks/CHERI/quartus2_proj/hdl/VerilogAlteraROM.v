/*****************************************************************************
 Copyright (c) 2012 Simon William Moore <simon.moore@cl.cam.ac.uk>
 All rights reserved.

 This software was previously released by the author to students at
 the University of Cambridge and made freely available on the web.  It
 has been included for this project under the following license.
 
 This software was developed by SRI International and the University of
 Cambridge Computer Laboratory under DARPA/AFRL contract (FA8750-10-C-0237)
 ("CTSRD"), as part of the DARPA CRASH research programme.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.

 *****************************************************************************

 Paramererised Verilog Altera ROM
 ================================
 
 Verilog stub for Altera's Quartus tools to provide a generic ROM interface 
 for AlteraROM.bsv

 *****************************************************************************/

module VerilogAlteraROM(clk, v_addr, v_data, v_en, v_rdy);

  parameter ADDRESS_WIDTH=11;
  parameter MEM_SIZE=(1<<ADDRESS_WIDTH);
  parameter DATA_WIDTH=8;
  parameter FILENAME="your_rom_data.mif";

  input                       clk;
  input [ADDRESS_WIDTH-1:0]   v_addr;
  output reg [DATA_WIDTH-1:0] v_data;
  input                       v_en;
  output reg                  v_rdy;

  (* ram_init_file = FILENAME *) reg [DATA_WIDTH-1:0]    rom [0:MEM_SIZE-1];
  
  always @(posedge clk) begin
    v_rdy <= v_en;
    if(v_en)
      v_data <= rom[v_addr];
  end

endmodule // Verilog_AlteraROM
