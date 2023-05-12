module Task_Test_Top
(
input a,
output b, c
);

    task SomeTaskName(x, output y, z);
       y = ~x;
       z = x;
    endtask

    always @*
        SomeTaskName(a, b, c);

    assert property (b == ~a);
    assert property (c == a);

endmodule
