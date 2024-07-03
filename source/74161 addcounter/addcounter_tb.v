module addcounter1;
    reg clr;
    reg ld;
    reg p;
    reg t;
    reg clk;
    reg [3:0] D;
    wire [3:0] Q;
    wire co;

    addcounter uut (
        .clr(clr),
        .ld(ld),
        .p(p),
        .t(t),
        .clk(clk),
        .D(D),
        .Q(Q),
        .co(co)
    );

    always #100 clk = ~clk;
    initial begin
        clr = 1;
        p = 1;
        t = 1;
        clk = 1;
        D = 4'b1100;
        ld = 0;
        #100;
        clr = 0;
        #100;
        clr = 1; ld = 1; p = 1; t = 1;
        #3400;
        ld = 1; clr = 1; p = 0; t = 1;
        #100;
        ld = 1; clr = 1; p = 0; t = 0;
        #100;
    end
endmodule
