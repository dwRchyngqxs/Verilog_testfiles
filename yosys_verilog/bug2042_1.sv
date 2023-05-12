module Task_Test_Top
(
input a,
output reg b
);

    task SomeTaskName(a);
       b = ~a;
    endtask

    always @*
        SomeTaskName(a);

    assert property (b == ~a);

endmodule
