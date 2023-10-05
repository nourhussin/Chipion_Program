`timescale 1ns/1ns
`include "ALU.v"

module ALU_tb;
    reg clk;
    reg[31:0] input_a,input_b;
    reg[2:0] operation;
    wire[31:0] result;
    wire zero_flag;

    localparam  T = 10;
    localparam  bit_and = 3'b000;
    localparam  bit_or  = 3'b001;
    localparam  add     = 3'b010;
    localparam  sub     = 3'b100;
    localparam  mult    = 3'b101;
    localparam  setless = 3'b110;
    // 111 and 011 are not used

    ALU UUT(
        .input_a(input_a),
        .input_b(input_b),
        .operation(operation),
        .result(result),
        .zero_flag(zero_flag)
    );

    initial begin
        clk = 0;
        forever begin
            #(T/2); clk = ~clk;
        end
    end

    initial begin
        $dumpfile("ALU_tb.vcd");
        $dumpvars(0,ALU_tb);

        input_a = 550; //h'226 : 0010 0010 0110
        input_b = 450; //h'1c2 : 0001 1100 0010
        operation = 3'b111;
        #T;

        operation = 3'b011;
        #T;

        operation = bit_and; // 0000 0000 0010 : h'2
        #T;

        operation = bit_or; // 0011 1110 0110 : h'3e6
        #T;
        
        operation = add; // h'3e8
        #T;
        
        operation = sub; //h'64
        #T;
        
        operation = mult; //247,500: 3c6cc
        #T;

        operation = setless; //zero
        #T;

        input_a = 100;
        #T;
        #T;
        $finish;
        
        
    end

endmodule