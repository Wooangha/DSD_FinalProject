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

    // reg clk_8Hz;
    // reg [26:0] count = 0;
    // always @(posedge clk) begin
    //     if (count == 25_000_000 - 1) begin
    //         count <= 0;
    //         clk_8Hz <= ~clk_8Hz;
    //     end else begin
    //         count <= count + 1;
    //     end

    // end

    // reg clk_500Hz;
    // reg [23:0] count2 = 0;

    // always @(posedge clk) begin
    //     if (count2 == 100_000 - 1) begin
    //         count2 <= 0;
    //         clk_500Hz <= ~clk_500Hz;
    //     end else begin
    //         count2 <= count2 + 1;
    //     end
    // end



    wire [6:0] but;
    wire [2:0] dir;
    wire [2:0] dir_out;
    wire [9:0] state;
    wire [2:0] led_s;
    wire [3:0] ss_sel_tmp;

    wire [6:0] bttns_debounced;
    wire [6:0] bttns;

    assign reset_n = ~reset_button;
    
    wire clk_8Hz;
    wire clk_500Hz;
    clk_25 clk_gen_8Hz(
        .reset_n(reset_n),
        .clk(clk),
        .clk_out(clk_8Hz)
    );
    clk_10 clk_gen_500Hz(
        .reset_n(reset_n),
        .clk(clk),
        .clk_out(clk_500Hz)
    );

    // delay_module dm1(reset_n, blue_reset_button, clk, bttns[6]);
    // delay_module dm2(reset_n, red_reset_button, clk, bttns[5]);
    // delay_module dm3(reset_n, decision, clk, bttns[4]);
    // delay_module dm4(reset_n, up, clk, bttns[3]);
    // delay_module dm5(reset_n, down, clk, bttns[2]);
    // delay_module dm6(reset_n, left, clk, bttns[1]);
    // delay_module dm7(reset_n, right, clk, bttns[0]);

    // delay_module dm6(reset_n, blue_reset_button, clk_8Hz, bttns_debounced[6]);
    // delay_module dm7(reset_n, red_reset_button, clk_8Hz, bttns_debounced[5]);
    // delay_module dm8(reset_n, decision, clk_8Hz, bttns_debounced[4]);
    // delay_module dm9(reset_n, up, clk_8Hz, bttns_debounced[3]);
    // delay_module dm10(reset_n, down, clk_8Hz, bttns_debounced[2]);
    // delay_module dm11(reset_n, left, clk_8Hz, bttns_debounced[1]);
    // delay_module dm12(reset_n, right, clk_8Hz, bttns_debounced[0]);


    // button_end be1(reset_n, clk_8Hz, bttns_debounced[6], bttns[6]);
    // button_end be2(reset_n, clk_8Hz, bttns_debounced[5], bttns[5]);
    // button_end be3(reset_n, clk_8Hz, bttns_debounced[4], bttns[4]);
    // button_end be4(reset_n, clk_8Hz, bttns_debounced[3], bttns[3]);
    // button_end be5(reset_n, clk_8Hz, bttns_debounced[2], bttns[2]);
    // button_end be6(reset_n, clk_8Hz, bttns_debounced[1], bttns[1]);
    // button_end be7(reset_n, clk_8Hz, bttns_debounced[0], bttns[0]);

    assign bttns = {blue_reset_button, red_reset_button, decision, up, down, left, right};

    encoder7to3 en(bttns, dir);
    // delay_module dm(reset_n, dir, clk_8Hz, dir_out);
    state_transition st1(reset_n, dir, clk_8Hz, state);
    led_counter led_c(reset_n, clk_500Hz, led_s);
    led_output led_op(state, led_s, led_out);
    decade_counter dc1(reset_n, clk_8Hz, ss_sel_tmp);
    bcd_to_7seg b71(ss_sel_tmp, ssDisp[6:0]);
    assign led_select = led_s;
    // assign ssDisp[6:0] = 7'b1111110;
    // ssDisp : 0 - on, 1 - off
    // ssDisp[6] = g
    // ssDisp[5] = f
    // ssDisp[4] = e
    // ssDisp[3] = d
    // ssDisp[2] = c
    // ssDisp[1] = b
    // ssDisp[0] = a
    assign ssSel = 4'b1110;
    // ssSel : 0 - on, 1 - off
    // ssSel[3] = most right digit
    // ssSel[0] = most left digit
    assign output_turn = ~state[9];


endmodule