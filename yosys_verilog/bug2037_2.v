module test ();
	localparam y = 1;
	always @(*)
		if (y) (* foo *) ; else (* bar *) ;
endmodule
