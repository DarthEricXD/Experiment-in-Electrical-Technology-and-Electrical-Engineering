module rom(
    clk, ce, thresh0, q, w
);
    input clk;
    input ce;
    output thresh0;
    output [2:0] q;
    output [3:0] w;

    aa aa_inst (
        .clk(clk),
        .ce(ce),
        .thresh0(thresh0),
        .q(q)
    );

    bb bb_inst (
        .clka(clk),
        .addra(q),
        .douta(w)
    );
endmodule
