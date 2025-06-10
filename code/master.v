`timescale 1ms / 1us

module master(
    input clk,
    input up,
    input down,
    input left,
    input right,
    input decision,
    input output_turn,
    input reset_button,
    input reset_blue,
    input reset_red,
    output [2:0] led_select,
    output [16:0] led_out,
    output [7:0] ssDisp,
    output [3:0] ssSel
);

//    reg clk_led;
//    reg clk_state;

    // LED counter clk
//    always #20 clk_led = ~clk_led;
    // 0.5 seconds for state transition
//    always #500 clk_state = ~clk_state;

    reg clk_4Hz;
    reg [23:0] count = 0;
    always @(posedge clk) begin
        if (count == 12_500_000 - 1) begin
            count <= 0;
            clk_4Hz <= ~clk_4Hz;
        end else begin
            count <= count + 1;
        end
    end

    wire [6:0] but;
    wire [2:0] dir;
    wire [2:0] dir_out;
    wire [9:0] state;
    wire [2:0] led_s;
    wire [3:0] ss_sel_tmp;


    assign but={reset_blue, reset_red, decision, up, down, left, right};
    assign reset_n = ~reset_button;

    encoder8to3 en(but, dir);
    delay_module dm(reset_n, dir, clk_4Hz, dir_out);
    state_transition st1(rest_n, dir_out, clk, state);
    led_counter led_c(reset_n, clk, led_s);
    led_output led_op(state, led_s, led_out);
    decade_counter dc1(reset_n, clk, ss_sel_tmp);
    bcd_to_7seg b71(ss_sel_tmp, ssDisp);
    assign led_select = led_s;
    assign ssSel = ss_sel_tmp;


endmodule