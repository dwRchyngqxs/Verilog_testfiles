module test ();

input [7:1] wa1;
input [7:1] wa2;
input [7:0] ra;
output [7:0] rd;
input clk;
input we1, we2;
input [15:0] wd1, wd2;

reg [7:0] mem [0:255];

assign rd = mem[ra];

always @(posedge clk) begin
        if (we1) begin
                mem[{wa1, 1'b0}] <= wd1[7:0];
                mem[{wa1, 1'b1}] <= wd1[15:8];
        end else begin
                mem[{wa2, 1'b0}] <= wd2[7:0];
                mem[{wa2, 1'b1}] <= wd2[15:8];
        end
end

endmodule
