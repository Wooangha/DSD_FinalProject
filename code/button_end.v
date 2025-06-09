
module button_end(
    input wire reset_n,
    input wire clk,
    input wire input_wire,
    output wire output_wire
);

    wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9;
    wire outd0, outd1, outd2, outd3, outd4, outd5, outd6, outd7, outd8, outd9;

    // Delay stages
    assign d0 = reset_n & input_wire;
    edge_trigger_D_FF dff0(
        .reset_n(1'b1),
        .d(d0),
        .clk(clk),
        .q(outd0),
        .q_()
    );
    assign d1 = reset_n & outd0;
    edge_trigger_D_FF dff1(
        .reset_n(1'b1),
        .d(d1),
        .clk(clk),
        .q(outd1),
        .q_()
    );
    assign d2 = reset_n & outd1;
    edge_trigger_D_FF dff2(
        .reset_n(1'b1),
        .d(d2),
        .clk(clk),
        .q(outd2),
        .q_()
    );
    assign d3 = reset_n & outd2;
    edge_trigger_D_FF dff3( 
        .reset_n(1'b1),
        .d(d3),
        .clk(clk),
        .q(outd3),
        .q_()
    );
    assign d4 = reset_n & outd3;
    edge_trigger_D_FF dff4(
        .reset_n(1'b1),
        .d(d4),
        .clk(clk),
        .q(outd4),
        .q_()
    );
    assign d5 = reset_n & outd4;
    edge_trigger_D_FF dff5(
        .reset_n(1'b1),
        .d(d5),
        .clk(clk),
        .q(outd5),
        .q_()
    );
    assign d6 = reset_n & outd5;
    edge_trigger_D_FF dff6(
        .reset_n(1'b1),
        .d(d6),
        .clk(clk),
        .q(outd6),
        .q_()
    );
    assign d7 = reset_n & outd6;
    edge_trigger_D_FF dff7(
        .reset_n(1'b1),
        .d(d7),
        .clk(clk),
        .q(outd7),
        .q_()
    );
    assign d8 = reset_n & outd7;
    edge_trigger_D_FF dff8(
        .reset_n(1'b1),
        .d(d8),
        .clk(clk),
        .q(outd8),
        .q_()
    );
    assign d9 = reset_n & outd8;
    edge_trigger_D_FF dff9(
        .reset_n(1'b1),
        .d(d9),
        .clk(clk),
        .q(outd9),
        .q_()
    );
    assign output_wire = (outd9 & outd8 & outd7 & outd6 & outd5) & (~outd4 & ~outd3 & ~outd2 & ~outd1 & ~outd0);

endmodule