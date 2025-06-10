`timescale 1ms / 1us

module master(
    input clk,
    input up,
    input down,
    input left,
    input right,
    input decision,
    input reset_button,
    input blue_reset_button,
    input red_reset_button,
    output [2:0] led_select,
    output [16:0] led_out,
    output [7:0] ssDisp,
    output [3:0] ssSel,
    output output_turn
);

    // reg clk_led;
    // reg clk_state;

    // LED counter clk
    // always #20 clk_led = ~clk_led;
    // 0.5 seconds for state transition
    // always #500 clk_state = ~clk_state;

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

    reg clk_50Hz;
    reg [23:0] count2 = 0;
    always @(posedge clk) begin
        if (count2 == 2_000_000 - 1) begin
            count2 <= 0;
            clk_50Hz <= ~clk_50Hz;
        end else begin
            count2 <= count2 + 1;
        end
    end

    wire [6:0] but;
    wire [2:0] dir;
    wire [2:0] dir_out;
    wire [9:0] state;
    wire [2:0] led_s;
    wire [3:0] ss_sel_tmp;

    wire [6:0] bttns;

    assign reset_n = ~reset_button;
    delay_module dm6(reset_n, blue_reset_button, clk_4Hz, bttns[6]);
    delay_module dm7(reset_n, red_reset_button, clk_4Hz, bttns[5]);
    delay_module dm8(reset_n, decision, clk_4Hz, bttns[4]);
    delay_module dm9(reset_n, up, clk_4Hz, bttns[3]);
    delay_module dm10(reset_n, down, clk_4Hz, bttns[2]);
    delay_module dm11(reset_n, left, clk_4Hz, bttns[1]);
    delay_module dm12(reset_n, right, clk_4Hz, bttns[0]);

    encoder8to3 en(bttns, dir);
    // delay_module dm(reset_n, dir, clk_4Hz, dir_out);
    state_transition st1(reset_n, dir, clk, state);
    led_counter led_c(reset_n, clk_50Hz, led_s);
    led_output led_op(state, led_s, led_out);
    decade_counter dc1(reset_n, clk_4Hz, ss_sel_tmp);
    // bcd_to_7seg b71(ss_sel_tmp, ssDisp[6:0]);
    assign ssDisp[7:0] = 7'b10000000;   
    assign led_select = led_s;
    assign ssSel = 4'b0001;
    assign output_turn = ~state[9];


endmodule