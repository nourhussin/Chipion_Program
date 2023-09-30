module ALU_decoder(
    input[1:0] ALU_op,
    input[5:0] Fucnt,
    output reg[2:0] ALU_Control
);
    localparam add = 3'b010;
    localparam sub = 3'b100;
    localparam slt = 3'b110;
    localparam mult= 3'b101;

    always @(*)
    begin
        case(ALU_op)
        2'b00:
            ALU_Control <= add;
        2'b01:
            ALU_Control <= sub;
        2'b10:
            if(Fucnt == 6'b100000)
                ALU_Control <= add;

            else if(Fucnt == 6'b100010)
                ALU_Control <= sub;

            else if(Fucnt == 6'b101010)
                ALU_Control <= slt;

            else if(Fucnt == 6'b011100)
                ALU_Control <= mult;

            else
                ALU_Control <= add;
        default:
            ALU_Control <= add;
        endcase
    end
endmodule 