module test ();
	localparam y = 1;
    generate if (y) (* foo *) ; else (* bar *); endgenerate
endmodule
