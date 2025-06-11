
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

    assign led_out[16] = (~A & B & ~C & E & F & ~H & I & J & ~K & L & M) | (~A & B & ~C & D & F & ~H & I & J & ~K & L & M) | (~A & B & C & E & ~F & G & ~H & ~I & J & K & ~L & ~M) | (~A & B & E & ~F & G & ~H & I & J & ~K & L & M) | (~A & B & C & D & ~F & G & ~H & ~I & J & K & ~L & ~M) | (~A & B & D & ~F & G & ~H & I & J & ~K & L & M) | (A & B & ~C & E & G & ~H & ~I & J & K & ~L & ~M) | (A & B & ~C & E & F & ~H & ~I & J & K & ~L & ~M) | (A & B & ~C & D & G & ~H & ~I & J & K & ~L & ~M) | (A & B & ~C & D & F & ~H & ~I & J & K & ~L & ~M);
    assign led_out[15] = (~A & ~B & C & E & ~F & G & ~H & I & J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & I & J & K & L & M) | (~A & B & ~C & E & G & H & ~I & J & K & ~L & M) | (~A & B & ~C & E & F & H & ~I & J & K & ~L & M) | (~A & B & ~C & D & G & H & ~I & J & K & ~L & M) | (~A & B & ~C & D & F & H & ~I & J & K & ~L & M) | (A & ~B & C & E & ~F & G & ~H & ~I & J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & ~I & J & ~K & ~L & ~M) | (A & B & ~C & E & G & H & ~I & ~J & ~K & L & ~M) | (A & B & ~C & D & G & H & ~I & ~J & ~K & L & ~M) | (A & B & ~C & D & F & H & ~I & ~J & ~K & L & ~M);
    assign led_out[14] = (~A & ~B & C & E & ~F & G & ~H & I & ~J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & I & ~J & K & L & M) | (~A & B & ~C & E & F & ~H & I & ~J & ~K & L & M) | (~A & B & ~C & D & F & ~H & I & ~J & ~K & L & M) | (~A & B & E & ~F & G & ~H & I & ~J & ~K & L & M) | (~A & B & C & E & ~F & G & ~H & I & ~J & K & ~L & ~M) | (~A & B & D & ~F & G & ~H & I & ~J & ~K & L & M) | (~A & B & C & D & ~F & G & ~H & I & ~J & K & ~L & ~M) | (A & ~B & C & E & ~F & G & ~H & I & ~J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & I & ~J & ~K & ~L & ~M) | (A & B & ~C & E & G & ~H & I & ~J & K & ~L & ~M) | (A & B & ~C & E & F & ~H & I & ~J & K & ~L & ~M) | (A & B & ~C & D & G & ~H & I & ~J & K & ~L & ~M) | (A & B & ~C & D & F & ~H & I & ~J & K & ~L & ~M);
    assign led_out[13] = (~A & ~B & C & E & ~F & G & ~H & ~I & J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & ~I & J & K & L & M) | (~A & B & ~C & E & G & H & ~I & ~J & K & ~L & M) | (~A & B & ~C & E & F & H & ~I & ~J & K & ~L & M) | (~A & B & ~C & D & G & H & ~I & ~J & K & ~L & M) | (~A & B & ~C & D & F & H & ~I & ~J & K & ~L & M) | (A & ~B & C & E & ~F & G & ~H & I & J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & I & J & ~K & ~L & ~M) | (A & B & ~C & E & G & H & ~I & J & ~K & L & ~M) | (A & B & ~C & D & G & H & ~I & J & ~K & L & ~M) | (A & B & ~C & D & F & H & ~I & J & ~K & L & ~M);
    assign led_out[12] = (~A & B & ~C & E & F & ~H & ~I & J & ~K & L & M) | (~A & B & ~C & D & F & ~H & ~I & J & ~K & L & M) | (~A & B & E & ~F & G & ~H & ~I & J & ~K & L & M) | (~A & B & C & E & ~F & G & ~H & I & J & K & ~L & ~M) | (~A & B & D & ~F & G & ~H & ~I & J & ~K & L & M) | (~A & B & C & D & ~F & G & ~H & I & J & K & ~L & ~M) | (A & B & ~C & E & G & ~H & I & J & K & ~L & ~M) | (A & B & ~C & E & F & ~H & I & J & K & ~L & ~M) | (A & B & ~C & D & G & ~H & I & J & K & ~L & ~M) | (A & B & ~C & D & F & ~H & I & J & K & ~L & ~M);
    assign led_out[11] = (~A & B & ~C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & ~L & ~M) | (~A & B & C & E & ~F & G & ~H & ~I & J & K & ~L & ~M) | (~A & B & C & D & ~F & G & ~H & ~I & J & K & ~L & ~M) | (A & B & ~C & E & ~F & G & ~H & I & K & ~L & ~M) | (A & B & ~C & E & ~F & G & H & ~I & K & ~L & ~M) | (A & B & ~C & E & F & ~H & ~I & J & K & ~L & ~M) | (A & B & ~C & D & ~F & G & ~H & I & K & ~L & ~M) | (A & B & ~C & D & ~F & G & H & ~I & K & ~L & ~M) | (A & B & ~C & D & F & ~H & ~I & J & K & ~L & ~M) | (A & B & ~C & E & ~F & G & ~H & J & K & ~L & ~M) | (A & B & ~C & D & ~F & G & ~H & J & K & ~L & ~M);
    assign led_out[10] = (~A & ~B & C & E & ~F & G & ~H & I & J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & I & J & K & L & M) | (A & ~B & C & E & ~F & G & ~H & ~I & J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & ~I & J & ~K & ~L & ~M) | (A & B & ~C & E & G & H & ~I & ~J & ~K & L & ~M) | (A & B & ~C & D & G & H & ~I & ~J & ~K & L & ~M) | (A & B & ~C & D & F & H & ~I & ~J & ~K & L & ~M);
    assign led_out[9] = (~A & ~B & C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & ~L & M) | (~A & C & E & ~F & G & ~H & I & ~J & K & L & M) | (~A & C & D & ~F & G & ~H & I & ~J & K & L & M) | (~A & B & ~C & ~D & ~E & F & ~G & ~H & ~I & ~J & K & ~L & ~M) | (~A & B & C & E & ~F & G & ~H & J & K & L & M) | (~A & B & C & E & ~F & G & ~H & I & ~J & K & ~L & ~M) | (~A & B & C & D & ~F & G & ~H & J & K & L & M) | (~A & B & C & D & ~F & G & ~H & I & ~J & K & ~L & ~M) | (A & ~B & C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & L & M) | (A & ~B & C & E & ~F & G & ~H & J & ~K & ~L & M) | (A & ~B & C & E & ~F & G & ~H & I & ~K & ~L & M) | (A & ~B & C & D & ~F & G & ~H & J & ~K & ~L & M) | (A & ~B & C & D & ~F & G & ~H & I & ~K & ~L & M) | (A & B & ~C & E & G & ~H & I & ~J & K & ~L & ~M) | (A & B & ~C & E & F & ~G & H & ~I & K & ~L & ~M) | (A & B & ~C & D & G & ~H & I & ~J & K & ~L & ~M) | (A & B & ~C & D & F & ~G & H & ~I & K & ~L & ~M) | (A & B & ~C & E & F & ~G & ~H & J & K & ~L & ~M) | (A & B & ~C & D & F & ~G & ~H & I & K & ~L & ~M) | (A & B & ~C & E & F & ~G & ~H & I & K & ~L & ~M) | (A & B & ~C & D & F & ~G & ~H & J & K & ~L & ~M);
    assign led_out[8] = (~A & ~B & C & E & ~F & G & ~H & ~I & J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & ~I & J & K & L & M) | (A & ~B & C & E & ~F & G & ~H & I & J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & I & J & ~K & ~L & ~M) | (A & B & ~C & E & G & H & ~I & J & ~K & L & ~M) | (A & B & ~C & D & G & H & ~I & J & ~K & L & ~M) | (A & B & ~C & D & F & H & ~I & J & ~K & L & ~M);
    assign led_out[7] = (~A & B & ~C & ~D & ~E & F & G & ~H & ~I & ~J & K & ~L & ~M) | (~A & B & C & E & ~F & G & ~H & I & J & K & ~L & ~M) | (~A & B & C & D & ~F & G & ~H & I & J & K & ~L & ~M) | (A & B & ~C & E & G & ~H & I & J & K & ~L & ~M) | (A & B & ~C & E & F & ~H & I & J & K & ~L & ~M) | (A & B & ~C & E & F & G & ~H & I & K & ~L & ~M) | (A & B & ~C & E & F & G & H & ~I & K & ~L & ~M) | (A & B & ~C & D & G & ~H & I & J & K & ~L & ~M) | (A & B & ~C & D & F & ~H & I & J & K & ~L & ~M) | (A & B & ~C & D & F & G & ~H & I & K & ~L & ~M) | (A & B & ~C & D & F & G & H & ~I & K & ~L & ~M) | (A & B & ~C & E & F & G & ~H & J & K & ~L & ~M) | (A & B & ~C & D & F & G & ~H & J & K & ~L & ~M);

    assign led_out[6] = ~state[9];
    assign led_out[5] = state[9];

    assign led_out[4] = (~A & B & ~C & E & ~F & G & ~H & I & ~K & L & M) | (~A & B & ~C & E & ~F & G & H & ~I & ~K & L & M) | (~A & B & ~C & E & F & ~H & ~I & J & ~K & L & M) | (~A & B & ~C & D & ~F & G & ~H & I & ~K & L & M) | (~A & B & ~C & D & ~F & G & H & ~I & ~K & L & M) | (~A & B & ~C & D & F & ~H & ~I & J & ~K & L & M) | (~A & B & E & ~F & G & ~H & ~I & J & ~K & L & M) | (~A & B & D & ~F & G & ~H & ~I & J & ~K & L & M) | (A & B & ~C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & L & M);
    assign led_out[3] = (~A & ~B & C & E & ~F & G & ~H & ~I & J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & ~I & J & K & L & M) | (~A & B & ~C & E & G & H & ~I & ~J & K & ~L & M) | (~A & B & ~C & E & F & H & ~I & ~J & K & ~L & M) | (~A & B & ~C & D & G & H & ~I & ~J & K & ~L & M) | (~A & B & ~C & D & F & H & ~I & ~J & K & ~L & M) | (A & ~B & C & E & ~F & G & ~H & I & J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & I & J & ~K & ~L & ~M);
    assign led_out[2] = (~A & ~B & C & E & ~F & G & ~H & J & K & L & ~M) | (~A & ~B & C & E & ~F & G & ~H & I & K & L & ~M) | (~A & ~B & C & D & ~F & G & ~H & J & K & L & ~M) | (~A & ~B & C & D & ~F & G & ~H & I & K & L & ~M) | (~A & B & ~C & E & F & ~G & H & ~I & ~K & L & M) | (~A & B & ~C & D & F & ~G & H & ~I & ~K & L & M) | (~A & B & C & E & ~F & G & ~H & J & ~K & ~L & ~M) | (~A & B & C & E & ~F & G & ~H & I & ~K & ~L & ~M) | (~A & B & E & ~F & G & ~H & I & ~J & ~K & L & M) | (~A & B & C & D & ~F & G & ~H & J & ~K & ~L & ~M) | (~A & B & C & D & ~F & G & ~H & I & ~K & ~L & ~M) | (~A & B & D & ~F & G & ~H & I & ~J & ~K & L & M) | (A & ~B & C & ~D & ~E & ~F & G & ~H & ~I & ~J & ~K & ~L & ~M) | (A & ~B & C & ~D & ~E & ~F & G & ~H & ~I & ~J & K & L & ~M) | (A & ~B & C & E & ~F & G & ~H & I & ~J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & I & ~J & ~K & ~L & ~M) | (A & B & ~C & ~D & ~E & F & ~G & ~H & ~I & ~J & ~K & L & M) | (~A & B & ~C & E & F & ~G & ~H & J & ~K & L & M) | (~A & B & ~C & E & F & ~H & I & ~J & ~K & L & M) | (~A & B & ~C & D & F & ~G & ~H & J & ~K & L & M) | (~A & B & ~C & D & F & ~H & I & ~J & ~K & L & M);
    assign led_out[1] = (~A & ~B & C & E & ~F & G & ~H & I & J & K & L & M) | (~A & ~B & C & D & ~F & G & ~H & I & J & K & L & M) | (~A & B & ~C & E & G & H & ~I & J & K & ~L & M) | (~A & B & ~C & E & F & H & ~I & J & K & ~L & M) | (~A & B & ~C & D & G & H & ~I & J & K & ~L & M) | (~A & B & ~C & D & F & H & ~I & J & K & ~L & M) | (A & ~B & C & E & ~F & G & ~H & ~I & J & ~K & ~L & ~M) | (A & ~B & C & D & ~F & G & ~H & ~I & J & ~K & ~L & ~M);
    assign led_out[0] = (~A & B & ~C & E & F & ~H & I & J & ~K & L & M) | (~A & B & ~C & E & F & G & ~H & I & ~K & L & M) | (~A & B & ~C & E & F & G & H & ~I & ~K & L & M) | (~A & B & ~C & D & F & ~H & I & J & ~K & L & M) | (~A & B & ~C & D & F & G & ~H & I & ~K & L & M) | (~A & B & ~C & D & F & G & H & ~I & ~K & L & M) | (~A & B & E & ~F & G & ~H & I & J & ~K & L & M) | (~A & B & D & ~F & G & ~H & I & J & ~K & L & M) | (A & B & ~C & ~D & ~E & F & G & ~H & ~I & ~J & ~K & L & M) | (~A & B & ~C & E & F & G & ~H & J & ~K & L & M) | (~A & B & ~C & D & F & G & ~H & J & ~K & L & M);

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
    assign led [8]= cot[2]&(~cot[1])&cot[0];
    assign led [7]= (~cot[2])&cot[1]&cot[0];
    assign led [6]= 0;
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
    // assign led_out = ~default_led_out;
    
endmodule
