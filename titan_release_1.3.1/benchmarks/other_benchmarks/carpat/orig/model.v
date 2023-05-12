module model (current_x, current_y, clk27, rst27,
			  nleft, nright, nup, ndown, model_r,
	          model_g, model_b);
	
input [9:0] current_x, current_y;
input nleft, nright, nup, ndown;
input clk27, rst27;

output [3:0] model_r, model_g, model_b;

assign model_r = current_x; //model_rs;
assign model_g = current_x; //model_gs;
assign model_b = current_x; //model_bs;

endmodule

