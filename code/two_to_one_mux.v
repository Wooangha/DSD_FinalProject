
`timescale 1ms / 1us

module two_to_one_mux(
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);
    // MUX logic: if sel is 0, output a; if sel is 1, output b
    assign out = (a & ~sel) | (b & sel);

endmodule

module four_to_one_mux(
    input wire [3:0] a,
    input wire [1:0] sel,
    output wire out
);
    assign out = (~sel[1] & ~sel[0] & a[0]) |
                  (~sel[1] & sel[0] & a[1]) |
                  (sel[1] & ~sel[0] & a[2]) |
                  (sel[1] & sel[0] & a[3]);

endmodule
