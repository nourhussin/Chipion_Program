module moore_detector (
    input clk,
    input reset,
    input x,
    output reg y
);

reg [1:0] state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        y <= 0;
    end else begin
        case (state)
            S0: begin
                if (x) begin
                    state <= S1;
                    y <= 0;
                end else begin
                    state <= S0;
                    y <= 0;
                end
            end
            S1: begin
                if (x) begin
                    state <= S2;
                    y <= 0;
                end else begin
                    state <= S0;
                    y <= 0;
                end
            end
				S2: begin
                if (x) begin
                    state <= S2;
                    y <= 0;
                end else begin
                    state <= S3;
                    y <= 0;
                end
            end
				S3: begin
                if (x) begin
                    state <= S1;
                    y <= 1;
                end else begin
                    state <= S0;
                    y <= 0;
                end
            end
        endcase
    end
end

endmodule