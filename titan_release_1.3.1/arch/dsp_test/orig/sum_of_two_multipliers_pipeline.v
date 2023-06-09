// Quartus II Verilog Template
// Sum of two multipliers with pipeline registers

module sum_of_two_multipliers_pipeline
#(parameter WIDTH=16)
(
	input clock, aclr,
	input [WIDTH-1:0] dataa, datab, datac, datad,
	output reg [2*WIDTH:0] result
);

	reg [WIDTH-1:0] dataa_reg, datab_reg, datac_reg, datad_reg;
	reg [2*WIDTH-1:0] mult0_result, mult1_result;

	always @ (posedge clock or posedge aclr) begin
    	if (aclr) begin
        	dataa_reg <= {(WIDTH){1'b0}};
			datab_reg <= {(WIDTH){1'b0}};
    	    datac_reg <= {(WIDTH){1'b0}};
        	datad_reg <= {(WIDTH){1'b0}};
			mult0_result <= {(2*WIDTH){1'b0}};
    	    mult1_result <= {(2*WIDTH){1'b0}};
        	result <= {(2*WIDTH+1){1'b0}};
		end
    	else begin
        	dataa_reg <= dataa;
			datab_reg <= datab;
    	    datac_reg <= datac;
        	datad_reg <= datad;
			mult0_result <= dataa_reg * datab_reg;
    	    mult1_result <= datac_reg * datad_reg;
        	result <= mult0_result + mult1_result;
		end
	end
endmodule
