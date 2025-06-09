
`timescale 1ms / 1us

module state_transition (
    input reset_n,
    input [2:0] input_wire,
    input clk,
    output [9:0] output_state
);
    wire A, B, C, D, E, F, G, H, I, J, K, L, M;
    assign {A, B, C, D, E, F, G, H, I, J} = output_state;
    assign {K, L, M} = input_wire;

    wire D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    assign D0 = reset_n & ((I & J & ~K & ~L) | (H & J & ~K & ~L) | (J & K & L & M) | (G & ~H & ~J & ~K & L) | (H & ~K & M) | (I & ~K & L & M) | (J & ~K & ~L & M) | (~H & ~I & J & ~K & L & ~M) | (C & ~I & J & ~K & ~M) | (F & ~H & ~J & ~K & L) | (~D & ~E & G & K & ~L & ~M) | (~D & ~E & F & K & ~L & ~M));
    assign D1 = reset_n & ((I & L & M) | (I & ~K & M) | (I & J & ~K & L) | (H & J & ~K & ~L & M) | (~H & J & ~K & L & M) | (C & I & ~K & ~L));
    assign D2 = reset_n & ((H & L & M) | (H & ~K & ~M) | (~C & J & ~K & ~L & ~M) | (~C & I & ~K & ~L & ~M));
    assign D3 = reset_n & ((G & ~K) | (G & L & M) | (F & G & J & ~L & ~M) | (B & ~H & J & K & ~L & ~M) | (~C & E & ~I & K & ~L & ~M) | (~D & ~E & G & ~L & ~M) | (C & ~E & ~J & ~L & ~M) | (~B & ~D & I & J & ~L & ~M) | (~F & H & ~J & ~L & ~M) | (~B & D & E & ~I & ~L & ~M));
    assign D4 = ~reset_n | ((K & ~L & M) | (K & L & ~M) | (F & ~K) | (~E & ~G & H) | (~E & F & ~J) | (F & M) | (~C & I & K & ~L) | (B & E & ~H & ~J & K & ~L) | (B & D & I & J & K & ~L) | (~B & ~C & K & ~L) | (~E & ~F & H & J & K & ~L) | (~C & D & E & ~F & ~J & K & ~L));
    assign D5 = reset_n & ((E & ~K) | (E & L & M) | (~D & ~F & G & ~K & L) | (~D & F & ~G & ~K & L) | (~D & G & ~K & L & M));
    assign D6 = reset_n & ((D & ~K) | (D & L & M) | (~E & G & ~K & L & M) | (~D & ~E & G & K & ~L & ~M) | (~E & F & ~K & L & M) | (~D & ~E & F & K & ~L & ~M) | (~E & F & G & ~K & L));
    assign D7 = reset_n & ((~F & H & K & ~L & ~M) | (C & ~K) | (C & L & M) | (C & ~D & I & J & ~L & ~M) | (C & ~E & ~J & ~L & ~M) | (C & D & E & ~I & ~L & ~M) | (E & ~I & ~J & K & ~L & ~M) | (E & ~G & H & K & ~L & ~M) | (D & G & H & J & K & ~L & ~M));
    assign D8 = ~reset_n | ((K & ~L & M) | (K & L & ~M) | (~D & F & G & J) | (~E & F & ~J) | (B & ~K) | (B & M) | (~C & ~H & K & ~L) | (B & ~E & ~F & J) | (B & ~D & ~H & ~I) | (B & E & ~H & ~J) | (~E & ~G & K & ~L) | (~B & ~E & I & ~J & K & ~L) | (~B & ~D & I & J & K & ~L) | (~C & D & E & ~F & ~J) | (~B & D & E & ~I & K & ~L) | (B & D & I & J));
    assign D9 = reset_n & ((K & ~L & M) | (A & ~K & ~L) | (A & K & M) | (A & ~D & G & H & J & ~L) | (A & ~E & ~F & H & J & ~L) | (A & ~E & ~G & H & ~L) | (A & C & ~D & I & J & ~L) | (A & C & D & E & ~I & ~L) | (A & E & ~K) | (A & D & ~K) | (~A & B & ~C & ~H & K & ~L) | (~A & ~D & ~E & G & ~K & L) | (~A & B & ~D & ~J & K & ~L) | (A & ~B & I & ~L) | (~A & D & E & F & K & ~L) | (~A & ~E & ~F & G & ~I & ~J & K & ~L) | (~A & ~D & ~E & F & ~K & L) | (~A & ~C & E & ~F & J & K & ~L) | (~A & B & ~E & ~H & J & K & ~L) | (~A & B & D & E & I & K & ~L) | (A & ~B & ~C & ~K) | (A & ~B & J & ~L) | (~A & ~D & ~G & J & K & ~L) | (~A & ~E & F & G & J & K & ~L) | (~A & B & ~D & ~F & ~I & K & ~L) | (A & ~B & ~C & ~L) | (A & ~E & F & H & ~J & ~L) | (A & D & E & ~F & ~I & ~J & ~L) | (A & C & ~E & I & ~J & ~L));

    edge_trigger_D_FF d0(
        .reset_n(1'b1),
        .d(D0),
        .clk(clk),
        .q(J),
        .q_()
    );
    edge_trigger_D_FF d1(
        .reset_n(1'b1),
        .d(D1),
        .clk(clk),
        .q(I),
        .q_()
    );
    edge_trigger_D_FF d2(
        .reset_n(1'b1),
        .d(D2),
        .clk(clk),
        .q(H),
        .q_()
    );
    edge_trigger_D_FF d3(
        .reset_n(1'b1),
        .d(D3),
        .clk(clk),
        .q(G),
        .q_()
    );
    edge_trigger_D_FF d4(   
        .reset_n(1'b1),
        .d(D4),
        .clk(clk),
        .q(F),
        .q_()
    );
    edge_trigger_D_FF d5(
        .reset_n(1'b1),
        .d(D5),
        .clk(clk),
        .q(E),
        .q_()
    );
    edge_trigger_D_FF d6(
        .reset_n(1'b1),
        .d(D6),
        .clk(clk),
        .q(D),
        .q_()
    );
    edge_trigger_D_FF d7(
        .reset_n(1'b1),
        .d(D7),
        .clk(clk),
        .q(C),
        .q_()
    );
    edge_trigger_D_FF d8(
        .reset_n(1'b1),
        .d(D8),
        .clk(clk),
        .q(B),
        .q_()
    );
    edge_trigger_D_FF d9(
        .reset_n(1'b1),
        .d(D9),
        .clk(clk),
        .q(A),
        .q_()
    );

endmodule