module syscon
(
	input clk,
	input reset,
	
	input [0:0]	address,
	input [31:0] writedata,
	input write,
	
	output logic reset_req_out
);

initial reset_req_out = '0;

always_ff @ (posedge clk) begin
	if (write) reset_req_out <= writedata[0];
end


endmodule
