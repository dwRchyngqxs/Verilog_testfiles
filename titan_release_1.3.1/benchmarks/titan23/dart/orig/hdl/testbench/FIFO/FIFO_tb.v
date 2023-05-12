`timescale 1ns / 1ps
/* Testbench for RAMFIFO
 */
module FIFO_tb ();

    parameter WIDTH = 16;
    parameter LOG_DEP = 3;
	localparam DEPTH = 1 << LOG_DEP;

    reg                 clock;
    reg                 clock_2x;
    reg                 reset;
    reg    [WIDTH-1: 0] data_in;
    reg                 write;
    reg                 read;

    wire   [WIDTH-1: 0] data_out;
    wire                full;
    wire                empty;
    wire                has_data;

    wire   [WIDTH-1: 0] srl_data_out;
    wire                srl_full;
    wire                srl_empty;

    wire   [WIDTH-1: 0] slow_data_out;
    wire                slow_full;
    wire                slow_empty;
    wire                slow_has_data;

    reg    [WIDTH-1: 0] r_data;
    reg    [WIDTH-1: 0] r_data_srl;
    reg    [WIDTH-1: 0] r_data_fwft;
    
    reg                 wbusy;

    integer i;

	RAMFIFO_single #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP)) uut (
            .clock (clock),
			.clock_2x (clock_2x),
			.reset (reset),
			.data_in (data_in),
			.data_out (data_out),
			.write (write),
			.read (read),
			.full (full),
			.empty (empty),
            .has_data (has_data));

    srl_fifo #(.WIDTH(WIDTH), .LOG_LEN(LOG_DEP)) srl (
        .clock (clock),
        .reset (reset),
        .data_in (data_in),
        .data_out (srl_data_out),
        .write (write),
        .read (read),
        .full (srl_full),
        .empty (srl_empty));
        
    RAMFIFO_single_slow #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP)) slow (
            .clock (clock_2x),
			.reset (reset),
			.data_in (data_in),
			.data_out (slow_data_out),
			.write (write & ~wbusy),
			.read (read),
			.full (slow_full),
			.empty (slow_empty),
            .has_data (slow_has_data));

    /*RAMFIFO_fwft #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP)) latch_fifo (
        .clock (clock),
        .reset (reset),
        .data_in (data_in),
        .data_out (latch_data_out),
        .write (write),
        .read (read),
        .full (latch_full),
        .empty (latch_empty));*/

    // Write to FIFO Task
    task write_value;
        input [WIDTH-1: 0] val;
        begin
            @(posedge clock);
            #12 write   <= 1'b1;
            data_in <= val;
        end
    endtask

    task read_write;
        input [WIDTH-1: 0] val;
        begin
            @(posedge clock);
            #12 write   <= 1'b1;
            read    <= 1'b1;
            data_in <= val;
        end
    endtask

    task read_value;
        begin
            @(posedge clock);
            #12 read    <= 1'b1;
        end
    endtask
    

    initial
    begin
        clock = 1'b0;
        clock_2x = 1'b1;
        reset = 1'b0;
        write = 1'b0;
        read = 1'b0;
        data_in = {(WIDTH){1'b0}};
        
        #1 reset = 1'b1;
        #100 reset = 1'b0;

		for (i = 1; i < DEPTH + 2; i = i + 1)
		begin
			write_value (i);
		end
		
        @(posedge clock); #12 read = 1'b0; write = 1'b0;

        read_value ();
        read_value ();
        read_value ();
        read_value ();
        
        read_write (16'hCAFE);
        read_write (16'hBEDF);
        
        @(negedge clock); read = 1'b0; write = 1'b0;

        for (i = 0; i < DEPTH - 1; i = i + 1)
        begin
            read_value ();
        end

        @(posedge clock); #12 read = 1'b0; write = 1'b0;

        write_value (16'hEDAF);
        write_value (16'h2345);
        write_value (16'h3456);
        read_write (16'h1234);

        /*@(negedge clock); read = 1'b0; write = 1'b0;
        read_value (1);
        read_value (1);
        read_value (1);*/

        @(posedge clock); #12 read = 1'b0; write = 1'b0;

    end

    always #10 clock = ~clock;
    always #5 clock_2x = ~clock_2x;
    
    reg [WIDTH-1:0] rdout;
    reg [WIDTH-1:0] rsrl_dout;
    reg [WIDTH-1:0] rslow_dout;
    
    always @(posedge clock or posedge reset)
    begin
        if (reset)
        begin
            rdout <= {(WIDTH){1'b0}};
            rsrl_dout <= {(WIDTH){1'b0}};
            rslow_dout <= {(WIDTH){1'b0}};
        end
        else
        begin
            if (has_data)
                rdout <= data_out;
            
            if (~srl_empty)
                rsrl_dout <= srl_data_out;
            
            if (slow_has_data)
                rslow_dout <= slow_data_out;
        end
    end
    
    // Make sure we write to RAMFIFO_single_slow once every 2 cycles
    always @(posedge clock_2x or posedge reset)
    begin
        if (reset)
            wbusy <= 1'b0;
        else
            if (wbusy)
                wbusy <= 1'b0;
            else
                wbusy <= write;
    end
endmodule

