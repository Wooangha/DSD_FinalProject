
`timescale 1ms / 1us

module bcd_to_7seg(
    input [3:0] bcd_in,
    output [6:0] seg7_out
);
    wire w, x, y, z;
    assign w = bcd_in[3];
    assign x = bcd_in[2];
    assign y = bcd_in[1];
    assign z = bcd_in[0];

    assign seg7_out[0] = ~((~x & ~z) | (w & ~z) | (x & y) | (~w & y) | (~w & x & z) | (w & ~x & ~y)); // a
    assign seg7_out[1] = ~((~x & ~z) | (~w & ~x) | (w & ~y & z) | (~w & ~y & ~z) | (~w & y & z)); // b
    assign seg7_out[2] = ~((~w & x) | (w & ~x) | (~y & z) | (~x & ~y) | (~x & z)); // c
    assign seg7_out[3] = ~((w & ~y) | (~w & ~x & ~z) | (~x & y & z) | (x & ~y & z) | (x & y & ~z)); // d
    assign seg7_out[4] = ~((~x & ~z) | (w & x) | (y & ~z) | (w & y)); // e
    assign seg7_out[5] = ~((~y & ~z) | (w & ~x) | (x & ~z) | (w & y) | (~w & x & ~y)); // f
    assign seg7_out[6] = ~((w & ~x) | (y & ~z) | (w & z) | (~x & y) | (~w & x & ~y)); // g

endmodule