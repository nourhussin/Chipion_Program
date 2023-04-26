module Loop_Decoder_3_to_8(input [2:0] A, output reg [7:0] Y);

  integer i;

  always @ (A)
  begin
    for (i = 0; i < 8; i = i + 1)
      if (A == i)
        Y[i] = 1;
      else
        Y[i] = 0;
  end

endmodule