module Example;

    parameter FLAG = 1;
    wire [3:0] inp;

    reg out1;
    initial out1 = FLAG ? &inp[2:0] : &inp[4:0];

    reg out2;
    initial
        if (FLAG)
            out2 = &inp[2:0];
        else
            out2 = &inp[4:0];

    wire out3;
    assign out3 = FLAG ? &inp[2:0] : &inp[4:0];

    wire out4;
    generate
        if (FLAG)
            assign out4 = &inp[2:0];
        else
            assign out4 = &inp[4:0];
    endgenerate

endmodule
