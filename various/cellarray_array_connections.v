module bit_buf (
    input wire bit_in,
    output wire bit_out
);
    assign bit_out = bit_in;
endmodule

module top (
	input wire [3:0] data_in,
	output wire [3:0] data_out
);

    wire [3:0] data [0:4];

    assign data[0] = data_in;
    assign data_out = data[4];

	genvar i;
	generate
		for (i=0; i<=3; i=i+1) begin
			bit_buf bit_buf_instance[3:0] (
				.bit_in(data[i]),
				.bit_out(data[i + 1])
			);
		end
	endgenerate
endmodule

module top2 (
	input wire [3:0] data_in,
	output wire [3:0] data_out
);
    assign data_out = data_in;
endmodule
