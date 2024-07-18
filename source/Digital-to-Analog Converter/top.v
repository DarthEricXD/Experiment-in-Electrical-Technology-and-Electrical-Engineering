module top (
    input clk,
    input rst,
    input [1:0] k,
    output [3:0] out
);

    wire [4:0] q;
    DA DA(.clk(clk), .rst(rst), .k(k), .out(q));
    rom rom(.clk(clk), .addra(q), .douta(out));
endmodule
