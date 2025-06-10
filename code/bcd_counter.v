
`timescale 1ms / 1us

module decade_counter(input reset_n, input clk, output [3:0] count);

    wire [3:0] j, k;
    wire [3:0] q;
    assign j[3] = q[2] & q[1] & q[0];
    assign k[3] = q[0];
    assign j[2] = q[1] & q[0];
    assign k[2] = q[1] & q[0];
    assign j[1] = ~q[3] & q[0];
    assign k[1] = q[0];
    assign j[0] = 1;
    assign k[0] = 1;

    wire [3:0] q_;

    msJKFF ff0(reset_n, j[0], k[0], clk, q[0], q_[0]);
    msJKFF ff1(reset_n, j[1], k[1], clk, q[1], q_[1]);
    msJKFF ff2(reset_n, j[2], k[2], clk, q[2], q_[2]);
    msJKFF ff3(reset_n, j[3], k[3], clk, q[3], q_[3]);
    assign count = q;

endmodule

module decade_counter_2digits(input reset_n, input clk, output [7:0] count);

    wire [3:0] count1, count2;
    decade_counter unit_counter(reset_n, clk, count1);

    wire tens_clk;
    assign tens_clk = (~reset_n & clk) | (reset_n & count1[3] & ~count1[2] & ~count1[1] & count1[0]);
    decade_counter tens_counter(reset_n, tens_clk, count2);
    assign count = {count2, count1};

endmodule