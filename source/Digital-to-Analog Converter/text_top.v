module text_top;
    reg clk;
    reg rst;
    reg [1:0] k;
    wire [3:0] out;

    top uut (
        .clk(clk),
        .rst(rst),
        .out(out),
        .k(k)
    );

    initial begin
        clk = 0;
        rst = 0;
        k = 0;
        #100;
        rst = 1;
        k = 2'b10; #40;
        k = 2'b00; #40;
        k = 2'b11; #40;
        k = 2'b01; #40;
    end

    always #10 clk = ~clk;
endmodule
