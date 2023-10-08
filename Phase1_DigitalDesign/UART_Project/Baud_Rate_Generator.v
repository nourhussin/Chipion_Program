module Baud_Rate_Generator(
    input clk, reset,
    output reg tick
);
    parameter BAUD_RATE_DIVISOR = 163; // 50M/16*BAUD_RATE (CLOCK IS 50MHz)
    parameter BAUD_RATE_DIVISOR_BIT = 8;

    reg[BAUD_RATE_DIVISOR_BIT-1 : 0] counter;

    always @(posedge clk, posedge reset)
    begin
        if(reset)
        begin
            counter <= 0;
            tick <= 0;
        end

        else if(counter == BAUD_RATE_DIVISOR-1)
        begin
            counter <= 0;
            tick <= 1;
        end

        else
        begin
            counter <= counter + 1;
            tick <= 0;
        end
    end
endmodule