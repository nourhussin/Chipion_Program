module mealy_detector (
    input clk,
    input reset,
    input x,
    output  y
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [2:0] current_state, next_state;

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
            next_state <= S1;
        else
            next_state <= S0;
            
    endcase
end

/* Output Logic*/
assign y = (current_state==S3 && x)? 1'b1 : 1'b0;
endmodule
