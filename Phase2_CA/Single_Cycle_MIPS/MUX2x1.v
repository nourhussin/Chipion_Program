module MUX2x1(
    input[N-1:0] in0, in1,
    input selector,
    output[N-1:0] out
);
    parameter N = 1;
    assign out = selector? in1: in0;
endmodule