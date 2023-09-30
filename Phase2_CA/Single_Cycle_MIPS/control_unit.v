`include "ALU_decoder.v"
`include "main_decoder.v"

module control_unit(
    input[5:0] Opcode,Fucnt,
    output[2:0] ALU_Control,
    output Jump, MemtoReg, MemWrite,Branch,
                 ALUSrc, RegDst, RegWrite  
);
    wire[1:0] ALU_op;

    main_decoder MD(
        .Opcode(Opcode),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ALU_op(ALU_op)
    );

    ALU_decoder ALUD(
        .ALU_op(ALU_op),
        .Fucnt(Fucnt),
        .ALU_Control(ALU_Control)
    );
endmodule