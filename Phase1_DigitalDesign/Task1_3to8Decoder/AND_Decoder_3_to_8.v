module AND_Decoder_3_to_8(
  input [2:0] A,
  output [7:0] Y
);

  wire A0, A1, A2; // Declare wires for each input bit

  // Connect each output bit to the correct combination of input bits
  assign Y[0] = ~A0 & ~A1 & ~A2;
  assign Y[1] = ~A0 & ~A1 & A2;
  assign Y[2] = ~A0 & A1 & ~A2;
  assign Y[3] = ~A0 & A1 & A2;
  assign Y[4] = A0 & ~A1 & ~A2;
  assign Y[5] = A0 & ~A1 & A2;
  assign Y[6] = A0 & A1 & ~A2;
  assign Y[7] = A0 & A1 & A2;

  // Assign input wires based on input signals
  assign A0 = A[0];
  assign A1 = A[1];
  assign A2 = A[2];

endmodule
