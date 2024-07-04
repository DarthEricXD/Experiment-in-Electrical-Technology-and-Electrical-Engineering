module decode381_test;
    reg [2:0] Din;
    wire [7:0] Dout;

    decode381 uut (
        .Din(Din),
        .Dout(Dout)
    );

    initial begin
        Din = 0;
        #100 Din = 3'b001;
        #100 Din = 3'b010;
        #100 Din = 3'b011;
        #100 Din = 3'b100;
        #100 Din = 3'b101;
        #100 Din = 3'b110;
        #100 Din = 3'b111;
    end
endmodule
