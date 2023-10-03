`include "register_file.v"
`include "MUX2x1.v"
`include "program_counter.v"
`include "adder.v"
`include "sign_extend.v"
`include "shift_left_twice.v"
`include "ALU.v"

module datapath(
    input clk, reset_n,
    input[31:0] ReadData, Instr,
    input[2:0] ALU_Control,
    input jump, Branch, MemtoReg, ALUSrc,RegDst, RegWrite,
    output[31:0] PC, ALU_Out, WriteData
);
    assign PCSrc = zero_flag && Branch;
    assign WriteData = RD2;

    // One bit Wires--------------------------------------------
    wire PCSrc, zero_flag;

    // 5 bit Wires----------------------------------------------
    wire[4:0] A1, A2, A3;

    // 28 bit wires---------------------------------------------
    wire[27:0] Instr_shifted;

    // 32 bit Wires---------------------------------------------
    wire[31:0] toPCbar_mux, PC_bar, SrcB, SignImm, SignImm_Shifted,
                PCPlus4, PCBranch, RD1, RD2,WD3;

    register_file RF(
        .A1(Instr[25:21]),
        .A2(Instr[20:16]),
        .A3(A3),
        .WD3(WD3),
        .RD1(RD1),
        .RD2(RD2),
        .clk(clk),
        .WE3(RegWrite)
    );

    ALU Arithmetic(
        .input_a(RD1),
        .input_b(SrcB),
        .result(ALU_Out),
        .operation(ALU_Control),
        .zero_flag(zero_flag),
        .clk(clk)
    );

    MUX2x1 #(.N(32)) PCSrc_mux(
        .in0(PCPlus4), 
        .in1(PCBranch), 
        .selector(PCSrc), 
        .out(toPCbar_mux)
    );
    MUX2x1 #(.N(32)) PCbar_mux(
        .in0(toPCbar_mux), 
        .in1({PCPlus4[31:28],Instr_shifted}), 
        .selector(jump), 
        .out(PC_bar)
    );
    MUX2x1 #(.N(32)) SrcB_mux(
        .in0(RD2), 
        .in1(SignImm), 
        .selector(ALUSrc), 
        .out(SrcB)
    );
    MUX2x1 #(.N(5)) WriteReg_mux(
        .in0(Instr[20:16]), 
        .in1(Instr[15:11]),
        .selector(RegDst), 
        .out(A3)
    );
    MUX2x1 #(.N(32)) Result_mux(
        .in0(ALU_Out), 
        .in1(ReadData), 
        .selector(MemtoReg), 
        .out(WD3)
    );

    program_counter ProgCount(
        .clk(clk), .reset_n(reset_n), .PC_bar(PC_bar), .PC(PC)
    );

    sign_extend SE(
        .in(Instr[15:0]), .out(SignImm)
    );

    adder ADD1(
        .in1(PC), .in2(4), .result(PCPlus4)
    );
    adder ADD2(
        .in1(SignImm_Shifted), .in2(PCPlus4), .result(PCBranch)
    );

    shift_left_twice SH1(
        .in(SignImm), .out(SignImm_Shifted)
    );
    shift_left_twice#(.N(28)) SH2(
        .in({2'b00,Instr[25:0]}), .out(Instr_shifted)
    );
endmodule