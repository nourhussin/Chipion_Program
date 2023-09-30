module main_decoder(
    input[5:0] Opcode,
    output[1:0] ALU_op,
    output MemtoReg, MemWrite, Branch,
           ALUSrc, RegDst, RegWrite, Jump
);
    reg[8:0] Controls ;

    always @(*)
    begin
        case(Opcode)
        6'b100011:
            Controls <= 9'b000010110 ;
        6'b101011:
            Controls <= 9'b000100110 ;
        6'b000000:
            Controls <= 9'b010011000 ;
        6'b001000:
            Controls <= 9'b000010100 ;
        6'b000100:
            Controls <= 9'b001000001 ;
        6'b000010:
            Controls <= 9'b100000000 ;
        default:
            Controls <= 9'b000000000 ;
        endcase
    end
    assign {Jump, ALU_op, MemWrite,
            RegWrite, RegDst, ALUSrc, 
            MemtoReg, Branch} = Controls;
endmodule