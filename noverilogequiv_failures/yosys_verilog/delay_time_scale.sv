module top;
wand x;
`define TEST(time_scale) if (1) assign #time_scale x = 1;

`TEST(1s)
`TEST(1ms)
`TEST(1us)
`TEST(1ns)
`TEST(1ps)
`TEST(1fs)

`TEST((1s))
`TEST(( 1s))
`TEST((1s ))
`TEST(( 1s ))

`TEST(1.0s)
`TEST(1.1s)

endmodule
