module data_memory(
    input clk,WE,
    input[31:0] A, WD,
    output[31:0] RD,
    output[15:0] test_value
);
    reg[31:0] mem[255:0];
    assign RD = mem[A];
    // Is that LSB?
    assign test_value = mem[0];

    always @(posedge clk)
    begin
        if(WE)
            mem[A] <= WD;
    end
endmodule