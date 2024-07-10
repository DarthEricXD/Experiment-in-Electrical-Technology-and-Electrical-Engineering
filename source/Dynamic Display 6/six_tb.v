module six1;
    reg [5:0] D0;
    reg [5:0] D1;
    reg [5:0] D2;
    reg [5:0] D3;
    reg [5:0] D4;
    reg [5:0] D5;
    reg clk;
    reg rst;
    reg en;
    wire [5:0] Dout;
    wire [5:0] Eout;
    six uut (
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .D5(D5),
        .clk(clk),
        .rst(rst),
        .Dout(Dout),
        .Eout(Eout),
        .en(en)
    );
    initial begin
        D0 = 0;
        D1 = 0;
        D2 = 0;
        D3 = 0;
        D4 = 0;
        D5 = 0;
        clk = 0;
        rst = 0;
        en = 0;
        #100;
        rst = 1;
        D5 = 6'b000000;
        D4 = 6'b000001;
        D3 = 6'b000000;
        D2 = 6'b000001;
        D1 = 6'b000000;
        D0 = 6'b000010;
    end
    always #20 clk = ~clk;
endmodule
