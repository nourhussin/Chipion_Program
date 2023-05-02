module mealy_detector (
    input clk,
    input reset,
    input x,
    output reg y
);

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

wire [2:0] state_next;
reg [2:0] state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        y <= 0;
	 end 
	 else begin
        state <= state_next;
        y <= (state == S4);
    end
end

fsm_state_transition transition_unit (
    .clk(clk),
    .reset(reset),
    .x(x),
    .state(state),
    .state_next(state_next)
);

endmodule

module fsm_state_transition (
    input clk,
    input reset,
    input x,
    input [2:0] state,
    output reg [2:0] state_next
);
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

always @(*) begin
    case (state)
        S0: begin
            if (x) begin
                state_next = S1;
            end else begin
                state_next = S0;
            end
        end
        S1: begin
            if (x) begin
                state_next = S2;
            end else begin
                state_next = S0;
            end
        end
		  S2: begin
            if (x) begin
                state_next = S2;
            end else begin
                state_next = S3;
            end
        end
		  S3: begin
            if (x) begin
                state_next = S4;
            end else begin
                state_next = S0;
            end
        end
		  S4: begin
            if (x) begin
                state_next = S1;
            end else begin
                state_next = S0;
            end
        end
    endcase
end

endmodule