module sixdeng_tb;
    reg clk;
    reg rst;
    wire [5:0] cnt_out;
    wire [4:0] count_WERed, count_SNRed;
    wire [4:0] count_WEgreen, count_SNgreen;
    wire [4:0] count_WEyellow, count_SNyellow;
    wire WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow;

    sixdeng uut (
        .clk(clk),
        .rst(rst),
        .cnt_out(cnt_out),
        .count_WERed(count_WERed),
        .count_SNRed(count_SNRed),
        .count_WEgreen(count_WEgreen),
        .count_SNgreen(count_SNgreen),
        .count_WEyellow(count_WEyellow),
        .count_SNyellow(count_SNyellow),
        .WERed(WERed),
        .SNRed(SNRed),
        .WEgreen(WEgreen),
        .SNgreen(SNgreen),
        .WEyellow(WEyellow),
        .SNyellow(SNyellow)
    );

    initial begin
        clk = 0;
        rst = 0;
        #2 rst = 1;
    end

    always #5 clk = ~clk;
endmodule
