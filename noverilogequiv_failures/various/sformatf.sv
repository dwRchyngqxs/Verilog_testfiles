module top;
	localparam a = $sformatf("0x%x", 8'h5A);
	localparam b = $sformatf("%d", 4'b011);
	generate
		if (a != "0x5a") $error("a incorrect!");
		if (b != "3") $error("b incorrect!");
	endgenerate
endmodule
