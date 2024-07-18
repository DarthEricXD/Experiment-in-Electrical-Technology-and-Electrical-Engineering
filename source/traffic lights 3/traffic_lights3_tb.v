module traffic_lights3_tb;
    reg clk;
    reg rst;
    wire [5:0] cnt_out;
    wire [4:0] count_red, count_green, count_yellow;
    wire red, green, yellow;

    traffic_lights3 uut (
        .clk(clk),
        .rst(rst),
        .cnt_out(cnt_out),
        .count_red(count_red),
        .count_green(count_green),
        .count_yellow(count_yellow),
        .red(red),
        .green(green),
        .yellow(yellow)
    );

    initial begin
        clk = 0;
        rst = 0;
        #2 rst = 1;
    end

    always #5 clk = ~clk;
endmodule
