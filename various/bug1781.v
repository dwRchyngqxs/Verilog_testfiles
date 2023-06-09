module top(input clk, input rst);

reg [1:0] state;

always @(posedge clk, posedge rst) begin
	if (rst)
		state <= 0;
	else
		case (state)
			2'b00: state <= 2'b01;
			2'b01: state <= 2'b10;
			2'b10: state <= 2'b00;
		endcase
end

sub sub_i(.i(state == 0));

endmodule


(* blackbox, keep *)
module sub(input i);
endmodule
