

module counter_25(
    input reset_n,
    input clk,
    output [24:0] count_out
);

    wire T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24;
    assign count_out = {T24, T23, T22, T21, T20, T19, T18, T17, T16, T15, T14, T13, T12, T11, T10, T9, T8, T7, T6, T5, T4, T3, T2, T1, T0};

    wire last = T24 & ~T23 & T22 & T21 & T20 & T19 & T18 & ~T17 & T16 & ~T15 & T14 & T13 & T12 & T11 & ~T10 & ~T9 & ~T8 & ~T7 & T6 & ~T5 & ~T4 & ~T3 & ~T2 & ~T1 & ~T0;

    edge_trigger_T_FF tff0(
        .reset_n(reset_n), 
        .t(~last & 1'b1), 
        .clk(clk), 
        .q(T0),
        .q_()
    );
    edge_trigger_T_FF tff1(
        .reset_n(reset_n), 
        .t(T0), 
        .clk(clk), 
        .q(T1),
        .q_()
    );
    edge_trigger_T_FF tff2(
        .reset_n(reset_n), 
        .t(T1 & T0), 
        .clk(clk), 
        .q(T2),
        .q_()
    );
    edge_trigger_T_FF tff3(
        .reset_n(reset_n), 
        .t(T2 & T1 & T0), 
        .clk(clk), 
        .q(T3),
        .q_()
    );
    edge_trigger_T_FF tff4(
        .reset_n(reset_n), 
        .t(T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T4),
        .q_()
    );
    edge_trigger_T_FF tff5(
        .reset_n(reset_n), 
        .t(T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T5),
        .q_()
    );
    edge_trigger_T_FF tff6(
        .reset_n(reset_n), 
        .t(last | T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T6),
        .q_()
    );
    edge_trigger_T_FF tff7(
        .reset_n(reset_n), 
        .t(T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T7),
        .q_()
    );
    edge_trigger_T_FF tff8(
        .reset_n(reset_n), 
        .t(T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T8),
        .q_()
    );
    edge_trigger_T_FF tff9(
        .reset_n(reset_n), 
        .t(T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T9),
        .q_()
    );
    edge_trigger_T_FF tff10(
        .reset_n(reset_n), 
        .t(T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T10),
        .q_()
    );
    edge_trigger_T_FF tff11(
        .reset_n(reset_n), 
        .t(last | T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T11),
        .q_()
    );
    edge_trigger_T_FF tff12(
        .reset_n(reset_n), 
        .t(last | T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T12),
        .q_()
    );
    edge_trigger_T_FF tff13(
        .reset_n(reset_n), 
        .t(last | T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T13),
        .q_()
    );
    edge_trigger_T_FF tff14(
        .reset_n(reset_n), 
        .t(last | T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T14),
        .q_()
    );
    edge_trigger_T_FF tff15(
        .reset_n(reset_n), 
        .t(T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T15),
        .q_()
    );
    edge_trigger_T_FF tff16(
        .reset_n(reset_n), 
        .t(last | T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T16),
        .q_()
    );
    edge_trigger_T_FF tff17(
        .reset_n(reset_n), 
        .t(T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T17),
        .q_()
    );
    edge_trigger_T_FF tff18(
        .reset_n(reset_n), 
        .t(last | T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T18),
        .q_()
    );
    edge_trigger_T_FF tff19(
        .reset_n(reset_n), 
        .t(last | T18 & T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T19),
        .q_()
    );
    edge_trigger_T_FF tff20(
        .reset_n(reset_n), 
        .t(last | T19 & T18 & T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T20),
        .q_()
    );
    edge_trigger_T_FF tff21(
        .reset_n(reset_n), 
        .t(last | T20 & T19 & T18 & T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T21),
        .q_()
    );
    edge_trigger_T_FF tff22(
        .reset_n(reset_n), 
        .t(last | T21 & T20 & T19 & T18 & T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T22),
        .q_()
    );
    edge_trigger_T_FF tff23(
        .reset_n(reset_n), 
        .t(T22 & T21 & T20 & T19 & T18 & T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T23),
        .q_()
    );
    edge_trigger_T_FF tff24(
        .reset_n(reset_n), 
        .t(last | T23 & T22 & T21 & T20 & T19 & T18 & T17 & T16 & T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T24),
        .q_()
    );



endmodule

module clk_25(
    input reset_n,
    input clk,
    output clk_out
);

    wire [24:0] count_out;

    counter_25 counter_inst(
        .reset_n(reset_n),
        .clk(clk),
        .count_out(count_out)
    );

    wire clk_out_tmp;

    two_to_one_mux mux_inst(
        .a(clk_out),
        .b(~clk_out),
        .sel(~count_out[24] & ~count_out[23] & ~count_out[22] & ~count_out[21] & ~count_out[20] & ~count_out[19] & ~count_out[18] & ~count_out[17] & ~count_out[16] & ~count_out[15] & ~count_out[14] & ~count_out[13] & ~count_out[12] & ~count_out[11] & ~count_out[10] & ~count_out[9] & ~count_out[8] & ~count_out[7] & ~count_out[6] & ~count_out[5] & ~count_out[4] & ~count_out[3] & ~count_out[2] & ~count_out[1] & ~count_out[0]),
        .out(clk_out_tmp)
    );

    edge_trigger_D_FF dff_inst(
        .reset_n(reset_n),
        .d(clk_out_tmp),
        .clk(clk),
        .q(clk_out),
        .q_()
    );

    
endmodule

module counter_10(
    input reset_n,
    input clk,
    output [16:0] count_out
);

    wire T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16;
    assign count_out = {T16, T15, T14, T13, T12, T11, T10, T9, T8, T7, T6, T5, T4, T3, T2, T1, T0};
    wire last = T16 & T15 & ~T14 & ~T13 & ~T12 & ~T11 & T10 & T9 & ~T8 & T7 & ~T6 & T5 & ~T4 & ~T3 & ~T2 & ~T1 & ~T0;

    edge_trigger_T_FF tff0(
        .reset_n(reset_n), 
        .t(~last & 1'b1), 
        .clk(clk), 
        .q(T0),
        .q_()
    );
    edge_trigger_T_FF tff1(
        .reset_n(reset_n), 
        .t(T0), 
        .clk(clk), 
        .q(T1),
        .q_()
    );
    edge_trigger_T_FF tff2(
        .reset_n(reset_n), 
        .t(T1 & T0), 
        .clk(clk), 
        .q(T2),
        .q_()
    );
    edge_trigger_T_FF tff3(
        .reset_n(reset_n), 
        .t(T2 & T1 & T0), 
        .clk(clk), 
        .q(T3),
        .q_()
    );
    edge_trigger_T_FF tff4(
        .reset_n(reset_n), 
        .t(T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T4),
        .q_()
    );
    edge_trigger_T_FF tff5(
        .reset_n(reset_n), 
        .t(last | T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T5),
        .q_()
    );
    edge_trigger_T_FF tff6(
        .reset_n(reset_n), 
        .t(T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T6),
        .q_()
    );
    edge_trigger_T_FF tff7(
        .reset_n(reset_n), 
        .t(last | T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T7),
        .q_()
    );
    edge_trigger_T_FF tff8(
        .reset_n(reset_n), 
        .t(T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T8),
        .q_()
    );
    edge_trigger_T_FF tff9(
        .reset_n(reset_n), 
        .t(last | T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T9),
        .q_()
    );
    edge_trigger_T_FF tff10(
        .reset_n(reset_n), 
        .t(last | T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T10),
        .q_()
    );
    edge_trigger_T_FF tff11(
        .reset_n(reset_n), 
        .t(T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T11),
        .q_()
    );
    edge_trigger_T_FF tff12(
        .reset_n(reset_n), 
        .t(T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T12),
        .q_()
    );
    edge_trigger_T_FF tff13(
        .reset_n(reset_n), 
        .t(T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T13),
        .q_()
    );
    edge_trigger_T_FF tff14(
        .reset_n(reset_n), 
        .t(T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T14),
        .q_()
    );
    edge_trigger_T_FF tff15(
        .reset_n(reset_n), 
        .t(last | T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T15),
        .q_()
    );
    edge_trigger_T_FF tff16(
        .reset_n(reset_n), 
        .t(last | T15 & T14 & T13 & T12 & T11 & T10 & T9 & T8 & T7 & T6 & T5 & T4 & T3 & T2 & T1 & T0), 
        .clk(clk), 
        .q(T16),
        .q_()
    );

endmodule

module clk_10(
    input reset_n,
    input clk,
    output clk_out
);

    wire [16:0] count_out;

    counter_10 counter_inst(
        .reset_n(reset_n),
        .clk(clk),
        .count_out(count_out)
    );

    wire clk_out_tmp;

    two_to_one_mux mux_inst(
        .a(clk_out),
        .b(~clk_out),
        .sel(~count_out[16] & ~count_out[15] & ~count_out[14] & ~count_out[13] & ~count_out[12] & ~count_out[11] & ~count_out[10] & ~count_out[9] & ~count_out[8] & ~count_out[7] & ~count_out[6] & ~count_out[5] & ~count_out[4] & ~count_out[3] & ~count_out[2] & ~count_out[1] & ~count_out[0]),
        .out(clk_out_tmp)
    );

    edge_trigger_D_FF dff_inst(
        .reset_n(reset_n),
        .d(clk_out_tmp),
        .clk(clk),
        .q(clk_out),
        .q_()
    );

endmodule
