module Baud_Rate_Generator(
    input clk, reset,
    output tick
);
    parameter BAUD_RATE_DIVISOR = 163; // 50M/16*BAUD_RATE (CLOCK IS 50MHz)
    parameter BAUD_RATE_DIVISOR_BIT = 8;
    
endmodule