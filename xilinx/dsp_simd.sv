module simd(input [12*4-1:0] a, input [12*4-1:0] b, (* use_dsp="simd" *) output [7*12-1:0] o12, (* use_dsp="simd" *) output [2*24-1:0] o24);
generate
    genvar i;
    // 4 x 12-bit adder
    for (i = 0; i < 4; i++)
        assign o12[i*12+:12] = a[i*12+:12] + b[i*12+:12];
    // 2 x 24-bit subtract
    for (i = 0; i < 2; i++)
        assign o24[i*24+:24] = a[i*24+:24] - b[i*24+:24];
endgenerate
reg [3*12-1:0] ro;
always @* begin
    ro[0*12+:12] = a[0*10+:10] + b[0*10+:10];
    ro[1*12+:12] = a[1*10+:10] + b[1*10+:10];
    ro[2*12+:12] = a[2*8+:8] + b[2*8+:8];
end
assign o12[4*12+:3*12] = ro;
endmodule
