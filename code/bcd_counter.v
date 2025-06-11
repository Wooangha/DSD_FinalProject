
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

    edge_trigger_JKFF ff0(reset_n, j[0], k[0], clk, q[0], q_[0]);
    edge_trigger_JKFF ff1(reset_n, j[1], k[1], clk, q[1], q_[1]);
    edge_trigger_JKFF ff2(reset_n, j[2], k[2], clk, q[2], q_[2]);
    edge_trigger_JKFF ff3(reset_n, j[3], k[3], clk, q[3], q_[3]);
    assign count = q;

endmodule

module decade_counter_2digits(
    input reset_n, 
    input red_reset_button, 
    input blue_reset_button, 
    input clk, 
    output [7:0] count
);
    wire [3:0] count1, count2;
    wire reset = reset_n & ~(red_reset_button | blue_reset_button);

    decade_counter unit_counter(reset, clk, count1);


    wire tens_clk;
    assign tens_clk = (~reset & clk) | (reset & count1[3] & ~count1[2] & ~count1[1] & count1[0]);
    decade_counter tens_counter(reset, tens_clk, count2);
    assign count = {count2, count1};

endmodule