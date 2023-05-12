`include "const.v"

module sim32_9x9 (
    input clock,
    input reset,
    input enable,
    input stop_injection,
    input measure,
    output reg [`TS_WIDTH-1:0] sim_time,
    output sim_time_tick,
    output error,
    output quiescent,
    input [15:0] config_in,
    input config_in_valid,
    output [15:0] config_out,
    output config_out_valid,
    output [15:0] stats_out,
    input stats_shift
);

	parameter SIZE = 9;
	parameter NUM = 4;        // Number of nodes connected to the partition

    // Internal states
    reg tick_counter;

    wire [0:0] can_increment;
    wire [0:0] can_tick;
    wire [SIZE-1:0] part_error;
    wire [SIZE-1:0] part_quiescent;
    wire [SIZE-1:0] part_can_increment;
    wire [15:0] part_config_in [SIZE:0];
    wire [SIZE:0] part_config_in_valid;
    wire [15:0] part_ram_config_in [SIZE:0];
    wire [SIZE:0] part_ram_config_in_valid;
    wire [15:0] part_stats_in [SIZE:0];
    wire [SIZE-1:0] fdp_error;
    wire [SIZE-1:0] fdp_select [SIZE-1:0];
    wire [SIZE-1:0] cdp_error;
    wire [SIZE-1:0] cdp_select [SIZE-1:0];
    wire [SIZE-1:0] fsp_select [SIZE-1:0];
    wire [SIZE-1:0] fsp_can_increment;
    wire [SIZE-1:0] csp_select [SIZE-1:0];
    wire [SIZE-1:0] csp_can_increment;
    wire [SIZE*`A_WIDTH-1:0] fsp_s1_nexthop;
    wire [SIZE-1:0] fsp_s1_valid;
    wire [SIZE-1:0] fsp_s1_valid_urgent;
    wire [SIZE*`FLIT_WIDTH-1:0] fsp_s2_data;
    wire [SIZE*`A_WIDTH-1:0] fsp_s2_nexthop;
    wire [SIZE*`A_WIDTH-1:0] csp_s1_nexthop;
    wire [SIZE-1:0] csp_s1_valid;
    wire [SIZE-1:0] csp_s1_valid_urgent;
    wire [SIZE*`CREDIT_WIDTH-1:0] csp_s2_data;
    wire [SIZE*`A_WIDTH-1:0] csp_s2_nexthop;

    assign sim_time_tick = enable & can_increment & can_tick;
    assign error = (|part_error) | (|fdp_error) | (|cdp_error);
    assign quiescent = &part_quiescent;
    assign can_increment = (&part_can_increment) & (&fsp_can_increment) & (&csp_can_increment);
    assign config_out = part_config_in[SIZE];
    assign config_out_valid = part_config_in_valid[SIZE];
    assign stats_out = part_stats_in[SIZE];

    assign part_config_in_valid[0] = config_in_valid;
    assign part_config_in[0] = config_in;
    assign part_ram_config_in_valid[0] = config_in_valid;
    assign part_ram_config_in[0] = config_in;
    assign part_stats_in[0] = 16'h0000;


    always @(posedge clock)
    begin
        if (reset)
            sim_time <= 16'h0;
        else if (sim_time_tick)
            sim_time <= sim_time + 1;
    end
    always @(posedge clock)
    begin
        if (reset)
            tick_counter <= 1'b0;
        else if (enable)
        begin
            if (sim_time_tick)
                tick_counter <= 1'b0;
            else if (~tick_counter)
                tick_counter <= tick_counter + 1'b1;
        end
    end
    assign can_tick = tick_counter;


    wire [NUM-1:0] fsp_0_vec_valid;
    wire [NUM-1:0] fsp_0_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_0_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_0_vec_nexthop;
    wire [NUM-1:0] fsp_0_vec_dequeue;
    wire [NUM-1:0] csp_0_vec_valid;
    wire [NUM-1:0] csp_0_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_0_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_0_vec_nexthop;
    wire [NUM-1:0] csp_0_vec_dequeue;
    wire [0:0] fdp_0_valid;
    wire [`FLIT_WIDTH-1:0] fdp_0_data;
    wire [`A_FQID] fdp_0_nexthop;
    wire [0:0] fdp_0_ack;
    wire [0:0] cdp_0_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_0_data;
    wire [`A_FQID] cdp_0_nexthop;
    wire [0:0] cdp_0_ack;

    Partition #(.DPID(0), .N(NUM)) part_0 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[0]),
        .is_quiescent (part_quiescent[0]),
        .can_increment (part_can_increment[0]),
        .config_in_valid (part_config_in_valid[0]),
        .config_in (part_config_in[0]),
        .config_out_valid (part_config_in_valid[1]),
        .config_out (part_config_in[1]),
        .ram_config_in_valid (part_ram_config_in_valid[0]),
        .ram_config_in (part_ram_config_in[0]),
        .ram_config_out_valid (part_ram_config_in_valid[1]),
        .ram_config_out (part_ram_config_in[1]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[0]),
        .stats_out (part_stats_in[1]),
        .fsp_vec_valid (fsp_0_vec_valid),
        .fsp_vec_valid_urgent (fsp_0_vec_valid_urgent),
        .fsp_vec_data (fsp_0_vec_data),
        .fsp_vec_nexthop (fsp_0_vec_nexthop),
        .fsp_vec_dequeue (fsp_0_vec_dequeue),
        .csp_vec_valid (csp_0_vec_valid),
        .csp_vec_valid_urgent (csp_0_vec_valid_urgent),
        .csp_vec_data (csp_0_vec_data),
        .csp_vec_nexthop (csp_0_vec_nexthop),
        .csp_vec_dequeue (csp_0_vec_dequeue),
        .fdp_valid (fdp_0_valid),
        .fdp_data (fdp_0_data),
        .fdp_nexthop (fdp_0_nexthop),
        .fdp_ack (fdp_0_ack),
        .cdp_valid (cdp_0_valid),
        .cdp_data (cdp_0_data),
        .cdp_nexthop (cdp_0_nexthop),
        .cdp_ack (cdp_0_ack)
    );

    ICDestPart #(.PID(0), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_0 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[0]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[0]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_0_ack),
        .s3_data_out (fdp_0_data),
        .s3_nexthop_out (fdp_0_nexthop),
        .s3_data_valid (fdp_0_valid)
    );

    ICDestPart #(.PID(0), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_0 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[0]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[0]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_0_ack),
        .s3_data_out (cdp_0_data),
        .s3_nexthop_out (cdp_0_nexthop),
        .s3_data_valid (cdp_0_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_0 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[0]),
        .can_increment (fsp_can_increment[0]),
        .src_data_valid (fsp_0_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_0_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_0_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_0_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_0_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[`ADDR_WIDTH-1:0]),
        .s1_valid (fsp_s1_valid[0]),
        .s1_valid_urgent (fsp_s1_valid_urgent[0]),
        .s2_data_out (fsp_s2_data[`FLIT_WIDTH:0]),
        .s2_nexthop_out (fsp_s2_nexthop[`ADDR_WIDTH-1:0])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_0 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[0]),
        .can_increment (csp_can_increment[0]),
        .src_data_valid (csp_0_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_0_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_0_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_0_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_0_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[`ADDR_WIDTH-1:0]),
        .s1_valid (csp_s1_valid[0]),
        .s1_valid_urgent (csp_s1_valid_urgent[0]),
        .s2_data_out (csp_s2_data[`CREDIT_WIDTH-1:0]),
        .s2_nexthop_out (csp_s2_nexthop[`ADDR_WIDTH-1:0])
    );

    wire [NUM-1:0] fsp_1_vec_valid;
    wire [NUM-1:0] fsp_1_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_1_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_1_vec_nexthop;
    wire [NUM-1:0] fsp_1_vec_dequeue;
    wire [NUM-1:0] csp_1_vec_valid;
    wire [NUM-1:0] csp_1_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_1_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_1_vec_nexthop;
    wire [NUM-1:0] csp_1_vec_dequeue;
    wire [0:0] fdp_1_valid;
    wire [`FLIT_WIDTH-1:0] fdp_1_data;
    wire [`A_FQID] fdp_1_nexthop;
    wire [0:0] fdp_1_ack;
    wire [0:0] cdp_1_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_1_data;
    wire [`A_FQID] cdp_1_nexthop;
    wire [0:0] cdp_1_ack;

    Partition #(.DPID(1), .N(NUM)) part_1 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[1]),
        .is_quiescent (part_quiescent[1]),
        .can_increment (part_can_increment[1]),
        .config_in_valid (part_config_in_valid[1]),
        .config_in (part_config_in[1]),
        .config_out_valid (part_config_in_valid[2]),
        .config_out (part_config_in[2]),
        .ram_config_in_valid (part_ram_config_in_valid[1]),
        .ram_config_in (part_ram_config_in[1]),
        .ram_config_out_valid (part_ram_config_in_valid[2]),
        .ram_config_out (part_ram_config_in[2]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[1]),
        .stats_out (part_stats_in[2]),
        .fsp_vec_valid (fsp_1_vec_valid),
        .fsp_vec_valid_urgent (fsp_1_vec_valid_urgent),
        .fsp_vec_data (fsp_1_vec_data),
        .fsp_vec_nexthop (fsp_1_vec_nexthop),
        .fsp_vec_dequeue (fsp_1_vec_dequeue),
        .csp_vec_valid (csp_1_vec_valid),
        .csp_vec_valid_urgent (csp_1_vec_valid_urgent),
        .csp_vec_data (csp_1_vec_data),
        .csp_vec_nexthop (csp_1_vec_nexthop),
        .csp_vec_dequeue (csp_1_vec_dequeue),
        .fdp_valid (fdp_1_valid),
        .fdp_data (fdp_1_data),
        .fdp_nexthop (fdp_1_nexthop),
        .fdp_ack (fdp_1_ack),
        .cdp_valid (cdp_1_valid),
        .cdp_data (cdp_1_data),
        .cdp_nexthop (cdp_1_nexthop),
        .cdp_ack (cdp_1_ack)
    );

    ICDestPart #(.PID(1), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_1 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[1]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[1]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_1_ack),
        .s3_data_out (fdp_1_data),
        .s3_nexthop_out (fdp_1_nexthop),
        .s3_data_valid (fdp_1_valid)
    );

    ICDestPart #(.PID(1), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_1 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[1]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[1]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_1_ack),
        .s3_data_out (cdp_1_data),
        .s3_nexthop_out (cdp_1_nexthop),
        .s3_data_valid (cdp_1_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_1 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[1]),
        .can_increment (fsp_can_increment[1]),
        .src_data_valid (fsp_1_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_1_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_1_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_1_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_1_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[2*`ADDR_WIDTH-1:`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[1]),
        .s1_valid_urgent (fsp_s1_valid_urgent[1]),
        .s2_data_out (fsp_s2_data[2*`FLIT_WIDTH-1:`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[2*`ADDR_WIDTH-1:`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_1 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[1]),
        .can_increment (csp_can_increment[1]),
        .src_data_valid (csp_1_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_1_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_1_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_1_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_1_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[2*`ADDR_WIDTH-1:`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[1]),
        .s1_valid_urgent (csp_s1_valid_urgent[1]),
        .s2_data_out (csp_s2_data[2*`CREDIT_WIDTH-1:`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[2*`ADDR_WIDTH-1:`ADDR_WIDTH])
    );

    wire [NUM-1:0] fsp_2_vec_valid;
    wire [NUM-1:0] fsp_2_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_2_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_2_vec_nexthop;
    wire [NUM-1:0] fsp_2_vec_dequeue;
    wire [NUM-1:0] csp_2_vec_valid;
    wire [NUM-1:0] csp_2_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_2_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_2_vec_nexthop;
    wire [NUM-1:0] csp_2_vec_dequeue;
    wire [0:0] fdp_2_valid;
    wire [`FLIT_WIDTH-1:0] fdp_2_data;
    wire [`A_FQID] fdp_2_nexthop;
    wire [0:0] fdp_2_ack;
    wire [0:0] cdp_2_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_2_data;
    wire [`A_FQID] cdp_2_nexthop;
    wire [0:0] cdp_2_ack;

    Partition #(.DPID(2), .N(NUM)) part_2 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[2]),
        .is_quiescent (part_quiescent[2]),
        .can_increment (part_can_increment[2]),
        .config_in_valid (part_config_in_valid[2]),
        .config_in (part_config_in[2]),
        .config_out_valid (part_config_in_valid[3]),
        .config_out (part_config_in[3]),
        .ram_config_in_valid (part_ram_config_in_valid[2]),
        .ram_config_in (part_ram_config_in[2]),
        .ram_config_out_valid (part_ram_config_in_valid[3]),
        .ram_config_out (part_ram_config_in[3]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[2]),
        .stats_out (part_stats_in[3]),
        .fsp_vec_valid (fsp_2_vec_valid),
        .fsp_vec_valid_urgent (fsp_2_vec_valid_urgent),
        .fsp_vec_data (fsp_2_vec_data),
        .fsp_vec_nexthop (fsp_2_vec_nexthop),
        .fsp_vec_dequeue (fsp_2_vec_dequeue),
        .csp_vec_valid (csp_2_vec_valid),
        .csp_vec_valid_urgent (csp_2_vec_valid_urgent),
        .csp_vec_data (csp_2_vec_data),
        .csp_vec_nexthop (csp_2_vec_nexthop),
        .csp_vec_dequeue (csp_2_vec_dequeue),
        .fdp_valid (fdp_2_valid),
        .fdp_data (fdp_2_data),
        .fdp_nexthop (fdp_2_nexthop),
        .fdp_ack (fdp_2_ack),
        .cdp_valid (cdp_2_valid),
        .cdp_data (cdp_2_data),
        .cdp_nexthop (cdp_2_nexthop),
        .cdp_ack (cdp_2_ack)
    );

    ICDestPart #(.PID(2), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_2 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[2]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[2]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_2_ack),
        .s3_data_out (fdp_2_data),
        .s3_nexthop_out (fdp_2_nexthop),
        .s3_data_valid (fdp_2_valid)
    );

    ICDestPart #(.PID(2), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_2 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[2]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[2]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_2_ack),
        .s3_data_out (cdp_2_data),
        .s3_nexthop_out (cdp_2_nexthop),
        .s3_data_valid (cdp_2_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_2 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[2]),
        .can_increment (fsp_can_increment[2]),
        .src_data_valid (fsp_2_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_2_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_2_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_2_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_2_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[3*`ADDR_WIDTH-1:2*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[2]),
        .s1_valid_urgent (fsp_s1_valid_urgent[2]),
        .s2_data_out (fsp_s2_data[3*`FLIT_WIDTH-1:2*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[3*`ADDR_WIDTH-1:2*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_2 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[2]),
        .can_increment (csp_can_increment[2]),
        .src_data_valid (csp_2_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_2_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_2_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_2_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_2_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[3*`ADDR_WIDTH-1:2*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[2]),
        .s1_valid_urgent (csp_s1_valid_urgent[2]),
        .s2_data_out (csp_s2_data[3*`CREDIT_WIDTH-1:2*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[3*`ADDR_WIDTH-1:2*`ADDR_WIDTH])
    );

    wire [NUM-1:0] fsp_3_vec_valid;
    wire [NUM-1:0] fsp_3_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_3_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_3_vec_nexthop;
    wire [NUM-1:0] fsp_3_vec_dequeue;
    wire [NUM-1:0] csp_3_vec_valid;
    wire [NUM-1:0] csp_3_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_3_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_3_vec_nexthop;
    wire [NUM-1:0] csp_3_vec_dequeue;
    wire [0:0] fdp_3_valid;
    wire [`FLIT_WIDTH-1:0] fdp_3_data;
    wire [`A_FQID] fdp_3_nexthop;
    wire [0:0] fdp_3_ack;
    wire [0:0] cdp_3_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_3_data;
    wire [`A_FQID] cdp_3_nexthop;
    wire [0:0] cdp_3_ack;

    Partition #(.DPID(3), .N(NUM)) part_3 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[3]),
        .is_quiescent (part_quiescent[3]),
        .can_increment (part_can_increment[3]),
        .config_in_valid (part_config_in_valid[3]),
        .config_in (part_config_in[3]),
        .config_out_valid (part_config_in_valid[4]),
        .config_out (part_config_in[4]),
        .ram_config_in_valid (part_ram_config_in_valid[3]),
        .ram_config_in (part_ram_config_in[3]),
        .ram_config_out_valid (part_ram_config_in_valid[4]),
        .ram_config_out (part_ram_config_in[4]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[3]),
        .stats_out (part_stats_in[4]),
        .fsp_vec_valid (fsp_3_vec_valid),
        .fsp_vec_valid_urgent (fsp_3_vec_valid_urgent),
        .fsp_vec_data (fsp_3_vec_data),
        .fsp_vec_nexthop (fsp_3_vec_nexthop),
        .fsp_vec_dequeue (fsp_3_vec_dequeue),
        .csp_vec_valid (csp_3_vec_valid),
        .csp_vec_valid_urgent (csp_3_vec_valid_urgent),
        .csp_vec_data (csp_3_vec_data),
        .csp_vec_nexthop (csp_3_vec_nexthop),
        .csp_vec_dequeue (csp_3_vec_dequeue),
        .fdp_valid (fdp_3_valid),
        .fdp_data (fdp_3_data),
        .fdp_nexthop (fdp_3_nexthop),
        .fdp_ack (fdp_3_ack),
        .cdp_valid (cdp_3_valid),
        .cdp_data (cdp_3_data),
        .cdp_nexthop (cdp_3_nexthop),
        .cdp_ack (cdp_3_ack)
    );

    ICDestPart #(.PID(3), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_3 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[3]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[3]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_3_ack),
        .s3_data_out (fdp_3_data),
        .s3_nexthop_out (fdp_3_nexthop),
        .s3_data_valid (fdp_3_valid)
    );

    ICDestPart #(.PID(3), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_3 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[3]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[3]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_3_ack),
        .s3_data_out (cdp_3_data),
        .s3_nexthop_out (cdp_3_nexthop),
        .s3_data_valid (cdp_3_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_3 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[3]),
        .can_increment (fsp_can_increment[3]),
        .src_data_valid (fsp_3_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_3_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_3_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_3_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_3_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[4*`ADDR_WIDTH-1:3*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[3]),
        .s1_valid_urgent (fsp_s1_valid_urgent[3]),
        .s2_data_out (fsp_s2_data[4*`FLIT_WIDTH-1:3*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[4*`ADDR_WIDTH-1:3*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_3 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[3]),
        .can_increment (csp_can_increment[3]),
        .src_data_valid (csp_3_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_3_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_3_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_3_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_3_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[4*`ADDR_WIDTH-1:3*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[3]),
        .s1_valid_urgent (csp_s1_valid_urgent[3]),
        .s2_data_out (csp_s2_data[4*`CREDIT_WIDTH-1:3*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[4*`ADDR_WIDTH-1:3*`ADDR_WIDTH])
    );

    wire [NUM-1:0] fsp_4_vec_valid;
    wire [NUM-1:0] fsp_4_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_4_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_4_vec_nexthop;
    wire [NUM-1:0] fsp_4_vec_dequeue;
    wire [NUM-1:0] csp_4_vec_valid;
    wire [NUM-1:0] csp_4_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_4_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_4_vec_nexthop;
    wire [NUM-1:0] csp_4_vec_dequeue;
    wire [0:0] fdp_4_valid;
    wire [`FLIT_WIDTH-1:0] fdp_4_data;
    wire [`A_FQID] fdp_4_nexthop;
    wire [0:0] fdp_4_ack;
    wire [0:0] cdp_4_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_4_data;
    wire [`A_FQID] cdp_4_nexthop;
    wire [0:0] cdp_4_ack;

    Partition #(.DPID(4), .N(4)) part_4 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[4]),
        .is_quiescent (part_quiescent[4]),
        .can_increment (part_can_increment[4]),
        .config_in_valid (part_config_in_valid[4]),
        .config_in (part_config_in[4]),
        .config_out_valid (part_config_in_valid[5]),
        .config_out (part_config_in[5]),
        .ram_config_in_valid (part_ram_config_in_valid[4]),
        .ram_config_in (part_ram_config_in[4]),
        .ram_config_out_valid (part_ram_config_in_valid[5]),
        .ram_config_out (part_ram_config_in[5]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[4]),
        .stats_out (part_stats_in[5]),
        .fsp_vec_valid (fsp_4_vec_valid),
        .fsp_vec_valid_urgent (fsp_4_vec_valid_urgent),
        .fsp_vec_data (fsp_4_vec_data),
        .fsp_vec_nexthop (fsp_4_vec_nexthop),
        .fsp_vec_dequeue (fsp_4_vec_dequeue),
        .csp_vec_valid (csp_4_vec_valid),
        .csp_vec_valid_urgent (csp_4_vec_valid_urgent),
        .csp_vec_data (csp_4_vec_data),
        .csp_vec_nexthop (csp_4_vec_nexthop),
        .csp_vec_dequeue (csp_4_vec_dequeue),
        .fdp_valid (fdp_4_valid),
        .fdp_data (fdp_4_data),
        .fdp_nexthop (fdp_4_nexthop),
        .fdp_ack (fdp_4_ack),
        .cdp_valid (cdp_4_valid),
        .cdp_data (cdp_4_data),
        .cdp_nexthop (cdp_4_nexthop),
        .cdp_ack (cdp_4_ack)
    );

    ICDestPart #(.PID(4), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_4 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[4]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[4]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_4_ack),
        .s3_data_out (fdp_4_data),
        .s3_nexthop_out (fdp_4_nexthop),
        .s3_data_valid (fdp_4_valid)
    );

    ICDestPart #(.PID(4), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_4 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[4]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[4]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_4_ack),
        .s3_data_out (cdp_4_data),
        .s3_nexthop_out (cdp_4_nexthop),
        .s3_data_valid (cdp_4_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_4 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[4]),
        .can_increment (fsp_can_increment[4]),
        .src_data_valid (fsp_4_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_4_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_4_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_4_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_4_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[5*`ADDR_WIDTH-1:4*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[4]),
        .s1_valid_urgent (fsp_s1_valid_urgent[4]),
        .s2_data_out (fsp_s2_data[5*`FLIT_WIDTH-1:4*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[5*`ADDR_WIDTH-1:4*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_4 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[4]),
        .can_increment (csp_can_increment[4]),
        .src_data_valid (csp_4_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_4_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_4_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_4_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_4_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[5*`ADDR_WIDTH-1:4*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[4]),
        .s1_valid_urgent (csp_s1_valid_urgent[4]),
        .s2_data_out (csp_s2_data[5*`CREDIT_WIDTH-1:4*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[5*`ADDR_WIDTH-1:4*`ADDR_WIDTH])
    );

    wire [NUM-1:0] fsp_5_vec_valid;
    wire [NUM-1:0] fsp_5_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_5_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_5_vec_nexthop;
    wire [NUM-1:0] fsp_5_vec_dequeue;
    wire [NUM-1:0] csp_5_vec_valid;
    wire [NUM-1:0] csp_5_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_5_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_5_vec_nexthop;
    wire [NUM-1:0] csp_5_vec_dequeue;
    wire [0:0] fdp_5_valid;
    wire [`FLIT_WIDTH-1:0] fdp_5_data;
    wire [`A_FQID] fdp_5_nexthop;
    wire [0:0] fdp_5_ack;
    wire [0:0] cdp_5_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_5_data;
    wire [`A_FQID] cdp_5_nexthop;
    wire [0:0] cdp_5_ack;

    Partition #(.DPID(5), .N(NUM)) part_5 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[5]),
        .is_quiescent (part_quiescent[5]),
        .can_increment (part_can_increment[5]),
        .config_in_valid (part_config_in_valid[5]),
        .config_in (part_config_in[5]),
        .config_out_valid (part_config_in_valid[6]),
        .config_out (part_config_in[6]),
        .ram_config_in_valid (part_ram_config_in_valid[5]),
        .ram_config_in (part_ram_config_in[5]),
        .ram_config_out_valid (part_ram_config_in_valid[6]),
        .ram_config_out (part_ram_config_in[6]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[5]),
        .stats_out (part_stats_in[6]),
        .fsp_vec_valid (fsp_5_vec_valid),
        .fsp_vec_valid_urgent (fsp_5_vec_valid_urgent),
        .fsp_vec_data (fsp_5_vec_data),
        .fsp_vec_nexthop (fsp_5_vec_nexthop),
        .fsp_vec_dequeue (fsp_5_vec_dequeue),
        .csp_vec_valid (csp_5_vec_valid),
        .csp_vec_valid_urgent (csp_5_vec_valid_urgent),
        .csp_vec_data (csp_5_vec_data),
        .csp_vec_nexthop (csp_5_vec_nexthop),
        .csp_vec_dequeue (csp_5_vec_dequeue),
        .fdp_valid (fdp_5_valid),
        .fdp_data (fdp_5_data),
        .fdp_nexthop (fdp_5_nexthop),
        .fdp_ack (fdp_5_ack),
        .cdp_valid (cdp_5_valid),
        .cdp_data (cdp_5_data),
        .cdp_nexthop (cdp_5_nexthop),
        .cdp_ack (cdp_5_ack)
    );

    ICDestPart #(.PID(5), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_5 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[5]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[5]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_5_ack),
        .s3_data_out (fdp_5_data),
        .s3_nexthop_out (fdp_5_nexthop),
        .s3_data_valid (fdp_5_valid)
    );

    ICDestPart #(.PID(5), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_5 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[5]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[5]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_5_ack),
        .s3_data_out (cdp_5_data),
        .s3_nexthop_out (cdp_5_nexthop),
        .s3_data_valid (cdp_5_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_5 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[5]),
        .can_increment (fsp_can_increment[5]),
        .src_data_valid (fsp_5_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_5_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_5_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_5_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_5_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[6*`ADDR_WIDTH-1:5*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[5]),
        .s1_valid_urgent (fsp_s1_valid_urgent[5]),
        .s2_data_out (fsp_s2_data[6*`FLIT_WIDTH-1:5*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[6*`ADDR_WIDTH-1:5*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_5 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[5]),
        .can_increment (csp_can_increment[5]),
        .src_data_valid (csp_5_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_5_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_5_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_5_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_5_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[6*`ADDR_WIDTH-1:5*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[5]),
        .s1_valid_urgent (csp_s1_valid_urgent[5]),
        .s2_data_out (csp_s2_data[6*`CREDIT_WIDTH-1:5*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[6*`ADDR_WIDTH-1:5*`ADDR_WIDTH])
    );

    wire [NUM-1:0] fsp_6_vec_valid;
    wire [NUM-1:0] fsp_6_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_6_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_6_vec_nexthop;
    wire [NUM-1:0] fsp_6_vec_dequeue;
    wire [NUM-1:0] csp_6_vec_valid;
    wire [NUM-1:0] csp_6_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_6_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_6_vec_nexthop;
    wire [NUM-1:0] csp_6_vec_dequeue;
    wire [0:0] fdp_6_valid;
    wire [`FLIT_WIDTH-1:0] fdp_6_data;
    wire [`A_FQID] fdp_6_nexthop;
    wire [0:0] fdp_6_ack;
    wire [0:0] cdp_6_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_6_data;
    wire [`A_FQID] cdp_6_nexthop;
    wire [0:0] cdp_6_ack;

    Partition #(.DPID(6), .N(NUM)) part_6 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[6]),
        .is_quiescent (part_quiescent[6]),
        .can_increment (part_can_increment[6]),
        .config_in_valid (part_config_in_valid[6]),
        .config_in (part_config_in[6]),
        .config_out_valid (part_config_in_valid[7]),
        .config_out (part_config_in[7]),
        .ram_config_in_valid (part_ram_config_in_valid[6]),
        .ram_config_in (part_ram_config_in[6]),
        .ram_config_out_valid (part_ram_config_in_valid[7]),
        .ram_config_out (part_ram_config_in[7]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[6]),
        .stats_out (part_stats_in[7]),
        .fsp_vec_valid (fsp_6_vec_valid),
        .fsp_vec_valid_urgent (fsp_6_vec_valid_urgent),
        .fsp_vec_data (fsp_6_vec_data),
        .fsp_vec_nexthop (fsp_6_vec_nexthop),
        .fsp_vec_dequeue (fsp_6_vec_dequeue),
        .csp_vec_valid (csp_6_vec_valid),
        .csp_vec_valid_urgent (csp_6_vec_valid_urgent),
        .csp_vec_data (csp_6_vec_data),
        .csp_vec_nexthop (csp_6_vec_nexthop),
        .csp_vec_dequeue (csp_6_vec_dequeue),
        .fdp_valid (fdp_6_valid),
        .fdp_data (fdp_6_data),
        .fdp_nexthop (fdp_6_nexthop),
        .fdp_ack (fdp_6_ack),
        .cdp_valid (cdp_6_valid),
        .cdp_data (cdp_6_data),
        .cdp_nexthop (cdp_6_nexthop),
        .cdp_ack (cdp_6_ack)
    );

    ICDestPart #(.PID(6), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_6 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[6]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[6]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_6_ack),
        .s3_data_out (fdp_6_data),
        .s3_nexthop_out (fdp_6_nexthop),
        .s3_data_valid (fdp_6_valid)
    );

    ICDestPart #(.PID(6), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_6 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[6]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[6]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_6_ack),
        .s3_data_out (cdp_6_data),
        .s3_nexthop_out (cdp_6_nexthop),
        .s3_data_valid (cdp_6_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_6 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[6]),
        .can_increment (fsp_can_increment[6]),
        .src_data_valid (fsp_6_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_6_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_6_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_6_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_6_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[7*`ADDR_WIDTH-1:6*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[6]),
        .s1_valid_urgent (fsp_s1_valid_urgent[6]),
        .s2_data_out (fsp_s2_data[7*`FLIT_WIDTH-1:6*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[7*`ADDR_WIDTH-1:6*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_6 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[6]),
        .can_increment (csp_can_increment[6]),
        .src_data_valid (csp_6_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_6_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_6_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_6_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_6_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[7*`ADDR_WIDTH-1:6*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[6]),
        .s1_valid_urgent (csp_s1_valid_urgent[6]),
        .s2_data_out (csp_s2_data[7*`CREDIT_WIDTH-1:6*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[7*`ADDR_WIDTH-1:6*`ADDR_WIDTH])
    );

    wire [NUM-1:0] fsp_7_vec_valid;
    wire [NUM-1:0] fsp_7_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_7_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_7_vec_nexthop;
    wire [NUM-1:0] fsp_7_vec_dequeue;
    wire [NUM-1:0] csp_7_vec_valid;
    wire [NUM-1:0] csp_7_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_7_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_7_vec_nexthop;
    wire [NUM-1:0] csp_7_vec_dequeue;
    wire [0:0] fdp_7_valid;
    wire [`FLIT_WIDTH-1:0] fdp_7_data;
    wire [`A_FQID] fdp_7_nexthop;
    wire [0:0] fdp_7_ack;
    wire [0:0] cdp_7_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_7_data;
    wire [`A_FQID] cdp_7_nexthop;
    wire [0:0] cdp_7_ack;

    Partition #(.DPID(7), .N(NUM)) part_7 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[7]),
        .is_quiescent (part_quiescent[7]),
        .can_increment (part_can_increment[7]),
        .config_in_valid (part_config_in_valid[7]),
        .config_in (part_config_in[7]),
        .config_out_valid (part_config_in_valid[8]),
        .config_out (part_config_in[8]),
        .ram_config_in_valid (part_ram_config_in_valid[7]),
        .ram_config_in (part_ram_config_in[7]),
        .ram_config_out_valid (part_ram_config_in_valid[8]),
        .ram_config_out (part_ram_config_in[8]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[7]),
        .stats_out (part_stats_in[8]),
        .fsp_vec_valid (fsp_7_vec_valid),
        .fsp_vec_valid_urgent (fsp_7_vec_valid_urgent),
        .fsp_vec_data (fsp_7_vec_data),
        .fsp_vec_nexthop (fsp_7_vec_nexthop),
        .fsp_vec_dequeue (fsp_7_vec_dequeue),
        .csp_vec_valid (csp_7_vec_valid),
        .csp_vec_valid_urgent (csp_7_vec_valid_urgent),
        .csp_vec_data (csp_7_vec_data),
        .csp_vec_nexthop (csp_7_vec_nexthop),
        .csp_vec_dequeue (csp_7_vec_dequeue),
        .fdp_valid (fdp_7_valid),
        .fdp_data (fdp_7_data),
        .fdp_nexthop (fdp_7_nexthop),
        .fdp_ack (fdp_7_ack),
        .cdp_valid (cdp_7_valid),
        .cdp_data (cdp_7_data),
        .cdp_nexthop (cdp_7_nexthop),
        .cdp_ack (cdp_7_ack)
    );

    ICDestPart #(.PID(7), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_7 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[7]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[7]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_7_ack),
        .s3_data_out (fdp_7_data),
        .s3_nexthop_out (fdp_7_nexthop),
        .s3_data_valid (fdp_7_valid)
    );

    ICDestPart #(.PID(7), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_7 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[7]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[7]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_7_ack),
        .s3_data_out (cdp_7_data),
        .s3_nexthop_out (cdp_7_nexthop),
        .s3_data_valid (cdp_7_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_7 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[7]),
        .can_increment (fsp_can_increment[7]),
        .src_data_valid (fsp_7_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_7_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_7_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_7_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_7_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[8*`ADDR_WIDTH-1:7*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[7]),
        .s1_valid_urgent (fsp_s1_valid_urgent[7]),
        .s2_data_out (fsp_s2_data[8*`FLIT_WIDTH-1:7*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[8*`ADDR_WIDTH-1:7*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_7 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[7]),
        .can_increment (csp_can_increment[7]),
        .src_data_valid (csp_7_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_7_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_7_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_7_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_7_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[8*`ADDR_WIDTH-1:7*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[7]),
        .s1_valid_urgent (csp_s1_valid_urgent[7]),
        .s2_data_out (csp_s2_data[8*`CREDIT_WIDTH-1:7*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[8*`ADDR_WIDTH-1:7*`ADDR_WIDTH])
    );
	 
	 wire [NUM-1:0] fsp_8_vec_valid;
    wire [NUM-1:0] fsp_8_vec_valid_urgent;
    wire [NUM*`FLIT_WIDTH-1:0] fsp_8_vec_data;
    wire [NUM*`A_WIDTH-1:0] fsp_8_vec_nexthop;
    wire [NUM-1:0] fsp_8_vec_dequeue;
    wire [NUM-1:0] csp_8_vec_valid;
    wire [NUM-1:0] csp_8_vec_valid_urgent;
    wire [NUM*`CREDIT_WIDTH-1:0] csp_8_vec_data;
    wire [NUM*`A_WIDTH-1:0] csp_8_vec_nexthop;
    wire [NUM-1:0] csp_8_vec_dequeue;
    wire [0:0] fdp_8_valid;
    wire [`FLIT_WIDTH-1:0] fdp_8_data;
    wire [`A_FQID] fdp_8_nexthop;
    wire [0:0] fdp_8_ack;
    wire [0:0] cdp_8_valid;
    wire [`CREDIT_WIDTH-1:0] cdp_8_data;
    wire [`A_FQID] cdp_8_nexthop;
    wire [0:0] cdp_8_ack;

    Partition #(.DPID(8), .N(NUM)) part_8 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .stop_injection (stop_injection),
        .measure (measure),
        .sim_time (sim_time),
        .sim_time_tick (sim_time_tick),
        .error (part_error[8]),
        .is_quiescent (part_quiescent[8]),
        .can_increment (part_can_increment[8]),
        .config_in_valid (part_config_in_valid[8]),
        .config_in (part_config_in[8]),
        .config_out_valid (part_config_in_valid[9]),
        .config_out (part_config_in[9]),
        .ram_config_in_valid (part_ram_config_in_valid[8]),
        .ram_config_in (part_ram_config_in[8]),
        .ram_config_out_valid (part_ram_config_in_valid[9]),
        .ram_config_out (part_ram_config_in[9]),
        .stats_shift (stats_shift),
        .stats_in (part_stats_in[8]),
        .stats_out (part_stats_in[9]),
        .fsp_vec_valid (fsp_8_vec_valid),
        .fsp_vec_valid_urgent (fsp_8_vec_valid_urgent),
        .fsp_vec_data (fsp_8_vec_data),
        .fsp_vec_nexthop (fsp_8_vec_nexthop),
        .fsp_vec_dequeue (fsp_8_vec_dequeue),
        .csp_vec_valid (csp_8_vec_valid),
        .csp_vec_valid_urgent (csp_8_vec_valid_urgent),
        .csp_vec_data (csp_8_vec_data),
        .csp_vec_nexthop (csp_8_vec_nexthop),
        .csp_vec_dequeue (csp_8_vec_dequeue),
        .fdp_valid (fdp_8_valid),
        .fdp_data (fdp_8_data),
        .fdp_nexthop (fdp_8_nexthop),
        .fdp_ack (fdp_8_ack),
        .cdp_valid (cdp_8_valid),
        .cdp_data (cdp_8_data),
        .cdp_nexthop (cdp_8_nexthop),
        .cdp_ack (cdp_8_ack)
    );

    ICDestPart #(.PID(8), .NSP(SIZE), .WIDTH(`FLIT_WIDTH)) fdp_8 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (fdp_error[8]),
        .src_s1_valid (fsp_s1_valid),
        .src_s1_valid_urgent (fsp_s1_valid_urgent),
        .src_s1_nexthop_in (fsp_s1_nexthop),
        .src_s1_part_sel (fdp_select[8]),
        .src_s2_data_in (fsp_s2_data),
        .src_s2_nexthop_in (fsp_s2_nexthop),
        .dequeue (fdp_8_ack),
        .s3_data_out (fdp_8_data),
        .s3_nexthop_out (fdp_8_nexthop),
        .s3_data_valid (fdp_8_valid)
    );

    ICDestPart #(.PID(8), .NSP(SIZE), .WIDTH(`CREDIT_WIDTH)) cdp_8 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .error (cdp_error[8]),
        .src_s1_valid (csp_s1_valid),
        .src_s1_valid_urgent (csp_s1_valid_urgent),
        .src_s1_nexthop_in (csp_s1_nexthop),
        .src_s1_part_sel (cdp_select[8]),
        .src_s2_data_in (csp_s2_data),
        .src_s2_nexthop_in (csp_s2_nexthop),
        .dequeue (cdp_8_ack),
        .s3_data_out (cdp_8_data),
        .s3_nexthop_out (cdp_8_nexthop),
        .s3_data_valid (cdp_8_valid)
    );

    ICSourcePart #(.N(NUM), .WIDTH(`FLIT_WIDTH)) fsp_8 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|fsp_select[8]),
        .can_increment (fsp_can_increment[8]),
        .src_data_valid (fsp_8_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (fsp_8_vec_valid_urgent[NUM-1:0]),
        .src_data_in (fsp_8_vec_data[NUM*`FLIT_WIDTH-1:0]),
        .src_nexthop_in (fsp_8_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (fsp_8_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (fsp_s1_nexthop[9*`ADDR_WIDTH-1:8*`ADDR_WIDTH]),
        .s1_valid (fsp_s1_valid[8]),
        .s1_valid_urgent (fsp_s1_valid_urgent[8]),
        .s2_data_out (fsp_s2_data[9*`FLIT_WIDTH-1:8*`FLIT_WIDTH]),
        .s2_nexthop_out (fsp_s2_nexthop[9*`ADDR_WIDTH-1:8*`ADDR_WIDTH])
    );

    ICSourcePart #(.N(NUM), .WIDTH(`CREDIT_WIDTH)) csp_8 (
        .clock (clock),
        .reset (reset),
        .enable (enable),
        .select (|csp_select[8]),
        .can_increment (csp_can_increment[8]),
        .src_data_valid (csp_8_vec_valid[NUM-1:0]),
        .src_data_valid_urgent (csp_8_vec_valid_urgent[NUM-1:0]),
        .src_data_in (csp_8_vec_data[NUM*`CREDIT_WIDTH-1:0]),
        .src_nexthop_in (csp_8_vec_nexthop[NUM*`ADDR_WIDTH-1:0]),
        .src_dequeue (csp_8_vec_dequeue[NUM-1:0]),
        .s1_nexthop_out (csp_s1_nexthop[9*`ADDR_WIDTH-1:8*`ADDR_WIDTH]),
        .s1_valid (csp_s1_valid[8]),
        .s1_valid_urgent (csp_s1_valid_urgent[8]),
        .s2_data_out (csp_s2_data[9*`CREDIT_WIDTH-1:8*`CREDIT_WIDTH]),
        .s2_nexthop_out (csp_s2_nexthop[9*`ADDR_WIDTH-1:8*`ADDR_WIDTH])
    );

    genvar i, j;
    generate
        for (j = 0; j < SIZE; j = j + 1)
        begin : dp_sp_sel
            for (i = 0; i < SIZE; i = i + 1)
            begin: dp
                assign fsp_select[j][i] = fdp_select[i][j];
                assign csp_select[j][i] = cdp_select[i][j];
            end
        end
    endgenerate

endmodule


