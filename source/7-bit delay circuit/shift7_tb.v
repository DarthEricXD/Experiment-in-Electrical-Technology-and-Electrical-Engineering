module shift7_tb;
    reg clk;
    reg clr;
    reg Din;
    reg [2:0] addr;
    wire Dout;
    reg [2:0] counter;

    shift7 uut (
        .clk(clk),
        .clr(clr),
        .Din(Din),
        .addr(addr),
        .Dout(Dout)
    );

    always #20 clk = ~clk;

    initial begin
        clk = 0;
        clr = 0;
        Din = 0;
        addr = 0;
        counter = 3'b000;
        #100;
        clr = 1;
        addr = 3'b001;
        #400 addr = 3'b010;
        #400 addr = 3'b011;
        #400 addr = 3'b100;
        #400 addr = 3'b101;
        #400 addr = 3'b110;
    end

    always @(posedge clk) begin
        if (counter < 3'b110) begin
            counter = counter + 1;
            Din = 0;
        end else begin
            counter = 0;
            Din = 1;
        end
    end
endmodule
