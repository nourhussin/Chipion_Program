`timescale 1ns/1ns
`include"SBqM_Project/top_module.v"

module top_module_tb;
    reg clk, reset, front_photocell, back_photocell;
    reg[1:0] Tcount;
    wire empty_flag, full_flag;
    wire [2:0] Pcount;
    wire [4:0] Wtime;

    localparam T = 10;

    top_module UUT(
        .clk(clk),
        .reset(reset),
        .front_photocell(front_photocell),
        .back_photocell(back_photocell),
        .Tcount(Tcount),
        .empty_flag(empty_flag),
        .full_flag(full_flag),
        .Pcount(Pcount),
        .Wtime(Wtime)
    );

    initial begin
        clk = 0;
        forever begin
            #(T/2); clk = ~clk;
        end
    end

    initial begin
        $dumpfile("top_module_tb.vcd");
        $dumpvars(0,top_module_tb);

        // Default values
        Tcount = 2; 
        reset = 0;
        front_photocell = 1; // active low
        back_photocell = 1;  // active low
        #(2);

        // Reset
        reset = 1;
        #T; 
        reset =0;

        // Filling the queue
        back_photocell = 0;
         #(9*T); 
         back_photocell = 1;

        // Reducing the queue
        front_photocell = 0; 
        #(5*T); 
        // Filling and Reducing in the same time
        back_photocell = 0; 
        #(3*T);

        // Reset
        reset = 1;
        #T; 
        reset =0;

        // Change Tcount and filling the queue
        Tcount = 1;
        front_photocell = 1;
        #(6*T);

        // Invalide Tcount
        Tcount = 0;
        #(3*T)

        $finish;
        
    end

endmodule