module shift_left_twice(
    input[N-1:0] in,
    output[N-1:0] out
);
    parameter N = 32;
    assign out = in << 2;
endmodule