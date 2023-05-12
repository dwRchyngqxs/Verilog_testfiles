module top(
    input inp,
    output out
);
    assign out =
        {1024 {
        {1024 {
        {1024 {
        inp
        }}
        }}
        }}
        ;
endmodule
