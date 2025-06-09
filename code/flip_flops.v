
`timescale 1ms / 1us

module srLatch(
    input s, r,
    output q, q_
    );

    wire out_q, out_q_;
    nor(out_q, r, q_);
    nor(out_q_, s, out_q);
    
    assign q = out_q;
    assign q_ = out_q_;

endmodule

module msJKFF(
    input reset_n, j, k, clk,
    output q, q_
    );

    wire m_r_input, m_s_input, m_q_output, m_q__output;
    wire s_r_input, s_s_input, s_q_output, s_q__output;
    
    assign m_r_input = (k & clk & q) | ~reset_n;
    assign m_s_input = (j & clk & q_) & reset_n;
    
    srLatch masterLatch(m_s_input, m_r_input, m_q_output, m_q__output);
    
    assign s_r_input = (m_q__output & ~clk) | ~reset_n;
    assign s_s_input = (m_q_output & ~clk) & reset_n;
    
    srLatch slaveLatch(s_s_input, s_r_input, s_q_output, s_q__output);
    
    assign q = s_q_output;
    assign q_ = s_q__output;
    
endmodule

// /* Negative edge triggered JK flip-flop */
// module edge_trigger_JKFF(input reset_n, input j, input k, input clk, output reg q, output reg q_);  
//     initial begin
//       q = 0;
//       q_ = ~q;
//     end
    
//     always @(negedge clk) begin
//         q = reset_n & (j&~q | ~k&q);
//         q_ = ~reset_n | ~q;
//     end

// endmodule

module edge_trigger_D_FF(input reset_n, input d, input clk, output q, output q_);   

    wire j, k;
    assign j = d;  // J input is connected to D input
    assign k = ~d; // K input is connected to inverted D input
    msJKFF jk_ff(reset_n, j, k, clk, q, q_);
 
endmodule

module edge_trigger_T_FF(input reset_n, input t, input clk, output q, output q_);   

    wire j, k;
    assign j = t;  // J input is connected to T input
    assign k = t; // K input is connected to inverted T input
    msJKFF jk_ff(reset_n, j, k, clk, q, q_);

endmodule

