module top();

input clk;
input sel;
input [3:0] ra;
input [3:0] wa;
input wd;
output [3:0] rd;

reg [3:0] mem[0:15];

integer i;
initial begin
        for (i = 0; i < 16; i = i + 1)
                mem[i] <= i;
end

assign rd = mem[ra];

always @(posedge clk) begin
        mem[wa] <= {4{sel ? wd : mem[wa][0]}};
end

endmodule
