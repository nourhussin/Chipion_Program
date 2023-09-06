module ROM (
    input clk, ROM_enable,
    input[1:0] Tcount,
    input[2:0] Pcount,
    output reg[4:0] Wtime
);
    // Max Wtime = 21 (5 bits) when Tcount = 1 and Pcount = 7 
    reg[4:0] memory [31:8]; // 5 bits data and 24 locations
    wire[4:0] address;
    assign address = {Tcount,Pcount};

    always @(posedge clk)
    begin
        if(ROM_enable)
        begin
            if(Tcount == 0)
                //! No teller is serving
                Wtime <= 5'b11111;
            else
                Wtime <= memory[address];
        end
    end

    initial 
    begin
        memory[8]  = 5'd0;
        memory[9]  = 5'd3;
        memory[10] = 5'd6;
        memory[11] = 5'd9;
        memory[12] = 5'd12;
        memory[13] = 5'd15;
        memory[14] = 5'd18;
        memory[15] = 5'd21;

        memory[16] = 5'd0;
        memory[17] = 5'd3;
        memory[18] = 5'd5; //Round 4.5
        memory[19] = 5'd6;
        memory[20] = 5'd8; //Round 7.5
        memory[21] = 5'd9;
        memory[22] = 5'd11;//Round 10.5
        memory[23] = 5'd12;

        memory[24] = 5'd0;
        memory[25] = 5'd3;
        memory[26] = 5'd4;
        memory[27] = 5'd5;
        memory[28] = 5'd6;
        memory[29] = 5'd7;
        memory[30] = 5'd8;
        memory[31] = 5'd9;
    end

endmodule