`include "datapath.v"
`include "control_unit.v"
`include "instruction_memory.v"
`include "data_memory.v"

module top(
    input clk, reset_n,
    output[15:0] test_value
);
    wire Jump, Branch, MemtoReg, ALUSrc, RegDst, RegWrite, MemWrite;
    wire[2:0] ALU_Control;
    wire[31:0] Instr, ReadData, PC, ALU_Out, WriteData;

    datapath DP(
        .clk(clk),
        .reset_n(reset_n),
        .ReadData(ReadData),
        .Instr(Instr),
        .ALU_Control(ALU_Control),
        .Jump(Jump),
        .Branch(Branch),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .PC(PC),
        .ALU_Out(ALU_Out),
        .WriteData(WriteData)
    );

    control_unit CU(
        .Opcode(Instr[31:26]),
        .Fucnt(Instr[5:0]),
        .ALU_Control(ALU_Control),
        .Jump(Jump),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .RegWrite(RegWrite)
    );

    instruction_memory IM(
        .A(PC[9:2]),
        .RD(Instr)
    );

    data_memory DM(
        .clk(clk),
        .WE(MemWrite),
        .A(ALU_Out),
        .WD(WriteData),
        .RD(ReadData),
        .test_value(test_value)
    );

endmodule