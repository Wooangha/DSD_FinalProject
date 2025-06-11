
module two_bit_counter(
    input reset_n,
    input clk,
    output [1:0] count_out
);

    edge_trigger_T_FF tff0(
        .reset_n(reset_n),
        .t(1'b1), // T input is always high for toggle behavior
        .clk(clk),
        .q(count_out[0]),
        .q_()
    );
    edge_trigger_T_FF tff1(
        .reset_n(reset_n),
        .t(count_out[0]), // T input is connected to the first flip-flop output for toggling
        .clk(clk),
        .q(count_out[1]),
        .q_()
    );

endmodule