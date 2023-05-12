module top #(
    parameter integer WIDTH = 12
)(
    output reg  [WIDTH:0] cnt,
    input  wire clk,
    input  wire rst
);
    wire last_n;

    assign last_n = cnt[WIDTH];

    always @(posedge clk or posedge rst)
        if (rst)
            cnt <= 0;
        else
            cnt <= last_n ? ( cnt + { (WIDTH+1){last_n} } ) : 13'h1aaa;

endmodule
