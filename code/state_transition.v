
`timescale 1ms / 1us

module state_transition (
    input reset_n,
    input [2:0] input_wire,
    input clk,
    output [9:0] output_state
);
    wire A, B, C, D, E, F, G, H, I, J, K, L, M;
    // assign {A, B, C, D, E, F, G, H, I, J} = output_state;
    assign output_state = {A, B, C, D, E, F, G, H, I, J};
    assign {K, L, M} = input_wire;

    wire D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    assign D0 = reset_n & ((C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & L) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & ~L & ~M) | (C & E & ~F & G & ~H & J & ~K & ~L) | (C & E & ~F & G & ~H & ~I & J & ~K & ~M) | (C & E & ~F & G & ~H & J & K & L & M) | (C & E & ~F & G & ~H & I & ~J & ~K & L) | (C & D & ~F & G & ~H & J & ~K & ~L) | (C & D & ~F & G & ~H & ~I & J & ~K & ~M) | (C & D & ~F & G & ~H & J & K & L & M) | (C & D & ~F & G & ~H & I & ~J & ~K & L) | (B & ~C & ~D & ~E & F & ~H & ~I & ~J & ~K & L) | (B & ~C & ~D & ~E & F & ~H & ~I & ~J & K & ~L & ~M) | (B & ~C & E & G & H & ~I & ~K & M) | (B & ~C & E & G & H & ~I & J & ~K & ~L) | (B & ~C & E & F & ~H & ~I & J & ~K & L & ~M) | (B & ~C & E & F & ~H & I & ~J & ~K & L) | (B & ~C & E & F & ~H & I & J & ~K & ~L) | (B & ~C & E & F & H & ~I & ~K & M) | (B & ~C & E & F & H & ~I & J & ~K & ~L) | (B & ~C & D & G & H & ~I & ~K & M) | (B & ~C & D & G & H & ~I & J & ~K & ~L) | (B & ~C & D & F & ~H & ~I & J & ~K & L & ~M) | (B & ~C & D & F & ~H & I & ~J & ~K & L) | (B & ~C & D & F & ~H & I & J & ~K & ~L) | (B & ~C & D & F & H & ~I & ~K & M) | (B & ~C & D & F & H & ~I & J & ~K & ~L) | (B & ~C & E & G & ~H & J & K & L & M) | (B & ~C & D & F & ~I & J & K & L & M) | (B & ~C & D & F & ~H & I & J & L & M) | (B & ~C & E & G & ~H & J & ~K & ~L & M) | (B & E & ~F & G & ~H & I & ~K & L & M) | (C & D & ~F & G & ~H & I & ~K & L & M) | (B & ~C & E & G & ~I & J & K & L & M) | (B & ~C & E & F & ~H & I & J & L & M) | (B & ~C & D & G & ~H & J & ~K & ~L & M) | (B & ~C & D & G & ~H & I & ~J & ~K & L) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~K & L) | (B & ~C & E & G & ~H & ~I & J & ~K & L & ~M) | (B & ~C & E & G & ~H & I & J & ~K & ~L) | (B & ~C & E & F & ~H & J & ~K & ~L & M) | (B & ~C & E & F & ~I & J & K & L & M) | (B & ~C & D & G & ~H & J & K & L & M) | (C & E & ~F & G & ~H & I & ~K & L & M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & K & ~L & ~M) | (B & ~C & E & G & ~H & I & ~J & ~K & L) | (B & ~C & D & G & ~H & ~I & J & ~K & L & ~M) | (B & ~C & D & G & ~I & J & K & L & M) | (B & ~C & D & G & ~H & I & ~K & L & M) | (B & ~C & D & G & ~H & I & J & ~K & ~L) | (B & ~C & D & F & ~H & J & ~K & ~L & M));
    assign D1 = reset_n & ((C & E & ~F & G & ~H & J & ~K & L & M) | (C & E & ~F & G & ~H & I & ~K & ~L) | (C & E & ~F & G & ~H & I & L & M) | (C & E & ~F & G & ~H & I & J & ~K) | (C & D & ~F & G & ~H & J & ~K & L & M) | (C & D & ~F & G & ~H & I & ~K & ~L) | (C & D & ~F & G & ~H & I & L & M) | (C & D & ~F & G & ~H & I & J & ~K) | (B & ~C & E & G & H & ~I & J & ~K & ~L & M) | (B & ~C & E & F & ~H & J & ~K & L & M) | (B & ~C & E & F & ~H & I & ~K & M) | (B & ~C & E & F & ~H & I & L & M) | (B & ~C & E & F & ~H & I & J & ~K & L) | (B & ~C & E & F & H & ~I & J & ~K & ~L & M) | (B & ~C & D & G & H & ~I & J & ~K & ~L & M) | (B & ~C & D & F & ~H & J & ~K & L & M) | (B & ~C & D & F & ~H & I & ~K & M) | (B & ~C & D & F & ~H & I & L & M) | (B & ~C & D & F & ~H & I & J & ~K & L) | (B & ~C & D & F & H & ~I & J & ~K & ~L & M) | (B & ~C & E & G & ~H & I & ~K & M) | (B & ~C & D & G & ~H & I & L & M) | (B & ~C & E & G & ~H & J & ~K & L & M) | (B & ~C & E & G & ~H & I & L & M) | (B & ~C & E & G & ~H & I & J & ~K & L) | (B & ~C & D & G & ~H & I & ~K & M) | (B & ~C & D & G & ~H & J & ~K & L & M) | (B & ~C & D & G & ~H & I & J & ~K & L));
    assign D2 = reset_n & ((B & ~C & E & G & ~H & I & ~K & ~L & ~M) | (B & ~C & E & G & H & ~I & ~K & ~M) | (B & ~C & E & G & H & ~I & L & M) | (B & ~C & E & F & ~H & I & ~K & ~L & ~M) | (B & ~C & E & F & H & ~I & ~K & ~M) | (B & ~C & E & F & H & ~I & L & M) | (B & ~C & D & G & ~H & I & ~K & ~L & ~M) | (B & ~C & D & G & H & ~I & ~K & ~M) | (B & ~C & D & G & H & ~I & L & M) | (B & ~C & D & F & ~H & I & ~K & ~L & ~M) | (B & ~C & D & F & H & ~I & ~K & ~M) | (B & ~C & D & F & H & ~I & L & M) | (B & ~C & E & G & ~H & J & ~K & ~L & ~M) | (B & ~C & D & F & ~H & J & ~K & ~L & ~M) | (B & ~C & E & F & ~H & J & ~K & ~L & ~M) | (B & ~C & D & G & ~H & J & ~K & ~L & ~M));
    assign D3 = reset_n & ((C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~L & ~M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & L & M) | (C & E & ~F & G & ~H & J & ~K) | (C & E & ~F & G & ~H & J & L & M) | (C & E & ~F & G & ~H & I & ~K) | (C & E & ~F & G & ~H & I & L & M) | (C & ~D & E & ~F & G & ~H & I & J & ~L & ~M) | (C & D & ~F & G & ~H & J & ~K) | (C & D & ~F & G & ~H & J & L & M) | (C & D & ~F & G & ~H & I & ~K) | (C & D & ~E & ~F & G & ~H & I & ~J & ~L & ~M) | (C & D & ~F & G & ~H & I & L & M) | (C & D & E & ~F & G & ~H & ~I & J & ~L & ~M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~K) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~L & ~M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & L & M) | (B & ~C & E & G & H & ~I & ~K) | (B & ~C & E & G & H & ~I & ~L & ~M) | (B & ~C & E & G & H & ~I & L & M) | (B & ~C & E & F & ~H & J & K & ~L & ~M) | (B & ~C & E & F & H & ~I & K & ~L & ~M) | (B & ~C & E & G & ~H & I & ~K) | (B & ~C & E & G & ~H & I & L & M) | (B & ~C & D & G & H & ~I & ~K) | (B & ~C & D & ~F & G & H & ~I & ~J & ~L & ~M) | (B & ~C & D & G & H & ~I & L & M) | (B & ~C & D & F & ~H & J & K & ~L & ~M) | (B & ~C & D & G & ~H & I & ~K) | (B & ~C & D & G & ~H & I & L & M) | (B & ~C & D & F & G & ~I & J & ~L & ~M) | (B & E & ~F & G & ~H & J & ~L & ~M) | (B & D & ~F & G & ~H & J & ~L & ~M) | (B & ~C & E & G & ~H & J & ~K) | (B & ~C & D & G & ~H & J & ~K) | (B & ~C & E & G & ~H & J & L & M) | (B & ~C & D & G & ~H & J & L & M));
    assign D4 = ~reset_n | ((~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & K & ~L) | (~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & K & ~M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & ~L & M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & L & ~M) | (C & E & ~F & G & ~H & J & K & ~L & M) | (C & E & ~F & G & ~H & J & K & L & ~M) | (C & E & ~F & G & ~H & I & K & ~L & M) | (C & E & ~F & G & ~H & I & K & L & ~M) | (C & D & ~F & G & ~H & J & K & ~L & M) | (C & D & ~F & G & ~H & J & K & L & ~M) | (C & D & ~F & G & ~H & I & K & ~L & M) | (C & D & ~F & G & ~H & I & K & L & ~M) | (B & ~C & ~D & ~E & F & ~H & ~I & ~J) | (B & ~C & E & G & H & ~I & K & ~L & M) | (B & ~C & E & G & H & ~I & K & L & ~M) | (B & ~C & E & F & ~H & I) | (B & ~C & E & F & H & ~I & ~K) | (B & ~C & E & F & H & ~I & M) | (B & ~C & E & F & H & ~I & L) | (B & ~C & D & G & H & ~I & K & ~L & M) | (B & ~C & D & G & H & ~I & K & L & ~M) | (B & ~C & D & F & ~H & I) | (B & ~C & D & ~E & F & ~G & H & ~I) | (B & ~C & D & ~E & F & H & ~I & ~J) | (B & ~C & D & F & ~I & J & ~K) | (B & ~C & E & F & ~H & J & M) | (B & ~C & E & G & ~H & I & K & ~L) | (B & ~C & D & F & ~I & J & L) | (B & ~C & D & G & ~H & I & K & ~M) | (B & ~C & E & G & ~H & J & K & L & ~M) | (B & ~C & E & F & ~H & J & ~K) | (B & ~C & D & G & ~H & J & K & ~L & M) | (B & E & ~F & G & ~H & I & ~J & K & ~M) | (B & D & ~F & G & ~H & I & J & K & ~L) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & K & ~L & M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & K & L & ~M) | (B & ~C & E & G & ~H & J & K & ~L & M) | (B & ~C & E & F & ~H & J & L) | (B & ~C & D & G & ~H & J & K & L & ~M) | (B & ~C & D & G & ~H & I & K & ~L) | (B & ~C & D & ~E & ~F & G & H & ~I & J & K & ~L) | (B & ~C & D & F & ~H & J & M) | (B & ~C & D & E & ~F & G & H & ~I & ~J & K & ~L));
    assign D5 = reset_n & ((C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & L) | (C & E & ~F & G & ~H & J & ~K) | (C & E & ~F & G & ~H & J & L & M) | (C & E & ~F & G & ~H & I & ~K) | (C & E & ~F & G & ~H & I & L & M) | (B & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & L) | (B & ~C & ~D & ~E & F & ~G & ~H & ~I & ~J & ~K & L) | (B & ~C & E & G & H & ~I & ~K) | (B & ~C & E & G & H & ~I & L & M) | (B & ~C & E & F & ~H & I & ~K) | (B & ~C & E & F & ~H & I & L & M) | (B & ~C & E & F & H & ~I & ~K) | (B & ~C & E & F & H & ~I & L & M) | (B & ~C & E & G & ~H & J & ~K) | (B & ~C & E & G & ~H & I & ~K) | (B & ~C & E & F & ~H & J & ~K) | (B & ~C & E & G & ~H & J & L & M) | (B & ~C & E & G & ~H & I & L & M) | (B & ~C & E & F & ~H & J & L & M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~K & L & M));
    assign D6 = reset_n & ((C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & L & M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & ~L & ~M) | (C & D & ~F & G & ~H & J & ~K) | (C & D & ~F & G & ~H & J & L & M) | (C & D & ~F & G & ~H & I & ~K) | (C & D & ~F & G & ~H & I & L & M) | (B & ~C & ~D & ~E & F & ~H & ~I & ~J & ~K & L & M) | (B & ~C & ~D & ~E & F & ~H & ~I & ~J & K & ~L & ~M) | (B & ~C & ~D & ~E & F & G & ~H & ~I & ~J & ~K & L) | (B & ~C & D & G & H & ~I & ~K) | (B & ~C & D & G & H & ~I & L & M) | (B & ~C & D & F & ~H & I & ~K) | (B & ~C & D & F & ~H & I & L & M) | (B & ~C & D & F & H & ~I & ~K) | (B & ~C & D & F & H & ~I & L & M) | (B & ~C & D & G & ~H & J & ~K) | (B & ~C & D & G & ~H & I & ~K) | (B & ~C & D & F & ~H & J & ~K) | (B & ~C & D & G & ~H & J & L & M) | (B & ~C & D & G & ~H & I & L & M) | (B & ~C & D & F & ~H & J & L & M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~K & L & M) | (B & ~C & ~D & ~E & G & ~H & ~I & ~J & K & ~L & ~M));
    assign D7 = reset_n & ((C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~L & ~M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & L & M) | (C & E & ~F & G & ~H & J & ~K) | (C & E & ~F & G & ~H & J & L & M) | (C & E & ~F & G & ~H & I & ~K) | (C & E & ~F & G & ~H & I & L & M) | (C & ~D & E & ~F & G & ~H & I & J & ~L & ~M) | (C & D & ~F & G & ~H & J & ~K) | (C & D & ~F & G & ~H & J & L & M) | (C & D & ~F & G & ~H & I & ~K) | (C & D & ~E & ~F & G & ~H & I & ~J & ~L & ~M) | (C & D & ~F & G & ~H & I & L & M) | (C & D & E & ~F & G & ~H & ~I & J & ~L & ~M) | (B & ~C & E & ~F & G & H & ~I & K & ~L & ~M) | (B & ~C & E & F & ~G & H & ~I & K & ~L & ~M) | (B & ~C & D & ~F & G & H & ~I & K & ~L & ~M) | (B & ~C & D & G & H & ~I & J & K & ~L & ~M) | (B & ~C & E & G & H & ~I & ~J & K & ~L & ~M));
    assign D8 = ~reset_n | ((~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & K & ~L) | (~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & K & ~M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & ~L & M) | (C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & L & ~M) | (C & E & ~F & G & ~H & J & K & ~L & M) | (C & E & ~F & G & ~H & J & K & L & ~M) | (C & E & ~F & G & ~H & I & K & ~L & M) | (C & E & ~F & G & ~H & I & K & L & ~M) | (C & D & ~F & G & ~H & J & K & ~L & M) | (C & D & ~F & G & ~H & J & K & L & ~M) | (B & ~C & ~D & ~E & F & ~H & ~I & ~J) | (B & ~C & E & G & H & ~I & ~K) | (B & ~C & E & G & H & ~I & M) | (B & ~C & E & G & H & ~I & L) | (B & ~C & E & F & ~H & J) | (B & ~C & E & F & ~H & I) | (B & ~C & E & F & H & ~I & ~K) | (B & ~C & E & F & H & ~I & M) | (B & ~C & E & F & H & ~I & L) | (B & ~C & ~D & E & F & G & ~I & J) | (B & ~C & D & G & ~H & I) | (B & ~C & D & G & H & ~I & ~K) | (B & ~C & D & G & H & ~I & M) | (B & ~C & D & G & H & ~I & L) | (B & ~C & D & ~E & ~F & G & ~I & J) | (B & ~C & D & F & ~H & I) | (B & ~C & D & ~E & F & H & ~I & ~J) | (B & ~C & D & E & ~F & G & H & ~I & ~J) | (B & ~D & ~E & ~F & G & ~H & ~I & ~J) | (B & ~D & E & ~F & G & ~H & ~I & J) | (B & E & ~F & G & ~H & I & ~J) | (B & D & ~E & ~F & G & ~H & J) | (B & D & ~F & G & ~H & I & ~K) | (B & ~C & E & G & ~H & J) | (B & ~C & D & ~E & F & ~G & ~I & J) | (B & E & ~F & G & ~H & J & ~K) | (B & ~C & D & G & ~H & J) | (B & E & ~F & G & ~H & J & M) | (~B & C & D & ~E & ~F & G & ~H & I & ~J & K & ~L) | (C & D & ~F & G & ~H & I & K & L & ~M) | (B & D & ~F & G & ~H & I & M) | (~B & C & ~D & E & ~F & G & ~H & I & J & K & ~L) | (~B & C & D & E & ~F & G & ~H & ~I & J & K & ~L) | (B & D & ~F & G & ~H & I & J));
    assign D9 = reset_n & ((~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & K & ~L & M) | (~A & C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & L) | (~A & C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & ~L) | (C & E & ~F & G & ~H & J & K & ~L & M) | (C & E & ~F & G & ~H & I & K & ~L & M) | (C & D & ~F & G & ~H & J & K & ~L & M) | (C & D & ~F & G & ~H & I & K & ~L & M) | (~A & B & ~C & ~D & ~E & F & ~H & ~I & ~J & ~K & L) | (~A & B & ~C & ~D & ~E & F & ~H & ~I & ~J & K & ~L) | (~A & B & ~C & E & F & ~H & I & K & ~L) | (~A & B & ~C & D & G & ~H & I & K & ~L) | (~A & B & ~C & D & ~E & ~F & G & H & ~I & ~J & K & ~L) | (~A & B & ~C & D & F & ~H & J & K & ~L) | (~A & B & ~C & D & F & ~H & I & K & ~L) | (B & ~C & D & F & H & ~I & K & ~L & M) | (~A & B & ~C & D & F & G & ~I & J & K & ~L) | (~A & B & ~D & E & ~F & G & ~H & ~I & J & K & ~L) | (~A & B & E & ~F & G & ~H & I & ~J & K & ~L) | (~A & B & D & ~E & ~F & G & ~H & J & K & ~L) | (A & ~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & ~K) | (A & ~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & ~L) | (A & ~B & ~C & ~D & ~E & ~F & ~G & ~H & ~I & ~J & M) | (A & C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & ~L) | (A & C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & M) | (A & C & E & ~F & G & ~H & J & ~K) | (A & ~B & C & E & ~F & G & ~H & J & ~L) | (A & C & E & ~F & G & ~H & J & M) | (A & C & E & ~F & G & ~H & I & ~K) | (A & ~B & C & E & ~F & G & ~H & I & ~L) | (A & C & E & ~F & G & ~H & I & M) | (A & C & D & ~F & G & ~H & J & ~K) | (A & ~B & C & D & ~F & G & ~H & J & ~L) | (A & C & D & ~F & G & ~H & J & M) | (A & C & D & ~F & G & ~H & I & ~K) | (A & C & D & ~F & G & ~H & I & M) | (A & B & ~C & ~D & ~E & F & ~H & ~I & ~J & ~K & ~L) | (A & B & ~C & ~D & ~E & F & ~H & ~I & ~J & K & M) | (A & B & ~C & E & G & H & ~I & ~K) | (A & B & ~C & E & G & H & ~I & M) | (A & B & ~C & E & F & ~H & I & ~K) | (A & B & ~C & E & F & ~H & I & M) | (A & B & ~C & E & F & H & ~I & ~K) | (A & B & ~C & E & F & H & ~I & M) | (A & B & ~C & ~D & E & G & H & ~I & J & ~L) | (A & B & ~C & D & G & H & ~I & ~K) | (A & B & ~C & D & G & H & ~I & M) | (A & B & ~C & D & ~E & ~F & G & H & ~I & J & ~L) | (A & B & ~C & D & F & ~H & I & ~K) | (A & B & ~C & D & F & ~H & I & M) | (A & B & ~C & D & F & H & ~I & ~K) | (A & B & ~C & D & F & H & ~I & M) | (A & B & ~C & D & ~E & F & ~G & H & ~I & ~L) | (A & B & ~C & D & ~E & F & H & ~I & ~J & ~L) | (A & B & ~C & D & E & ~F & G & H & ~I & ~J & ~L) | (A & C & ~D & E & ~F & G & ~H & I & J & ~L) | (A & C & D & ~E & ~F & G & ~H & I & ~J & ~L) | (A & C & D & E & ~F & G & ~H & ~I & J & ~L) | (A & B & ~C & E & G & ~H & J & ~K) | (A & B & ~C & D & G & ~H & J & M) | (A & B & ~C & E & G & ~H & I & M) | (A & B & ~C & E & F & ~H & J & M) | (A & B & ~C & D & G & ~H & I & ~K) | (A & B & ~C & D & F & ~H & J & ~K) | (~A & B & ~C & E & ~F & G & ~I & J & K & ~L) | (~A & B & ~C & E & F & ~G & H & ~I & K & ~L) | (~A & B & ~C & E & G & ~H & J & K & ~L) | (~A & B & ~C & ~D & E & G & H & ~I & ~J & K & ~L) | (~A & B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~K & L) | (~A & B & ~C & ~D & ~E & G & ~H & ~I & ~J & K & ~L) | (B & ~C & E & G & ~I & J & K & ~L & M) | (~A & B & ~C & E & F & ~G & ~I & J & K & ~L) | (B & ~C & D & G & H & ~I & K & ~L & M) | (A & B & ~C & ~D & ~E & G & ~H & ~I & ~J & ~K & ~L) | (A & B & ~C & ~D & ~E & G & ~H & ~I & ~J & K & M) | (A & B & ~C & E & G & ~H & I & ~K) | (A & B & ~C & E & F & ~H & J & ~K) | (A & B & ~C & D & G & ~H & J & ~K) | (A & B & ~C & D & G & ~H & I & M) | (A & B & ~C & D & F & ~H & J & M) | (~A & B & ~C & E & F & H & ~I & ~J & K & ~L) | (~A & B & D & ~F & G & ~H & I & J & K & ~L) | (A & B & ~C & E & G & ~H & J & M));

    edge_trigger_D_FF d0(
        .reset_n(1'b1),
        .d(D0),
        .clk(clk),
        .q(output_state[0]),
        .q_()
    );
    edge_trigger_D_FF d1(
        .reset_n(1'b1),
        .d(D1),
        .clk(clk),
        .q(output_state[1]),
        .q_()
    );
    edge_trigger_D_FF d2(
        .reset_n(1'b1),
        .d(D2),
        .clk(clk),
        .q(output_state[2]),
        .q_()
    );
    edge_trigger_D_FF d3(
        .reset_n(1'b1),
        .d(D3),
        .clk(clk),
        .q(output_state[3]),
        .q_()
    );
    edge_trigger_D_FF d4(   
        .reset_n(1'b1),
        .d(D4),
        .clk(clk),
        .q(output_state[4]),
        .q_()
    );
    edge_trigger_D_FF d5(
        .reset_n(1'b1),
        .d(D5),
        .clk(clk),
        .q(output_state[5]),
        .q_()
    );
    edge_trigger_D_FF d6(
        .reset_n(1'b1),
        .d(D6),
        .clk(clk),
        .q(output_state[6]),
        .q_()
    );
    edge_trigger_D_FF d7(
        .reset_n(1'b1),
        .d(D7),
        .clk(clk),
        .q(output_state[7]),
        .q_()
    );
    edge_trigger_D_FF d8(
        .reset_n(1'b1),
        .d(D8),
        .clk(clk),
        .q(output_state[8]),
        .q_()
    );
    edge_trigger_D_FF d9(
        .reset_n(1'b1),
        .d(D9),
        .clk(clk),
        .q(output_state[9]),
        .q_()
    );

endmodule