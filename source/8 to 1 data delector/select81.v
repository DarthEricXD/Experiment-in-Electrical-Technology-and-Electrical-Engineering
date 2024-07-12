module select81(
    input enable,
    input [2:0] sel,
    input [7:0] Din,
    output Dout
);
    reg Dout;
    always@(enable or sel or Din)
    begin
        if(!enable)
            case(sel)
                3'b000: Dout = Din[0];
                3'b001: Dout = Din[1];
                3'b010: Dout = Din[2];
                3'b011: Dout = Din[3];
                3'b100: Dout = Din[4];
                3'b101: Dout = Din[5];
                3'b110: Dout = Din[6];
                3'b111: Dout = Din[7];
            endcase
        else
            Dout = 0;
    end
endmodule
