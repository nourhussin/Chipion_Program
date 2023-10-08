module Receiver(
    input clk, reset, rx, s_tick,
    output rx_done_tick,
    output[7:0] data_out
);
    parameter DATA_BITS = 8;
    parameter STOP_BITS_TICK = 16;

    localparam idle = 2'b00;
    localparam start= 2'b01;
    localparam data = 2'b10;
    localparam stop = 2'b11;

endmodule