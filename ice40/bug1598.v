module led_blink (
        input clk,
        output ledc
    );
 
    reg [6:0] led_counter = 0;
    always @( posedge clk ) begin
            led_counter <= led_counter + 1;
    end
    assign ledc = !led_counter[ 6:3 ];
 
endmodule
