module test ();
	localparam y = 1;
    generate if (y) (* foo *) ; endgenerate
endmodule
