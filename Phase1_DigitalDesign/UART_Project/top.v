`include "Transmitter.v"
`include "Receiver.v"
`include "Baud_Rate_Generator.v"

module top(
    input clk, reset, tx_start,
    input[7:0] data_in,
    output[7:0] data_out,
    output rx_done, tx_done 
);
    wire tick, transmitting_line;

    Receiver RX(
        .clk(clk),
        .reset(reset),
        .s_tick(tick),
        .rx(transmitting_line),
        .rx_done_tick(rx_done),
        .data_out(data_out)
    );

    Transmitter TX(
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .s_tick(tick),
        .tx(transmitting_line),
        .tx_done_tick(tx_done),
        .data_in(data_in)
    );

    Baud_Rate_Generator BR(
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );
endmodule