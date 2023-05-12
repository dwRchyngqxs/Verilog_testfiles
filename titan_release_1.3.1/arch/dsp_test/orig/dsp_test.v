`define SHIFT 1
`define BARREL_SHIFTER 1
`define ADD 1
`define COUNT 1
`define MULT 1
`define ACCUMULATE 1
`define SUM_OF 1

module dsp_test (
	// Input Ports
	input clk_1,
	input enable,
	input reset,
	input aclr,
	input sr_in,
	input cin,
	input add_sub,
	input sload,
	
	input [7:0] distance,
	input [6:0] sel,

	input [35:0] in_data_a,
	input [35:0] in_data_b,
	input [17:0] in_data_c,
	input [17:0] in_data_d,
	input [17:0] in_data_e,
	input [17:0] in_data_f,
	input [17:0] in_data_g,
	input [17:0] in_data_h,
	input [31:0] barrel_shifter_in,
	
	// Output Ports
	output [31:0] barrel_shifter_out,
	output reg [71:0] data_out_a,
	output reg [35:0] data_out_b,
	output reg [7:0] data_out_c,
	output reg [7:0] data_out_d
	
);

wire out_data_a_000;
wire out_data_a_001;

wire [7:0] out_data_a_003;
wire [7:0] out_data_b_003;
wire [7:0] out_data_c_003;
wire [7:0] out_data_d_003;

wire [16:0] out_data_a_004;
wire [16:0] out_data_a_004a;
wire [16:0] out_data_a_005;
wire [16:0] out_data_a_006;
wire [15:0] out_data_a_007;
wire [63:0] out_data_a_008;
wire [63:0] out_data_a_009;
wire [31:0] out_data_a_010;
wire [7:0] out_data_a_011;
wire [15:0] out_data_a_012;
wire [23:0] out_data_a_013;
wire [35:0] out_data_a_014;
wire [17:0] out_data_a_015;
wire [35:0] out_data_a_016;
wire [35:0] out_data_b_016;
wire [15:0] out_data_a_017a;
wire [17:0] out_data_a_017b;
wire [35:0] out_data_a_017c;
wire [23:0] out_data_a_018a;
wire [71:0] out_data_a_018b;
wire [43:0] out_data_a_019;
wire [31:0] out_data_a_020;
wire [37:0] out_data_a_021;
wire [32:0] out_data_a_022;
wire [37:0] out_data_a_023;
wire [37:0] out_data_a_024;
wire [54:0] out_data_a_025;
wire [43:0] out_data_a_026;
wire [35:0] out_data_a_027;
wire [43:0] out_data_a_028;
wire [17:0] out_data_b_028;
wire [31:0] out_data_a_029;

//Massive Mux to prevent outputs from being optimized away
	/* Output select mux */
	always@(*) begin
		case(sel)
		0: begin
			data_out_a <= out_data_a_003;
			data_out_b <= out_data_b_003;
			data_out_c <= out_data_c_003;
			data_out_d <= out_data_d_003;
		end
		1: begin
			data_out_a <= out_data_a_004;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		2: begin
			data_out_a <= out_data_a_004a;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		3: begin
			data_out_a <= out_data_a_005;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		4: begin
			data_out_a <= out_data_a_006;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		5: begin
			data_out_a <= out_data_a_007;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		6: begin
			data_out_a <= out_data_a_008;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		7: begin
			data_out_a <= out_data_a_009;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		8: begin
			data_out_a <= out_data_a_010;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		9: begin
			data_out_a <= out_data_a_011;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end 

		10: begin
			data_out_a <= out_data_a_012;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		11: begin
			data_out_a <= out_data_a_013;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		12: begin
			data_out_a <= out_data_a_014;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		13: begin
			data_out_a <= out_data_a_015;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		14: begin
			data_out_a <= out_data_a_016;
			data_out_b <= out_data_b_016;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		15: begin
			data_out_a <= out_data_a_017a;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		16: begin
			data_out_a <= out_data_a_017b;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		17: begin
			data_out_a <= out_data_a_017c;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		18: begin
			data_out_a <= out_data_a_018a;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		19: begin
			data_out_a <= out_data_a_018b;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		20: begin
			data_out_a <= out_data_a_019;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		21: begin
			data_out_a <= out_data_a_020;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		22: begin
			data_out_a <= out_data_a_021;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		23: begin
			data_out_a <= out_data_a_022;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		24: begin
			data_out_a <= out_data_a_023;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end	
		25: begin
			data_out_a <= out_data_a_024;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end	
		26: begin
			data_out_a <= out_data_a_000;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end	
		27: begin
			data_out_a <= out_data_a_001;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end	
		28: begin
			data_out_a <= out_data_a_025;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		29: begin
			data_out_a <= out_data_a_026;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		30: begin
			data_out_a <= out_data_a_027;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		31: begin
			data_out_a <= out_data_a_028;
			data_out_b <= out_data_b_028;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		32: begin
			data_out_a <= out_data_a_029;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		default: begin
			data_out_a <= 0;
			data_out_b <= 0;
			data_out_c <= 0;
			data_out_d <= 0;
		end
		endcase

	end




	// Module Item(s)
`ifdef SHIFT
	basic_shift_register #(.N(256)) inst000 (
		.clk		(clk_1),
		.enable	(enable),
		.sr_in	(sr_in),
		.sr_out	(out_data_a_000)
	);
	`ifdef BARREL_SHIFTER
	basic_shift_register_asynchronous_reset #(.N(256)) inst001 (
		.clk	(clk_1),
		.enable	(enable),
		.reset	(reset),
		.sr_in	(sr_in),
		.sr_out	(out_data_a_001)
	);
	`endif //BARREL_SHIFTER
	
	barrel_shifter #(.M(8), .N(32)) inst002 (
		.data			(barrel_shifter_in),
		.distance	(distance),
		.clk			(clk_1),
		.enable		(enable),
		.shift_left	(sr_in),
		.sr_out		(barrel_shifter_out)
	);
	

	basic_shift_register_with_multiple_taps #(.WIDTH(8), .LENGTH(64)) inst003 (
		.clk				(clk_1), 
		.enable			(enable),
		.sr_in			(in_data_a[7:0]),
		.sr_tap_one		(out_data_a_003), 
		.sr_tap_two		(out_data_b_003), 
		.sr_tap_three	(out_data_c_003), 
		.sr_out			(out_data_d_003)
	);
	
		scanouta_chain inst028 (
		.clk			(clk_1),
		.dataa		(in_data_a[17:0]), 
		.datab		(in_data_b[17:0]), 
		.datac		(in_data_c[17:0]),
		.datad		(in_data_d[17:0]),
		.datae		(in_data_e[17:0]),
		.dataout		(out_data_a_028),
		.shiftouta	(out_data_b_028)
	);

	dsp_shift inst029 (
		.clk(clk_1), 
		.rotate(in_data_c[0]), 
		.shift_right(in_data_c[1]),
		.dataa(in_data_a[31:0]), 
		.datab(in_data_b[31:0]),
		.result(out_data_a_029)
	);
	
