module top(
    output out
);
    assign out =
        {1024 {
        {1024 {
        {1024 {
        1'b1
        }}
        }}
        }}
        ;
endmodule
