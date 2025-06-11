

module two_to_four_decoder(
    input wire [1:0] in,
    output wire [3:0] out
);
    assign out[0] = ~(~in[1] & ~in[0]); // 00 -> 1110
    assign out[1] = ~(~in[1] & in[0]);  // 01 -> 1101
    assign out[2] = ~(in[1] & ~in[0]);   // 10 -> 1011
    assign out[3] = ~(in[1] & in[0]);    // 11 -> 0111
endmodule