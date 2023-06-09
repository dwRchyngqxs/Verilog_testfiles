module top(input [3:0] a, input en, output [7:0] d);

always @*
	if (en)
		case(a)
			4'h0: d <= 8'h12;
			4'h1: d <= 8'h34;
			4'h2: d <= 8'h56;
			4'h3: d <= 8'h78;
			4'h4: d <= 8'h9a;
			4'h5: d <= 8'hbc;
			4'h6: d <= 8'hde;
			4'h7: d <= 8'hff;
			4'h8: d <= 8'h61;
			4'h9: d <= 8'h49;
			4'ha: d <= 8'h36;
			4'hb: d <= 8'h81;
			4'hc: d <= 8'h8c;
			4'hd: d <= 8'ha9;
			4'he: d <= 8'h99;
			4'hf: d <= 8'h51;
		endcase
	else
		d <= 0;

endmodule
