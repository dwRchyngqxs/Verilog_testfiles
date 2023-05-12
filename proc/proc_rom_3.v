module top(input [31:0] a, input en, output [7:0] d);

always @*
	if (en)
		case(a)
			0: d <= 8'h12;
			1: d <= 8'h34;
			2: d <= 8'h56;
			3: d <= 8'h78;
			4: d <= 8'h9a;
			5: d <= 8'hbc;
			6: d <= 8'hde;
			7: d <= 8'hff;
			8: d <= 8'h61;
			9: d <= 8'h49;
			10: d <= 8'h36;
			11: d <= 8'h81;
			12: d <= 8'h8c;
			default: d <= 8'h11;
		endcase
	else
		d <= 0;

endmodule
