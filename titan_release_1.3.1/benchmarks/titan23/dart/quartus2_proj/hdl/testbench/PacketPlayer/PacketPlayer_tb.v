`timescale 1ns / 1ps
/* PacketPlayer Testbench
 */
`include "../../const.v"
module PacketPlayer_tb;

    reg clock;
    reg reset;
    reg enable;
    reg [9:0] sim_time;
    wire error;
    wire is_quiescent;

    reg [31:0] packet_in;
    reg packet_in_valid;
    wire packet_request;

    wire [1:0] flit_out_valid;
    reg [1:0] r_flit_out_valid;


    PacketPlayer #(.HADDR(8'h1B), .NVCS(2)) uut (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .sim_time (sim_time),
        .error (error),
        .is_quiescent (is_quiescent),
        .config_in (16'h00),
        .config_in_valid (1'b0),
        .config_out (),
        .config_out_valid (),
        .stats_shift (1'b0),
        .stats_in (16'h00),
        .stats_out (),
        .packet_in (packet_in),
        .packet_in_valid (packet_in_valid),
        .packet_request (packet_request),
        .flit_in (36'h0),
        .flit_in_valid (1'b0),
        .nexthop_in (5'h00),
        .flit_ack (),
        .flit_out (),
        .flit_out_valid (flit_out_valid),
        .dequeue (r_flit_out_valid),
        .credit_out (),
        .credit_out_valid ());


    always @(posedge clock)
    begin
        if (reset)
            r_flit_out_valid <= 0;
        else
            r_flit_out_valid <= flit_out_valid;
    end

    reg [1:0] counter;
    always @(posedge clock)
    begin
        if (reset)
            counter <= 0;
        else if (enable)
            counter <= counter + 1;
    end

    always @(posedge clock)
    begin
        if (reset)
            sim_time <= 0;
        else if (enable == 1'b1 && (&counter == 1))
            sim_time <= sim_time + 1;
    end

    always #5 clock = ~clock;


    reg measure;
    reg [9:0] inj_time;
    reg vc;
    reg [3:0] psize;
    reg [6:0] dest_id;
    reg [6:0] src_id;

    integer i;
    initial begin
        clock = 0;
        reset = 0;
        enable = 0;
        packet_in = 0;
        packet_in_valid = 0;

        measure = 1'b0;
        inj_time = 10'h0;
        vc = 0;
        psize = 0;
        dest_id = 0;
        src_id = 0;

        #1 reset = 1;
        #20 reset = 0;
        #10 enable = 1;

        for (i = 0; i < 60; i = i + 1)
        begin
            #10;

            if (i < 5)
                measure = 1'b0;
            else
                measure = 1'b1;

            inj_time = i;
            vc = i >> 1;
            psize = 3;

            if (packet_request)
            begin
                packet_in_valid = 1;
                
                if (i%2 == 1)
                begin
                    packet_in[31] = 1'b0;
                    packet_in[`P_MEASURE] = measure;
                    packet_in[`P_INJ] = inj_time;
                    packet_in[`P_VC] = vc;
                    packet_in[`P_SIZE] = psize;
                    packet_in[`P_DEST] = 8'hEE;
                    packet_in[`P_SRC] = 8'h1A;
                    $display ("%x measure %d inj %d vc %d log_psize %d dest EE src 1A",
                        packet_in, measure, inj_time, vc, psize);
                end
                else
                begin
                    packet_in[31] = 1'b0;
                    packet_in[`P_MEASURE] = measure;
                    packet_in[`P_INJ] = inj_time;
                    packet_in[`P_VC] = vc;
                    packet_in[`P_SIZE] = psize;
                    packet_in[`P_DEST] = 8'h10;
                    packet_in[`P_SRC] = 8'h1B;
                    $display ("%x measure %d inj %d vc %d log_psize %d dest %x src %x",
                        packet_in, measure, inj_time, vc, psize, packet_in[`P_DEST], packet_in[`P_SRC]);
                end
            end
        end

        packet_in_valid = 0;
    end


    
endmodule

