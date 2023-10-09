`timescale 1ns/1ns
`include "top.v"
module top_tb;
    reg clk, reset, tx_start;
    reg[7:0] data_in;
    wire rx_done, tx_done;
    wire[7:0] data_out;

    top UUT(
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .rx_done(rx_done),
        .tx_done(tx_done),
        .data_in(data_in),
        .data_out(data_out)
    );

    localparam T = 10;
    initial begin
        clk = 0;
        forever begin
            #(T/2); clk = !clk;
        end
    end

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0,top_tb);

        reset = 0; 
        tx_start =0; 
        data_in = 8'b11001110;
        #(T/4); 
        
        reset = 1;
        #T;

        reset = 0;
        tx_start = 1;
        #T;
        tx_start = 0;

        #(30000*T);
        $finish;
    end
endmodule