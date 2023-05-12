module test ();
	localparam y = 1;
	reg x = 1'b0;
	always @(*) begin
		if (y)
			(* foo *) x <= 1'b1;
		else
			(* bar *) x = 1'b0;
	end
endmodule
