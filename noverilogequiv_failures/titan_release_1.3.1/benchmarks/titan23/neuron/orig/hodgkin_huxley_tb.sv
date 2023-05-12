///////////////////////////////////////////////////////////////////////////////
//
// Filename:      hodgkin_huxley_tb.v
// Date Created:  Mar. 2012
// Last Modified: Mar. 2012
//
// Devices:   Stratix-4  FPGA
// Purpose:   Hodgkin Huxley Neuron Model Testbench
// Contact:   Kalin Ovtcharov
//
// Description: Single compartment Hodgkin Huxley neuron model testbench
//
///////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ns

module hodgkin_huxley_tb();

  localparam MSB = 31;
  localparam LSB =  0;

  reg           clk;  // Clock
  reg           rst;  // Active high reset

	// Load known good output
  logic valid, o_valid; 
  shortreal s_real;

  initial begin
	  //integer f,d;
    //shortreal V_vec[10000:0];

	  // Load input
	  //f = $fopen("../../../matlab/input.txt", "r");
	  //for (int i = 0; i < 10000; i++) begin
	  //	d = $fscanf(f, "%d", V_vec[i]);
	  //end
	  //$fclose(f);

    clk = 1'b0;
    rst = 1'b1;
	  //valid = 1'b0;
    #100 rst = 1'b0;
    //for (int i=0; i<10000; i++) begin
		//  @(negedge clk);
    //  s_real = s_vec[i];
    //  valid   = 1'b1;
    //end
	  //@(negedge clk);
	  //valid = 1'b0;
  end
  always #10 clk = ~clk;

  wire [MSB:LSB] s_bits;

  initial begin
    valid <= 1'b0;
    for (int i=0; i<100; i++) begin
      @(posedge clk);
    end
    // input 0.0
    for (int i=0; i<10; i++) begin
      valid  <= 1'b1;
      s_real <= 0.0;
      @(posedge clk);
      valid  <= 1'b0;
      @(posedge o_valid);
      @(negedge clk);
      $display("%f -> %f %f %f %f",
        s_real, y1_new_real, y2_new_real, y3_new_real, y4_new_real);
      @(negedge o_valid);
    end
    // input 100.0
    for (int i=0; i<100; i++) begin
      valid  <= 1'b1;
      s_real <= 100.0;
      @(posedge clk);
      valid  <= 1'b0;
      @(posedge o_valid);
      @(negedge clk);
      $display("%f -> %f %f %f %f",
        s_real, y1_new_real, y2_new_real, y3_new_real, y4_new_real);
      @(negedge o_valid);
    end
    // input 0.0
    for (int i=0; i<100; i++) begin
      valid  <= 1'b1;
      s_real <= 0.0;
      @(posedge clk);
      valid  <= 1'b0;
      @(posedge o_valid);
      @(negedge clk);
      $display("%f -> %f %f %f %f",
        s_real, y1_new_real, y2_new_real, y3_new_real, y4_new_real);
      @(negedge o_valid);
    end
    $stop;
  end
  assign s_bits = (valid) ? $shortrealtobits(s_real) : 32'hxxxxxxxx;

  //
  // Unit under test
  //
  hodgkin_huxley u_dut (
    // Clocks and Resets
    .i_clk        (clk),
    .i_rst        (rst),
    // Input Valid
    .i_s          (s_bits), // current input
    .i_valid      (valid),
    // Model Outputs
    .o_V          (),
    .o_valid      (o_valid)
  );

  // Convert to reals for comparison
  wire [MSB:LSB] y1_p30    = u_dut.y1_p30;

  shortreal y1_p30_real;
  assign y1_p30_real    = $bitstoshortreal(y1_p30);

  //
  // Calculate: alpha_mNA_0 = (-0.10 * y1_p35) / (exp(-1 * (y1_p35)) - 1)
  //
  wire [MSB:LSB] y1            = u_dut.y[1];
    // Add: y1 + 35.0
  wire [MSB:LSB] y1_p35        = u_dut.y1_p35;
    // Multiplication: (-0.10) * (y1_p35)
  wire [MSB:LSB] mult_0_result = u_dut.mult_0_result;
    // Exponentiation: exp(-1 * (y1_p35)) 
  wire [MSB:LSB] exp_0_result  = u_dut.exp_0_result;
    // Subtract: (exp(-1 * (y1_p35))) - (1))
  wire [MSB:LSB] sub_0_result  = u_dut.sub_0_result;
    // Division: ((-0.10) * (y1_p35)) / (exp(-1 * (y1_p35)) - 1)
  wire [MSB:LSB] alpha_mNA_0  = u_dut.alpha_mNA_0;
  wire [MSB:LSB] alpha_mNA_0_d = u_dut.alpha_mNA_0_d[16];

  shortreal y1_real,y1_p35_real, mult_0_result_real, exp_0_result_real,
            sub_0_result_real, alpha_mNA_0_real, alpha_mNA_0_d_real;

  assign y1_real               = $bitstoshortreal(y1);
  assign y1_p35_real           = $bitstoshortreal(y1_p35);
  assign mult_0_result_real    = $bitstoshortreal(mult_0_result);
  assign exp_0_result_real     = $bitstoshortreal(exp_0_result);
  assign sub_0_result_real     = $bitstoshortreal(sub_0_result);
  assign alpha_mNA_0_real      = $bitstoshortreal(alpha_mNA_0);
  assign alpha_mNA_0_d_real    = $bitstoshortreal(alpha_mNA_0_d);

  //
  // Calculate: alpha_mNA_1 = (-0.1 * y1_p35 * exp(0.1 * y1_p35)) / (1 - exp(0.1 * y1_p35))
  //
  wire [MSB:LSB] mult_0_result_pos  = u_dut.mult_0_result_pos;
    // Exponentiation: exp((0.1 * y1_p35)) 
  wire [MSB:LSB] exp_1_result       = u_dut.exp_1_result;
    // Multiplication: (-0.1 * y1_p35) * (exp(0.1 * y1_p35))
  wire [MSB:LSB] mult_0_result_d    = u_dut.mult_0_result_d[16];
  wire [MSB:LSB] mult_1_result      = u_dut.mult_1_result;
    // Subtract: (1) - (exp(0.1 * y1_p35))
  wire [MSB:LSB] sub_1_result       = u_dut.sub_1_result;
    // Division: (-0.1 * y1_p35 * exp(0.1 * y1_p35)) / (1 - exp(0.1 * y1_p35))
  wire [MSB:LSB] alpha_mNA_1        = u_dut.alpha_mNA_1;
  wire [MSB:LSB] alpha_mNA          = u_dut.alpha_mNA;

  shortreal mult_0_result_pos_real, exp_1_result_real, mult_0_result_d_real,
            mult_1_result_real, sub_1_result_real, alpha_mNA_1_real, alpha_mNA_real;

  assign mult_0_result_pos_real     = $bitstoshortreal(mult_0_result_pos);
  assign exp_1_result_real          = $bitstoshortreal(exp_1_result);
  assign mult_0_result_d_real       = $bitstoshortreal(mult_0_result_d);
  assign mult_1_result_real         = $bitstoshortreal(mult_1_result);
  assign sub_1_result_real          = $bitstoshortreal(sub_1_result);
  assign alpha_mNA_1_real           = $bitstoshortreal(alpha_mNA_1);
  assign alpha_mNA_real             = $bitstoshortreal(alpha_mNA);

  //
  // Calculate: m_NA_infinity = alpha_mNA / (alpha_mNA + beta_mNA)
  // Calculate: beta_mNA = 4 * exp((-1 * y1_p60) / 18)
  // Calculate: t_m_NA = 1 / (alpha_mNA + beta_mNA)
  //
  wire [MSB:LSB] beta_mNA       = u_dut.beta_mNA;
  wire [MSB:LSB] m_NA_infinity  = u_dut.m_NA_infinity;
  wire [MSB:LSB] t_m_NA         = u_dut.t_m_NA;

  shortreal beta_mNA_real, m_NA_infinity_real, t_m_NA_real;

  assign beta_mNA_real      = $bitstoshortreal(beta_mNA);
  assign m_NA_infinity_real = $bitstoshortreal(m_NA_infinity);
  assign t_m_NA_real        = $bitstoshortreal(t_m_NA);

  //
  // Calculate: f2 (m_NA) = (m_NA_infinity - m_NA) / t_m_NA
  //
  wire [MSB:LSB] sub_2_re   = u_dut.f[2];

  //
  // Calculate: alpha_hNA = 0.07 * exp(-1 * y1_p60 / 20);
  //
  wire [MSB:LSB] alpha_hNA = u_dut.alpha_hNA;

  shortreal alpha_hNA_real;
  assign alpha_hNA_real = $bitstoshortreal(alpha_hNA);

  //
  // Calculate: beta_hNA_0 = 1 / (1 + exp(-1 * y1_p35 / 10));
  //
  wire [MSB:LSB] beta_hNA_0  = u_dut.beta_hNA_0;
  wire [MSB:LSB] beta_hNA_1  = u_dut.beta_hNA_1;
  wire [MSB:LSB] beta_hNA    = u_dut.beta_hNA;

  shortreal beta_hNA_0_real, beta_hNA_1_real, beta_hNA_real;

  assign beta_hNA_0_real  = $bitstoshortreal(beta_hNA_0);
  assign beta_hNA_1_real  = $bitstoshortreal(beta_hNA_1);
  assign beta_hNA_real    = $bitstoshortreal(beta_hNA);

  // Calculate: f3 = (h_NA_infinity - y3)/t_h_NA
  wire [MSB:LSB] f1  = u_dut.f[1];
  wire [MSB:LSB] f2  = u_dut.f[2];
  wire [MSB:LSB] f3  = u_dut.f[3];
  wire [MSB:LSB] f4  = u_dut.f[4];
  wire [MSB:LSB] y1_new  = u_dut.y_new[1];
  wire [MSB:LSB] y2_new  = u_dut.y_new[2];
  wire [MSB:LSB] y3_new  = u_dut.y_new[3];
  wire [MSB:LSB] y4_new  = u_dut.y_new[4];

  shortreal f1_real, f2_real, f3_real, f4_real,
            y1_new_real, y2_new_real, y3_new_real, y4_new_real;

  assign f1_real  = $bitstoshortreal(f1);
  assign f2_real  = $bitstoshortreal(f2);
  assign f3_real  = $bitstoshortreal(f3);
  assign f4_real  = $bitstoshortreal(f4);
  assign y1_new_real  = $bitstoshortreal(y1_new);
  assign y2_new_real  = $bitstoshortreal(y2_new);
  assign y3_new_real  = $bitstoshortreal(y3_new);
  assign y4_new_real  = $bitstoshortreal(y4_new);

endmodule

// vim: set sw=2 ts=2 sts=2 expandtab
