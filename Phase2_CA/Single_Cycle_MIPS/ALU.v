module ALU(
    input[31:0] input_a, input_b,
    input[2:0] operation,
    input clk,
    output reg[31:0] result,
    output zero_flag
);
    localparam  bit_and = 3'b000;
    localparam  bit_or  = 3'b001;
    localparam  add     = 3'b010;
    localparam  sub     = 3'b100;
    localparam  mult    = 3'b101;
    localparam  setless = 3'b110;
    // 111 and 011 are not used

    assign zero_flag = ~(|result);

    always @(posedge clk)
    begin
        case(operation)
        bit_and:
            result <= input_a & input_b;

        bit_or:
            result <= input_a | input_b;

        add:
            result <= input_a + input_b;

        sub:
            result <= input_a - input_b;

        mult:
            result <= input_a * input_b;

        setless:
            if(input_a < input_b)
                result <= 1;
            else
                result <= 0;

        default:
            result <= 0;
        endcase
    end
endmodule