`include"SBqM_Project/calculation_controller.v"
`include"SBqM_Project/counter_nbits.v"
`include"SBqM_Project/queue_status.v"
`include"SBqM_Project/ROM.v"
module top_module(
    input clk, reset, front_photocell, back_photocell,
    input[1:0] Tcount,
    output empty_flag, full_flag,
    output [2:0] Pcount,
    output [4:0] Wtime
);


endmodule