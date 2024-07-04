module DFFv;
    reg clk;
    reg set;
    reg clr;
    reg Din;
    wire Dout;

    DFF uut (
        .clk(clk),
        .set(set),
        .clr(clr),
        .Din(Din),
        .Dout(Dout)
    );

    initial begin
        clk = 0;
        set = 1;
        clr = 0;
        Din = 1;
        #100 clr = 1'b0;
        set = 1'b0;
        clk = 1'b0;
        Din = 1'b1;
        #100 clr = 1'b1;
        set = 1'b0;
        clk = 1'b0;
        Din = 1'b1;
        #100 clr = 1'b1;
        set = 1'b0;
        clk = 1'b0;
        Din = 1'b0;
        #100 clr = 1'b0;
        set = 1'b0;
        clk = 1'b0;
        Din = 1'b0;
        #100 clr = 1'b1;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b1;
        #100 clr = 1'b0;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b0;
        #100 clr = 1'b1;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b0;
        #100 clr = 1'b1;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b0;
        #100 clr = 1'b1;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b0;
        #100 clr = 1'b1;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b0;
        #100 clr = 1'b1;
        set = 1'b1;
        clk = 1'b1;
        Din = 1'b0;
    end

    always #50 clk = ~clk;
endmodule
