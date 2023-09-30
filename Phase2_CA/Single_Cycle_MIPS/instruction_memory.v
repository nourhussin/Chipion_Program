module instruction_memory(
    input[9:2] A,
    output[31:0] RD
);
    reg[31:0] mem[255:0];
    assign RD = mem[A];

    initial
    begin
        // Number Factorial
        mem[0] = 32'h00008020;
        mem[1] = 32'h20100007;
        mem[2] = 32'h00008820;
        mem[3] = 32'h20110001;
        mem[4] = 32'h12000003;
        mem[5] = 32'h0230881c;
        mem[6] = 32'h2210ffff;
        mem[7] = 32'h08000004;
        mem[8] = 32'hac110000;
        mem[9] = 0;
        mem[10]= 0;

        /*// Greatest Common Divisor
        mem[0] = 32'h00008020;
        mem[1] = 32'h20100078;
        mem[2] = 32'h00008820;
        mem[3] = 32'h201100B4;
        mem[4] = 32'h00009020;
        mem[5] = 32'h12110006;
        mem[6] = 32'h0211482A;
        mem[7] = 32'h11200002;
        mem[8] = 32'h02308822;
        mem[9] = 32'h08000005;
        mem[10] = 32'h02118022;
        mem[11] = 32'h08000005;
        mem[12] = 32'h00109020;
        mem[13] = 32'hAC120000;
        mem[14] = 0;
        mem[15] = 0;
        */
    end
endmodule