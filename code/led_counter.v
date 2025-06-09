
`timescale 1s / 1ms

module led_counter(
    input wire reset_n,
    input wire clk,
    output wire [2:0] led_count,
);
    edge_trigger_T_FF t_ff(
        .reset_n(reset_n),
        .t(1'b1),
        .clk(clk),
        .q(led_count[0]),
        .q_()
    );
    edge_trigger_T_FF t_ff1(
        .reset_n(reset_n),
        .t(led_count[0]),
        .clk(clk),
        .q(led_count[1]),
        .q_()
    );
    edge_trigger_T_FF t_ff2(
        .reset_n(reset_n),
        .t(led_count[1] & led_count[0]),
        .clk(clk),
        .q(led_count[2]),
        .q_()
    );

endmodule
