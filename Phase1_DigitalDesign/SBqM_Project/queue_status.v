module queue_status #(parameter N = 3)(
    input clk,
    input[N-1:0] Pcount,
    output reg empty_flag, full_flag
);

    always @(posedge clk)
    begin
        if (&Pcount) // all ones ---> max value
        begin //! Full Condition
            empty_flag = 1'b0;
            full_flag  = 1'b1;
        end

        else if(Pcount == 0) // min value
        begin //! Empty Condition
            empty_flag = 1'b1;
            full_flag  = 1'b0;
        end

        else 
        begin //! Occupied Condition
            empty_flag = 1'b0;
            full_flag  = 1'b0;
        end
    end

endmodule