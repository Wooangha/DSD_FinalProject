
`timescale 1s / 1ms

module decade_counter(input reset_n, input clk, output [3:0] count);

    wire [3:0] j, k;
    assign j[3] = count[2] & count[1] & count[0];
    assign k[3] = count[0];
    assign j[2] = count[1] & count[0];
    assign k[2] = count[1] & count[0];
    assign j[1] = ~count[3] & count[0];
    assign k[1] = count[0];
    assign j[0] = 1;
    assign k[0] = 1;

    wire [3:0] q_;

    msJKFF ff0(reset_n, j[0], k[0], clk, count[0], q_[0]);
    msJKFF ff1(reset_n, j[1], k[1], clk, count[1], q_[1]);
    msJKFF ff2(reset_n, j[2], k[2], clk, count[2], q_[2]);
    msJKFF ff3(reset_n, j[3], k[3], clk, count[3], q_[3]);

endmodule

module decade_counter_2digits(input reset_n, input clk, output [7:0] count);

    wire [3:0] count1, count2;
    decade_counter unit_counter(reset_n, clk, count1);

    wire tens_clk;
    assign tens_clk = (~reset_n & clk) | (reset_n & count1[3] & ~count1[2] & ~count1[1] & count1[0]);
    decade_counter tens_counter(reset_n, tens_clk, count2);
    assign count = {count2, count1};

endmodule