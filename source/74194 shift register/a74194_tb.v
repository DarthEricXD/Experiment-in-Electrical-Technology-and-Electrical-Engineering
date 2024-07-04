module a74194t;
    reg clr;
    reg M1;
    reg M0;
    reg clk;
    reg SR;
    reg SL;
    reg [3:0] D;
    wire [3:0] Q;

    a74194 uut (
        .clr(clr),
        .M1(M1),
        .M0(M0),
        .clk(clk),
        .SR(SR),
        .SL(SL),
        .D(D),
        .Q(Q)
    );

    always #100 clk = ~clk;
    
    initial begin
        clr = 1;
        M1 = 1;
        M0 = 1;
        clk = 1;
        SR = 0;
        SL = 0;
        D = 4'b1100;
        #100;
        clr = 0;
        #100;
        clr = 1;
        #100;
        M1 = 0; M0 = 1; SR = 1; #400;
        M1 = 0; M0 = 1; SR = 0; #400;
        M1 = 1; M0 = 0; SL = 1; #400;
        M1 = 1; M0 = 0; SL = 0; #400;
        M1 = 0; M0 = 0;
    end
endmodule
