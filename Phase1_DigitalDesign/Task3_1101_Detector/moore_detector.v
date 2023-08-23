module moore_detector (
    input clk,
    input reset,
    input x,
    output y
);
    reg [2:0] current_state, next_state;

    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    /* Register Logic*/
    always @(posedge clk or posedge reset) begin
        if (reset) 
            current_state <= S0;
        else 
            current_state <= next_state;
    end

    /* Next State Logic*/
    always @(*) begin
        case(current_state)
        S0: 
            if(x)
                next_state <= S1;
            else
                next_state <= S0;

        S1: 
            if(x)
                next_state <= S2;
            else
                next_state <= S0;

        S2:
            if(x)
                next_state <= S2;
            else
                next_state <= S3;

        S3:
            if(x)
                next_state <= S4;
            else
                next_state <= S0;

        S4:
            if(x)
                next_state <= S1;
            else
                next_state <= S0;
        endcase
    end

    /* Output Logic*/
    assign y = (current_state == S4)? 1'b1 : 1'b0;

endmodule
