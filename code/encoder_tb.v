
`timescale 1ns / 1ps

module encoder_tb ();

    reg clk = 0;
    
    always #5 clk = ~clk;
    
    wire [2:0] output_wire;
    reg [6:0] input_wire;
    
    encoder8to3 e(input_wire, output_wire);
    
    initial begin
    
        #10
        input_wire <= 7'b0000000; // Test case with no active inputs
        #10
        input_wire <= 7'b0000001; // Test case with only the last input active
        #10
        input_wire <= 7'b0000010; // Test case with the second last input active
        #10
        input_wire <= 7'b0000100; // Test case with the third last input active
        #10
        input_wire <= 7'b0001000; // Test case with the fourth last input active
        #10
        input_wire <= 7'b0010000; // Test case with the fifth last input active
        #10
        input_wire <= 7'b0100000; // Test case with the sixth last input active
        #10
        input_wire <= 7'b1000000; // Test case with the first input active

        #10
        $finish;
        
    end

endmodule
