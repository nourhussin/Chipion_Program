`include "top.v"

module top_tb;
    localparam T = 10;
    reg clk,reset_n;
    wire[15:0] test_value;

    top UUT(
        .clk(clk),
        .reset_n(reset_n),
        .test_value(test_value)
    );

    initial begin
        clk = 0;
        forever begin
            #(T/2); clk = !clk;
        end
    end

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0,top_tb);

        
        reset_n = 0;
        #T;
        reset_n = 1;
        #(40*T);
        $finish;
    end
endmodule