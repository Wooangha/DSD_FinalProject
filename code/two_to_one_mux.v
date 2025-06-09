
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

