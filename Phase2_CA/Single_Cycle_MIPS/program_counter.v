module program_counter(
    input clk, reset_n,
    input[31:0] PC_bar,
    output reg[31:0] PC
);
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            PC <= 32'b0;
        else
            PC <= PC_bar;
    end
endmodule