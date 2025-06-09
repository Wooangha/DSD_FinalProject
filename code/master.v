
`timescale 1ms / 1us

module master();

    reg clk_led;
    reg clk_state;

    // LED counter clk
    always #20 clk_led = ~clk_led;
    // 0.5 seconds for state transition
    always #500 clk_state = ~clk_state;

endmodule

