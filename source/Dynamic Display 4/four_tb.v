module four_test;
    reg [3:0] D0;
    reg [3:0] D1;
    reg [3:0] D2;
    reg [3:0] D3;
    reg clk;
    reg rst;
    wire [3:0] Dout;
    wire [3:0] Eout;

    four uut (
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .clk(clk),
        .rst(rst),
        .Dout(Dout),
        .Eout(Eout)
    );

    initial begin
        D0 = 4'b0000;
        D1 = 0;
        D2 = 0;
        D3 = 0;
        clk = 0;
        rst = 0;
        #100;
        rst = 1;
        D3 = 4'b0000;
        D2 = 4'b0001;
        D1 = 4'b0000;
        D0 = 4'b0010;
    end

    always #20 clk = ~clk;
endmodule
