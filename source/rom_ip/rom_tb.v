module rom_tb;
    reg clk;
    reg ce;
    wire thresh0;
    wire [2:0] q;
    wire [3:0] w;

    rom uut (
        .clk(clk),
        .ce(ce),
        .thresh0(thresh0),
        .q(q),
        .w(w)
    );

    initial begin
        ce = 0;
        clk = 0;
        #200 ce = 1;
    end

    always #100 clk = ~clk;
endmodule
