module top();

input clk;
input [3:0] wa;
input [15:0] wd;
input [3:0] ra;
output [15:0] rd;

reg [15:0] mem[0:15];

integer i;
reg x;

always @(posedge clk) begin
        for (i = 0; i < 2; i = i + 1) begin
                x = i == 1;
                if (x)
                        mem[wa] <= wd;
        end
end

assign rd = mem[ra];

endmodule
