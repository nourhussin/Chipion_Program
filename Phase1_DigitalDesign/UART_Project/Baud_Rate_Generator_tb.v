`timescale 1ns/1ns
`include "Baud_Rate_Generator.v"

module Baud_Rate_Generator_tb;
    reg clk, reset;
    wire tick;
    localparam T = 10; // 50MHz
    Baud_Rate_Generator UUT(
        .clk(clk),
        .reset(reset),
        .tick(tick)
    );

    initial begin
        clk = 0;
        forever begin
            #(T/2); clk = !clk;
        end
    end

    initial begin
        $dumpfile("Baud_Rate_Generator_tb.vcd");
        $dumpvars(0, Baud_Rate_Generator_tb);

        reset = 0;
        #(T/4);
        reset = 1;
        #T;
        reset = 0;
        #(600*T);
        $finish;
    end
endmodule