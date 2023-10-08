module Receiver(
    input clk, reset, tx_start, s_tick,
    input[7:0] data_in,
    output tx, tx_done_tick
);
    parameter DATA_BITS = 8;
    parameter STOP_BITS_TICK = 16;

    localparam idle = 2'b00;
    localparam start= 2'b01;
    localparam data = 2'b10;
    localparam stop = 2'b11;

endmodule