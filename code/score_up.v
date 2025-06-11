   
   
`timescale 1ms / 1us

module score_up(
    input [2:0] input_wire,
    input [9:0] state,
    output [1:0] score
);
    wire K, L, M;
    assign {K, L, M} = input_wire; // K=1 for red, L=1 for blue, M=1 for green
    wire D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    assign { D0, D1, D2, D3, D4, D5, D6, D7, D8, D9}=state;
    wire scb, scr;
    assign scr = (K&~L&~M)&(~(D0|D1|D2|D3|D4|D5|D6|D8|D9));
    assign scb = (K&~L&~M)&(~((~D0)|D1|D2|D3|D4|D5|D6|D8|D9));

    
    assign score= {scr,scb};    //10-> r , 01->b;

endmodule

