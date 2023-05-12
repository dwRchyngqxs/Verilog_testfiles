module test #(parameter DELAY_RISE = 0, DELAY_FALL = 0, DELAY_Z = 0)
            (input clock, input reset, input req_0, input req_1, output gnt_0, output gnt_1);
    parameter SIZE = 3;
    parameter IDLE = 3'b001, GNT0 = 3'b010, GNT1 = 3'b100;
    reg [SIZE-1:0] state;
    reg [SIZE-1:0] next_state;
    reg gnt_0, gnt_1;

    always @ (state or req_0 or req_1)
    begin : FSM_COMBO
        next_state = 3'b000;
        case (state)
        IDLE : if (req_0 == 1'b1) begin
                    next_state = #(DELAY_RISE * 2) GNT0;
                end else if (req_1 == 1'b1) begin
                    next_state = #(DELAY_RISE * 2.5) GNT1;
                end else begin
                    next_state = #(DELAY_RISE * 2.5: DELAY_FALL: DELAY_Z) IDLE;
                end
        GNT0 : if (req_0 == 1'b1) begin
                    #(DELAY_RISE) next_state = GNT0;
                end else begin
                    #DELAY_RISE next_state = IDLE;
                end
        GNT1 : if (req_1 == 1'b1) begin
                    #10 next_state = GNT1;
                end else begin
                    #(10) next_state = IDLE;
                end
        default : next_state = IDLE;
        endcase
    end

    always @ (posedge clock)
    begin : FSM_SEQ
        if (reset == 1'b1) begin
            #3 state <= IDLE;
        end else begin
            #(1) state <= next_state;
        end
    end

    always @ (posedge clock)
    begin : FSM_OUTPUT
        if (reset == 1'b1) begin
            gnt_0 <= #(DELAY_RISE: DELAY_FALL: DELAY_Z) 1'b0;
            gnt_1 <= #1 1'b0;
        end else begin
            case (state)
            IDLE : begin
                        gnt_0 <= #(DELAY_RISE: DELAY_FALL: DELAY_Z) 1'b0;
                        gnt_1 <= #1 1'b0;
                    end
            GNT0 : begin
                        gnt_0 <= #(DELAY_RISE) 1'b1;
                        gnt_1 <= #1 1'b0;
                    end
            GNT1 : begin
                        gnt_0 <= #(DELAY_RISE) 1'b0;
                        gnt_1 <= #1 1'b1;
                    end
            default : begin
                        gnt_0 <= 1'b0;
                        gnt_1 <= 1'b0;
                    end
            endcase
        end
    end
endmodule
