
`timescale 1ms / 1us

module master(
    input reset_button, blue_reset_button, red_reset_button,
    input clk, up, down, left, right, decision,
    output output_turn,
    output [2:0] led_select,
    output [16:0] led_output,
    output [7:0] ssDisp,
    output [3:0] ssSel
);

    wire [4:0] input_wires_tmp;
    wire [4:0] input_wires;

    delay_module up_delay(
        .reset_n(reset_button),
        .input_wire(up),
        .clk(clk),
        .output_wire(input_wires_tmp[0])
    );

    button_end down_delay(
        .reset_n(reset_button),
        .input_wire(input_wires_tmp[0]),
        .clk(clk),
        .output_wire(input_wires[0])
    );

    assign ssDisp[0] = input_wires[0];

endmodule

