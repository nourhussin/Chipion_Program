module calculation_controller #(parameter N = 3)(
    input clk,
    input[N-1:0] Pcount,
    output reg ROM_enable
);

    always @(posedge clk)
    begin
        if(Pcount == 0)
            //! No calculation
            ROM_enable = 1'b0;
        else
            // Calculating 
            ROM_enable = 1'b1;
    end 

endmodule