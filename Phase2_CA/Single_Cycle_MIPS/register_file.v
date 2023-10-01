module register_file(
    input clk, WE3,
    input[4:0] A1, A2, A3,
    input[31:0] WD3,
    output reg[31:0] RD1, RD2
);
    reg[31:0] mem[31:0];
    always @(posedge clk, negedge WE3)
    begin
        if(WE3)
            mem[A3] <= WD3;
        else
            RD1 <= mem[A1];
            RD2 <= mem[A2];
    end

endmodule