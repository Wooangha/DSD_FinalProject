
`timescale 1ns/1ps
module additional_clk_tb;

    reg clk = 0;

    always #1 clk = ~clk; // Generate a clock signal with a period of 10 time units

    reg reset_n = 1;
    wire [16:0] counter_10_;
    wire [24:0] counter_25_;

    counter_25 c25(
        .reset_n(reset_n),
        .clk(clk),
        .count_out(counter_25_)
    );
    counter_10 c10(
        .reset_n(reset_n),
        .clk(clk),
        .count_out(counter_10_)
    );

    initial begin
        // Monitor the clock outputs
        #10
        clk = 0; // Initialize clock
        reset_n = 0;
        // counter_10_ <= 17'b11000011010010000; // Initialize counter_10_
        // counter_25_ = 25'b0000000000000000000000000; // Initialize counter_25_
        #10 // Wait for reset to take effect
        reset_n = 1; // Release reset
        
        // Wait for some time to observe the clock signals
        # 200000000; // Run the simulation for 1000 time units
        $finish; // End the simulation
    end
endmodule
