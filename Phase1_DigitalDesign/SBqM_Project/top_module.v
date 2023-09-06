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
    wire ROM_enable;

    ROM Mem(
        .clk(clk),
        .ROM_enable(ROM_enable),
        .Tcount(Tcount),
        .Pcount(Pcount),
        .Wtime(Wtime)
    );

    queue_status QS(
        .clk(clk),
        .reset(reset),
        .Pcount(Pcount),
        .empty_flag(empty_flag),
        .full_flag(full_flag)
    );

    counter_nbits Counter(
        .front_photocell(front_photocell),
        .back_photocell(back_photocell),
        .clk(clk),
        .reset(reset),
        .Pcount(Pcount)
    );

    calculation_controller CC(
        .clk(clk),
        .Pcount(Pcount),
        .ROM_enable(ROM_enable)
    );

endmodule