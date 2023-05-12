module top();

input clk;
input s1;
input s2;
input s3;
input [3:0] ra;
input [3:0] wa;
input wd;
output rd;

reg mem[0:15];

integer i;
initial begin
        for (i = 0; i < 16; i = i + 1)
                mem[i] <= ^i;
end

assign rd = mem[ra];

wire ta = s1 ? wd : mem[wa];
wire tb = s2 ? wd : ta;
wire tc = s3 ? tb : ta;

always @(posedge clk) begin
        mem[wa] <= tc;
end

endmodule
