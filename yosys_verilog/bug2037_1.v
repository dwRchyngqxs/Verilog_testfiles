module test ();
	localparam y = 1;
	always @(*)
		if (y) (* foo *) ;
endmodule
