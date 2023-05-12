/*****************************************************************************
 * Temperature and Fan Control for DE4
 * ===================================
 * Simon Moore, Feb 2012
 * 
 * Functions:
 * 1. Reads the Stratix IV FPGA's internal temperature sensor using the ALTTEMP
 *    MegaFunction.
 * 2. Pulse width modulates the DE4's fan with the aim of running the FPGA
 *    at targetTemperature (default is 40 degC)
 * 
 * Notes:
 * 
 * - This uses the ALTTEMP megafunction which has been instantiated as
 *   temp_sense* and requires temp_sense.qip to be added to the Quartus
 *   project.
 * 
 * - The input clock need to be 50MHz.  Any higher and the ALTTEMP megafunction
 *   will have its ADC clocked too high and the reading will be wrong.  I'm
 *   unsure what happens if the clock is slower, so don't do it!
 * 
 * - Terasic provide an external ADC to read the temperature sensor but Altera
 *   indicates that this is probably only useful if the whole FPGA is disabled
 *   whilst the temperature is taken, otherwise there is too much noise.  The
 *   internal sensor doesn't suffer from this problem.
 * 
 * - The ALTTEMP MegaFunction only appears to do a new reading after it has
 *   been cleared, so the "optional" clear (clr) input seems essential.
 * 
 * - The ALTTEMP manual devotes a whole page to a partially completed table
 *   mapping ADC values read to degrees Centigrade.  But if you plot the data
 *   it becomes obvious that the temperature is just the ADC value -128.
 * 
 * - To test I found it helpful to set the targetTemperature to 30 degC since
 *   the FPGA easily gets up to this temperature but with the design I was
 *   using (which exercised the serial links) it didn't get hot enough to need
 *   the fan at full speed but it had to be more than the minimum.
 * 
 * - The fan is always run at a minimum speed which I experimentally
 *   determined to be the minimum where the fan motor didn't stall.  But this
 *   experiment was only conducted on two fans so there is a chance that we
 *   will find a fan which requires a higher minimum.  This is not too big an
 *   issues since if the FPGA starts to get hot, the fan speed with always
 *   increase and eventially the fan will turn on.
 * 
 *****************************************************************************/

module temperature_fan_control(
    input                     clk50,            // 50MHz clock
    input                     rstn,             // not-reset
    output logic signed [7:0] temperatureDegC,  // signed temperature in deg. C
    output logic              fanOn);           // PWM fan output

  parameter targetTemperature = 8'd40;  // default target temperature is 40 degC
  parameter fanMinSpeed = 8'b0110_0000;

  wire                        temp_done;
  wire signed [7:0]           adc_val;
  logic [19:0]                temp_timer;
  logic                       temp_ce, temp_clr;
  logic [7:0]                 fanSpeed;
  wire [7:0]                  fanTimer = temp_timer[7:0]; // share a counter

  // Instantiate an AltTemp temperature sensor megafunction (temp_sense.v)
  // with all of its optional inputs (ce and clr) enabled
  temp_sense temp_sense_instance
    (
     .clk ( clk50 ),
     .ce ( temp_ce ),
     .clr ( temp_clr ),
     .tsdcaldone ( temp_done ),
     .tsdcalo ( adc_val )
     );
    
  always_ff @(posedge clk50 or negedge rstn)
    if(!rstn)
      begin
        temperatureDegC <= 8'hff;
        temp_timer <= 20'd0;
        temp_ce <= 1'b0;
        fanSpeed <= 8'd255;
        fanOn <= 1'b1;
      end
    else
      begin
        // leave the ADC on for 0.1% of the time since it is suppoed to use a lot of power
        temp_timer <= temp_timer + 1;
        temp_ce <= (temp_timer<4) || (temp_ce && !temp_done);
        temp_clr <= temp_timer<4;
        if(temp_done)
          temperatureDegC <= adc_val-128; // convert to deg C
        
        fanOn <= fanTimer <= fanSpeed;
        if(temp_timer==20'd0)
          begin
            if((temperatureDegC > targetTemperature) && (fanSpeed != 8'hff))
              fanSpeed <= fanSpeed+1;
            if((temperatureDegC < targetTemperature) && (fanSpeed > fanMinSpeed))
              fanSpeed <= fanSpeed-1;
          end
      end

endmodule // temperature_fan_control
