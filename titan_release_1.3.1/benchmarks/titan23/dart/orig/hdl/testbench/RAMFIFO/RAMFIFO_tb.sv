`timescale 1ns / 1ps
/* Testbench for RAMFIFO
 */
module RAMFIFO_tb ();

    parameter WIDTH = 16;
    parameter LOG_DEP = 3;
	parameter LOG_CTX = 3;
	localparam DEPTH = 1 << LOG_DEP;
	localparam NUM_CTX = 1 << LOG_CTX;

    reg                 clock;
    reg                 clock_2x;
    reg                 reset;
	reg  [LOG_CTX-1: 0] wcc;
    reg  [LOG_CTX-1: 0] rcc;
    reg    [WIDTH-1: 0] data_in;
    reg                 write;
    reg                 read;

    wire  [NUM_CTX-1:0][WIDTH-1:0] data_out;
    wire  [NUM_CTX-1:0] full;
    wire  [NUM_CTX-1:0] empty;
    wire  [NUM_CTX-1:0] has_data;
    wire                error;
    
    wire  [NUM_CTX-1:0][WIDTH-1:0] slow_data_out;
    wire  [NUM_CTX-1:0] slow_full;
    wire  [NUM_CTX-1:0] slow_empty;
    wire  [NUM_CTX-1:0] slow_has_data;
    wire                slow_error;

    wire  [NUM_CTX-1:0][WIDTH-1:0] pack_data_out;
    wire  [NUM_CTX-1:0] pack_full;
    wire  [NUM_CTX-1:0] pack_empty;
    wire  [NUM_CTX-1:0] pack_has_data;
    wire                pack_error;

    reg                 auto_read;
    reg    [WIDTH-1: 0] r_auto_read_dout;
    reg                 wbusy;

    integer i, c;

	RAMFIFO #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP), .LOG_CTX(LOG_CTX)) uut (
			.clock (clock),
            .clock_2x (clock_2x),
			.reset (reset),
			.wcc_id (wcc),
            .rcc_id (rcc),
			.data_in (data_in),
			.data_out (data_out),
			.write (write),
			.read (read),
			.full (full),
			.empty (empty),
            .has_data (has_data),
            .error (error));
    
    RAMFIFO_slow #(.WIDTH(WIDTH), .LOG_DEP(LOG_DEP), .LOG_CTX(LOG_CTX)) slow (
			.clock (clock_2x),
			.reset (reset),
			.wcc_id (wcc),
            .rcc_id (rcc),
			.data_in (data_in),
			.data_out (slow_data_out),
			.write (write & ~wbusy),
			.read (read),
			.full (slow_full),
			.empty (slow_empty),
            .has_data (slow_has_data),
            .error (slow_error));

    PackedFIFO #(.WIDTH(WIDTH), .logDEPTH(LOG_DEP), .logN(LOG_CTX)) pack (
        .clock (clock_2x),
        .reset (reset),
        .wid (wcc),
        .rid (rcc),
        .data_in (data_in),
        .data_out (pack_data_out),
        .write (write & ~wbusy),
        .read (read),
        .full (pack_full),
        .empty (pack_empty),
        .has_data (pack_has_data),
        .error (pack_error));


    reg [NUM_CTX-1:0] comp_error_slow;
    reg [NUM_CTX-1:0] comp_error_pack;
    always @(*)
    begin
        for (i = 0; i < NUM_CTX; i = i + 1)
        begin
            if (has_data[i] == 1 && data_out[i] != slow_data_out[i])
                comp_error_slow = 1;
            else
                comp_error_slow = 0;

            if (has_data[i] == 1 && data_out[i] != pack_data_out[i])
                comp_error_pack = 1;
            else
                comp_error_pack = 0;
        end
    end

    // Write to FIFO Task
    task write_value;
        input [WIDTH-1: 0] val;
		input [LOG_CTX-1:0] id;
        begin
            @(negedge clock);
            #12 write   <= 1'b1;
            data_in <= val;
			wcc <= id;
        end
    endtask

    task read_write;
        input [WIDTH-1: 0] val;
		input [LOG_CTX-1:0] wid;
        input [LOG_CTX-1:0] rid;
        begin
            @(negedge clock);
            #12 write   <= 1'b1;
            read    <= 1'b1;
			wcc     <= wid;
            rcc     <= rid;
            data_in <= val;
        end
    endtask

    task read_value;
	    input [LOG_CTX-1:0] id;
        begin
            @(negedge clock);
            #12 read    <= 1'b1;
			rcc     <= id;
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
        wcc = 0;
        rcc = 0;
        auto_read = 0;
        
        #1 reset = 1'b1;
        #100 reset = 1'b0;

		for (i = 0; i < DEPTH + 1; i = i + 1)
		begin
			for (c = 0; c < NUM_CTX; c = c + 1)
			begin
				write_value (i * NUM_CTX + c, c);
			end
		end
		
        @(negedge clock); #12 read = 1'b0; write = 1'b0;

        read_value (0);
        read_value (1);
        read_value (2);
        read_value (3);
        
        read_write (16'hCAFE, 1, 2);
        read_write (16'hBEDF, 2, 1);
        
        @(negedge clock); #12 read = 1'b0; write = 1'b0;

        for (i = 0; i < DEPTH - 1; i = i + 1)
        begin
            read_value (1);
        end

        @(negedge clock); #12 read = 1'b0; write = 1'b0;

        write_value (16'hEDAF, 1);
        write_value (16'h2345, 1);
        write_value (16'h3456, 1);
        read_write (16'h1234, 1, 3);

        /*@(negedge clock); read = 1'b0; write = 1'b0;
        read_value (1);
        read_value (1);
        read_value (1);*/

        @(negedge clock); #12 read = 1'b0; write = 1'b0;

        // Start auto read from FIFO 1
        rcc = 1;
        auto_read = 1;
    end

    always @(*)
    begin
        if (auto_read == 1)
        begin
            read = ~empty[1];
        end
    end

    always @(posedge clock or posedge reset)
    begin
        if (reset)
            r_auto_read_dout <= 0;
        else if (auto_read & read)
            r_auto_read_dout <= data_out[1];
    end

    always #10  clock = ~clock;
    always #5   clock_2x = ~clock_2x;
    
    
    reg [NUM_CTX-1:0][WIDTH-1:0] rdout, rslow_dout;
    always @(posedge clock or posedge reset)
    begin
        if (reset)
        begin
            rdout <= {(NUM_CTX*WIDTH){1'b0}};
            rslow_dout <= {(NUM_CTX*WIDTH){1'b0}};
        end
        else
        begin
            rdout <= data_out;
            rslow_dout <= slow_data_out;
        end
    end
    
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

