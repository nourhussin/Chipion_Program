module data_memory(
    input clk,WE,
    input[31:0] A, WD,
    output reg[31:0] RD,
    output[15:0] test_value
);
    reg[31:0] mem[255:0];
    // Is that LSB?
    assign test_value = mem[0];
    always @(posedge clk, negedge WE)
    begin
        if(WE)
            mem[A] <= WD;
        else
            RD <= mem[A];
    end
endmodule