module counter_nbits #(parameter N = 3)(
    input front_photocell, back_photocell, clk,
    output reg[N-1:0] Pcount
);

    always @(posedge clk)
    begin
        case({front_photocell,back_photocell})

        2'b11: // Person entered and person exited
                Pcount <= Pcount;

        2'b10: // Person entered
                if(&Pcount) //max number 111
                    //! Sensor Error
                    Pcount <= Pcount;
                else 
                    Pcount <= Pcount +1;

        2'b01: // Person exited
                if (Pcount == 0) //min number 000
                    //! Sensor Error
                    Pcount <= Pcount;
                else
                    Pcount <= Pcount -1;

        2'b00: // Nothing happed
                Pcount <= Pcount;

        endcase
    end

endmodule