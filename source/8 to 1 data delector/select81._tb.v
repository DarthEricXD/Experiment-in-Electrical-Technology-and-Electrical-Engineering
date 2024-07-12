module select81_tb;
    reg enable;
    reg [2:0] sel;
    reg [7:0] Din;
    wire Dout;

    select81 uut (
        .enable(enable),
        .sel(sel),
        .Din(Din),
        .Dout(Dout)
    );

    initial begin
        enable = 0;
        sel = 0;
        Din = 0;
        #100 Din[0] = 0;
        Din[1] = 1;
        Din[2] = 0;
        Din[3] = 1;
        Din[4] = 0;
        Din[5] = 1;
        Din[6] = 0;
        Din[7] = 1;
        #100 sel = 3'b000;
        #100 sel = 3'b001;
        #100 sel = 3'b010;
        #100 sel = 3'b011;
        #100 sel = 3'b100;
        #100 sel = 3'b101;
        #100 sel = 3'b110;
        #100 sel = 3'b111;
    end
endmodule
