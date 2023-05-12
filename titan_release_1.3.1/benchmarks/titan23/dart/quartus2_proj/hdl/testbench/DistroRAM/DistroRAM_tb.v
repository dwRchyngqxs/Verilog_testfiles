`timescale 1ns / 1ps
/* Testbench for DistroRAM
 */
module DistroRAM_tb ();

    parameter WIDTH = 8;
    parameter LOG_DEP = 3;
	localparam DEPTH = 1 << LOG_DEP;

    reg                 clock;
    reg                 wen;
    reg  [LOG_DEP-1: 0] addr;
    reg    [WIDTH-1: 0] din;

    wire   [WIDTH-1: 0] dout;


	DistroRAM #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP)) uut (
			.clock (clock),
            .wen (wen),
            .addr (addr),
            .din (din),
            .dout (dout));

    // Write to FIFO Task
    task write_value;
        input [WIDTH-1: 0] val;
		input [LOG_DEP-1:0] id;
        begin
            @(negedge clock);
            wen     <= 1'b1;
            din     <= val;
			addr    <= id;
        end
    endtask

    task read_value;
	    input [LOG_DEP-1: 0] id;
        begin
            @(negedge clock);
			addr    <= id;
        end
    endtask

    initial begin
        clock = 0;
        wen = 0;
        addr = 0;
        din = 0;

        #20;
        write_value (8'hCA, 0);
        write_value (8'hBE, 2);
        write_value (8'hDF, 5);
        write_value (8'hEA, 1);
        write_value (8'h99, 4);
        write_value (8'h80, 3);

        @(negedge clock); wen = 0;
        read_value (2);

        write_value (8'h35, 7);
        write_value (8'h22, 6);

        @(negedge clock); wen = 0;
        read_value (0);
        read_value (1);
        read_value (2);
        read_value (3);
        read_value (4);
        read_value (5);
        read_value (6);
        read_value (7);
    end

    always #5 clock = ~clock;
endmodule

