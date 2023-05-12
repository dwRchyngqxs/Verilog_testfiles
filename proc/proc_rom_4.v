module top(input [3:0] a, input en, output [7:0] d);

always @*
	if (en)
		case(a)
			'h0: d <= 8'h12;
			'h1: d <= 8'h34;
			'h2: d <= 8'h56;
			'h3: d <= 8'h78;
			'h4: d <= 8'h9a;
			'h5: d <= 8'hbc;
			'h6: d <= 8'hde;
			'h7: d <= 8'hff;
			'h8: d <= 8'h61;
			'h9: d <= 8'h49;
			'ha: d <= 8'h36;
			'hb: d <= 8'h81;
			'hc: d <= 8'h8c;
			'hd: d <= 8'ha9;
			'he: d <= 8'h99;
			'hf: d <= 8'h51;
		endcase
	else
		d <= 0;

endmodule
