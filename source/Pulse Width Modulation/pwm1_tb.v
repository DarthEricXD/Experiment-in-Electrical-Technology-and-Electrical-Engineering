module pwm1_tb;
    reg rst;
    reg clk;
    reg key;
    wire pwm;

    pwm1 uut (
        .rst(rst),
        .clk(clk),
        .key(key),
        .pwm(pwm)
    );

    initial begin
        rst = 0;
        clk = 0;
        key = 0;
        #2 rst = 1;
    end

    always #5 clk = ~clk;
    always #5 key = ~key;
endmodule
