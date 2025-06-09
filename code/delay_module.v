

`timescale 1ms / 1us

module delay_module(
    input reset_n,
    input input_wire,
    input clk,
    output output_wire
);

    wire d0, d1, d2, d3;
    wire outd0, outd1, outd2, outd3;
    wire outd0_, outd1_, outd2_, outd3_;

    // Delay stages
    assign d0 = reset_n & input_wire;
    edge_trigger_D_FF dff0(
        .reset_n(1'b1),
        .d(d0),
        .clk(clk),
        .q(outd0),
        .q_(outd0_)
    );

    assign d1 = reset_n & outd0;
    edge_trigger_D_FF dff1(
        .reset_n(1'b1),
        .d(d1),
        .clk(clk),
        .q(outd1),
        .q_(outd1_)
    );

    assign d2 = reset_n & outd1;
    edge_trigger_D_FF dff2(
        .reset_n(1'b1),
        .d(d2),
        .clk(clk),
        .q(outd2),
        .q_(outd2_)
    );

    assign d3 = reset_n & outd2;
    edge_trigger_D_FF dff3(
        .reset_n(1'b1),
        .d(d3),
        .clk(clk),
        .q(outd3),
        .q_(outd3_)
    );

    assign output_wire = outd3 & outd2 & outd1 & outd0;


endmodule