`endif //SHIFT
	

`ifdef ADD
	signed_adder #(.WIDTH(16)) inst004(
		.dataa	(in_data_a[15:0]),
		.datab	(in_data_b[15:0]),
		.cin		(cin),
		.result	(out_data_a_004[16:0])
	);
	unsigned_adder #(.WIDTH(16)) inst004a(
		.dataa	(in_data_a[15:0]),
		.datab	(in_data_b[15:0]),
		.cin		(cin),
		.result	(out_data_a_004a[16:0])
	);
	signed_adder_subtractor #(.WIDTH(16)) inst005 (
		.dataa	(in_data_a[15:0]),
		.datab	(in_data_b[15:0]),
		.add_sub	(add_sub),	  // if this is 1, add; else subtract
		.clk		(clk_1),
		.result	(out_data_a_005[16:0])
	);
	unsigned_adder_subtractor #(.WIDTH(16)) inst006 (
		.dataa	(in_data_a[15:0]),
		.datab	(in_data_b[15:0]),
		.add_sub	(add_sub),	  // if this is 1, add; else subtract
		.clk		(clk_1),
		.result	(out_data_a_006[16:0])
	);
	pipelined_binary_adder_tree #(.WIDTH(16)) inst007 (
		.A		(in_data_a[15:0]), 
		.B		(in_data_b[15:0]), 
		.C		(in_data_c[15:0]), 
		.D		(in_data_d[15:0]), 
		.E		(in_data_e[15:0]),
		.clk	(clk_1),
		.out	(out_data_a_007[15:0])
	);
