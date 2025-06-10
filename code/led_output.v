
`timescale 1ms / 1us

module led_additional (
    input [9:0] state,
    input [2:0] led_sel,
    output [16:0] led_out
);
    // led_out = 
    // {2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 
    // 16, 21,
    // 23, 24, 25, 26, 27};
    wire A, B, C, D, E, F, G, H, I, J, K, L, M;
    assign {A, B, C, D, E, F, G, H, I, J, K, L, M} = {state, led_sel};

    assign led_out[16] = (~H & ~I & J & K & ~L) | (~A & I & J & ~K & M);
    assign led_out[15] = (~A & ~C & J & ~L) | (~C & ~J & ~K & ~M) | (~B & ~I & J & ~K & ~M) | (~A & ~B & I & J & M);
    assign led_out[14] = (~C & I & ~J) | (~A & ~H & ~J & ~K & L) | (~A & ~B & ~J & L & M) | (~B & I & ~J & ~K & ~M) | (I & ~J & K & ~L);
    assign led_out[13] = (~C & ~J & ~L & M) | (~C & J & ~K & ~M) | (~A & ~B & ~I & L & M) | (~B & I & J & ~K & ~M);
    assign led_out[12] = (~A & ~H & ~I & ~K & L) | (I & J & K & ~L);
    assign led_out[11] = (~C & ~F & ~L & ~M) | (~H & ~I & J & K & ~L);
    assign led_out[10] = (~C & ~J & ~K & ~M) | (~B & ~I & J & ~K & ~M) | (~A & ~B & I & J & M);
    assign led_out[9] = (~G & ~L & ~M) | (B & I & ~J & K) | (~B & ~K & M) | (B & ~H & K & M) | (~B & ~J & M);
    assign led_out[8] = (~C & J & ~K & ~M) | (~A & ~B & ~I & L & M) | (~B & I & J & ~K & ~M);
    assign led_out[7] = (F & G & ~L & ~M) | (I & J & K & ~L);

    assign led_out[6] = ~state[9];
    assign led_out[5] = state[9];

    assign led_out[4] = (~C & ~F & ~K & M) | (~A & ~H & ~I & ~K & L);
    assign led_out[3] = (~C & ~J & ~L & M) | (~A & ~B & ~I & L & M) | (~B & I & J & ~K & ~M);
    assign led_out[2] = (~G & ~K & M) | (~A & I & ~J & ~K) | (~B & L & ~M) | (~A & ~K & ~M) | (~B & ~J & ~M);
    assign led_out[1] = (~A & ~C & J & ~L) | (~B & ~I & J & ~K & ~M) | (~A & ~B & I & J & M);
    assign led_out[0] = (F & G & ~K & M) | (~A & I & J & ~K & M);

endmodule

module basicled (

    input [2:0] cot,
    output [16:0] led

);

    assign led[16]=0;
    assign led[15]=0;
    assign led[14]=0;
    assign led[13]=0;
    assign led[12]=0;

    assign led [11]= (~cot[2])&cot[1]&cot[0];
    assign led [10]= cot[2]&(~cot[1])&cot[0];
    assign led [9]= (~cot[2])&(~cot[1])&(~cot[0])|(~cot[2])&cot[1]&cot[0]|cot[2]&cot[1]&(~cot[0]);
    assign led [8]= 0;
    assign led [7]= (~cot[2])&cot[1]&cot[0];
    assign led [6]= cot[2]&(~cot[1])&cot[0];
    assign led [5]= 0;
    assign led [4]= cot[2]&(~cot[1])&(~cot[0]);
    assign led [3]= (~cot[2])&cot[1]&(~cot[0]);
    assign led [2]= (~cot[2])&(~cot[1])&cot[0]|cot[2]&(~cot[1])&(~cot[0])|cot[2]&cot[1]&cot[0];
    assign led [1]= (~cot[2])&cot[1]&(~cot[0]);
    assign led [0]= cot[2]&(~cot[1])&(~cot[0]);

endmodule

module led_output (
    input [9:0] state,
    input [2:0] led_sel,
    output [16:0] led_out
);
    wire [16:0] additional_led_out;
    wire [16:0] default_led_out;

    led_additional additional (
        .state(state),
        .led_sel(led_sel),
        .led_out(additional_led_out)
    );

    basicled default_ (
        .cot(led_sel),
        .led(default_led_out)
    );
    assign led_out = ~(additional_led_out | default_led_out);
    
endmodule
