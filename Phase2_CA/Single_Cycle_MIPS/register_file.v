module register_file(
    input clk, WE3,
    input[4:0] A1, A2, A3,
    input[31:0] WD3,
    output[31:0] RD1, RD2
);
    reg[31:0] mem[31:0];

    assign RD1 = mem[A1];
    assign RD2 = mem[A2];

    always @(posedge clk)
    begin
        if(WE3)
            mem[A3] <= WD3;
    end

    integer i;
    initial 
    begin
        for (i=0; i<32; i=i+1)
            mem[i] = 32'b0;
        
    end
endmodule