`endif //ADD
	
`ifdef COUNT
	binary_counter #(.WIDTH(64)) inst008 (
		.clk		(clk_1), 
		.enable	(enable), 
		.reset	(reset),
		.count	(out_data_a_008[63:0])
	);
	binary_up_down_counter #(.WIDTH(64)) inst009 (
		.clk(clk_1), 
		.enable(enable), 
		.count_up(enable), 
		.reset(reset),
		.count(out_data_a_009[63:0])
	);
	binary_up_down_counter_with_saturation #(.WIDTH(32)) inst010 (
		.clk			(clk_1), 
		.enable		(enable), 
		.count_up	(enable), 
		.reset		(reset),
		.count		(out_data_a_010[31:0])
	);
	gray_counter #(.WIDTH(8)) inst011 (
		.clk			(clk_1), 
		.enable		(enable), 
		.reset		(reset),
		.gray_count	(out_data_a_011[7:0])
	);

`endif //COUNT

`ifdef MULT

	unsigned_multiply #(.WIDTH(8)) inst012 (
		.dataa	(in_data_a[7:0]),
		.datab	(in_data_b[7:0]),
		.dataout	(out_data_a_012[15:0])
	);
	signed_multiply #(.WIDTH(12)) inst013 (
		.dataa	(in_data_a[11:0]),
		.datab	(in_data_b[11:0]),
		.dataout	(out_data_a_013[23:0])
	);
	unsigned_multiply_with_input_and_output_registers #(.WIDTH(18)) inst014 (
		.clk		(clk_1),
		.dataa	(in_data_a[17:0]),
		.datab	(in_data_b[17:0]),
		.dataout	(out_data_a_014[35:0])
	);
	signed_multiply_with_input_and_output_registers #(.WIDTH(9)) inst015 (
		.clk		(clk_1),
		.dataa	(in_data_a[8:0]),
		.datab	(in_data_b[8:0]),
		.dataout	(out_data_a_015[17:0])
	);
	multiplier_for_complex_numbers #(.WIDTH(18)) inst016 (
		.clk				(clk_1), 
		.ena				(enable),
		.dataa_real		(in_data_a[17:0]), 
		.dataa_img		(in_data_b[17:0]),
		.datab_real		(in_data_c[17:0]), 
		.datab_img		(in_data_d[17:0]),
		.dataout_real	(out_data_a_016[35:0]), 
		.dataout_img	(out_data_b_016[35:0])
	);

	two_mult_loopback inst027 (
		.clk(clk_1),
		.dataa(in_data_a[17:0]), 
		.datab(in_data_b[17:0]), 
		.datac(in_data_c[17:0]),
		.dataout(out_data_a_027)
	);
	
	
	`ifdef ACCUMULATE

	
	unsigned_multiply_accumulate #(.WIDTH(8)) inst017a (
		.clk			(clk_1), 
		.aclr			(aclr), 
		.clken		(enable), 
		.sload		(sload),
		.dataa		(in_data_a[7:0]),
		.datab		(in_data_a[7:0]),
		.adder_out	(out_data_a_017a[15:0])
	);
	unsigned_multiply_accumulate #(.WIDTH(9)) inst017b (
		.clk			(clk_1), 
		.aclr			(aclr), 
		.clken		(enable), 
		.sload		(sload),
		.dataa		(in_data_a[8:0]),
		.datab		(in_data_a[8:0]),
		.adder_out	(out_data_a_017b[17:0])
	);
	unsigned_multiply_accumulate #(.WIDTH(18)) inst017c (
		.clk			(clk_1), 
		.aclr			(aclr), 
		.clken		(enable), 
		.sload		(sload),
		.dataa		(in_data_a[17:0]),
		.datab		(in_data_a[17:0]),
		.adder_out	(out_data_a_017c[35:0])
	);
	signed_multiply_accumulate #(.WIDTH(12)) inst018a (
		.clk			(clk_1), 
		.aclr			(aclr), 
		.clken		(enable), 
		.sload		(sload),
		.dataa		(in_data_a[11:0]),
		.datab		(in_data_a[11:0]),
		.adder_out	(out_data_a_018a[23:0])
	);

	signed_multiply_accumulate #(.WIDTH(36)) inst018b (
		.clk			(clk_1), 
		.aclr			(aclr), 
		.clken		(enable), 
		.sload		(sload),
		.dataa		(in_data_a[35:0]),
		.datab		(in_data_a[35:0]),
		.adder_out	(out_data_a_018b[71:0])
	);

		`ifdef SUM_OF

	sum_of_four_multiply_accumulate #(.INPUT_WIDTH(18), .OUTPUT_WIDTH(44)) inst019(
		.clk		(clk_1), 
		.ena		(enable),
		.dataa	(in_data_a[17:0]), 
		.datab	(in_data_b[17:0]), 
		.datac	(in_data_c[17:0]), 
		.datad	(in_data_d[17:0]),
		.datae	(in_data_e[17:0]), 
		.dataf	(in_data_f[17:0]), 
		.datag	(in_data_g[17:0]), 
		.datah	(in_data_h[17:0]),
		.dataout	(out_data_a_019[43:0])
	);
	sum_of_four_multiply_accumulate_with_asynchronous_reset #(.INPUT_WIDTH(9), .OUTPUT_WIDTH(32)) inst020(
		.clk		(clk_1), 
		.ena		(enable),
		.aclr		(aclr),
		.dataa	(in_data_a[8:0]), 
		.datab	(in_data_b[8:0]), 
		.datac	(in_data_c[8:0]), 
		.datad	(in_data_d[8:0]),
		.datae	(in_data_e[8:0]), 
		.dataf	(in_data_f[8:0]), 
		.datag	(in_data_g[8:0]), 
		.datah	(in_data_h[8:0]),
		.dataout	(out_data_a_020[31:0])
	);

		`endif //SUM_OF
	
	`endif //ACCUMULATE

	`ifdef SUM_OF

	sum_of_four_multipliers #(.WIDTH(18)) inst021 (
		.clk		(clk_1), 
		.ena		(enable),
		.dataa	(in_data_a[17:0]), 
		.datab	(in_data_b[17:0]), 
		.datac	(in_data_c[17:0]), 
		.datad	(in_data_d[17:0]),
		.datae	(in_data_e[17:0]), 
		.dataf	(in_data_f[17:0]), 
		.datag	(in_data_g[17:0]), 
		.datah	(in_data_h[17:0]),
		.dataout	(out_data_a_021[37:0])
	);
	
	sum_of_two_multipliers_pipeline #(.WIDTH(16)) inst022 (
		.clock	(clk_1), 
		.aclr		(aclr),
		.dataa	(in_data_a[15:0]), 
		.datab	(in_data_b[15:0]), 
		.datac	(in_data_c[15:0]), 
		.datad	(in_data_d[15:0]),
		.result	(out_data_a_022[32:0])
	);
	

	sum_of_four_multipliers_scan_chain #(.WIDTH(18)) inst023 (
		.clk		(clk_1), 
		.ena		(enable),
		.dataa	(in_data_a[17:0]), 
		.datab0	(in_data_b[17:0]), 
		.datab1	(in_data_c[17:0]), 
		.datab2	(in_data_d[17:0]), 
		.datab3	(in_data_e[17:0]),
		.dataout	(out_data_a_023[37:0])
	);
	
	sum_of_eight_multipliers_chainout #(.WIDTH(18)) inst024 (
		.clk		(clk_1), 
		.ena		(enable),
		.a0		(in_data_h[17:0]), 
		.a1		(in_data_g[17:0]), 
		.a2		(in_data_f[17:0]), 
		.a3		(in_data_e[17:0]), 
		.a4		(in_data_d[17:0]), 
		.a5		(in_data_c[17:0]), 
		.a6		(in_data_b[17:0]),	 
		.a7		(in_data_a[17:0]),
		.b0		(in_data_a[17:0]), 
		.b1		(in_data_b[17:0]), 
		.b2		(in_data_c[17:0]), 
		.b3		(in_data_d[17:0]), 
		.b4		(in_data_e[17:0]), 
		.b5		(in_data_f[17:0]), 
		.b6		(in_data_g[17:0]), 
		.b7		(in_data_h[17:0]),
		.dataout	(out_data_a_024[37:0])
	);

	
	sum_of_two_multipliers_wide_datapath #(.WIDTH_A(36), .WIDTH_B(18)) inst025 (
		.clk		(clk_1), 
		.ena		(enable),
		.a0		(in_data_a[35:0]), 
		.a1		(in_data_b[35:0]),
		.b0		(in_data_c[17:0]), 
		.b1		(in_data_d[17:0]),
		.dataout	(out_data_a_025[54:0])
	);
	
	sum_of_four_multiply_accumulate_chainout inst026 (
		.clk			(clk_1),
		.dataa		(in_data_a[17:0]), 
		.datab		(in_data_a[17:0]), 
		.datac		(in_data_a[17:0]), 
		.datad		(in_data_a[17:0]),
		.datae		(in_data_a[17:0]), 
		.dataf		(in_data_a[17:0]), 
		.datag		(in_data_a[17:0]), 
		.datah		(in_data_a[17:0]),
		.dataout		(out_data_a_026)
	);
 
	
	`endif //SUM_OF

`endif //MULT



endmodule
