
`timescale 1s / 1ms

module encoder8to3 (
    input  [6:0] in,
    output [2:0] out,
);
    // Priority encoder logic
    // in = {reset_blue, reset_red, decision, up, down, left, right}
    // out = encoded output
    wire A, B, C, D, E, F, G;
    assign {A, B, C, D, E, F, G} = in;

    assign out[0] = (~A & ~C & ~D & ~F) | (~A & ~C & ~D & E) | (~A & B);
    assign out[1] = (~B & ~C & ~D & ~E) | (A);
    assign out[2] = (~D & ~E & ~F & ~G) | (C) | (B) | (A);

endmodule
