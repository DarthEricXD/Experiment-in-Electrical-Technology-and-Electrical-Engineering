module shift7(
    input clk,
    input clr,
    input Din,
    input [2:0] addr,
    output Dout
);
    reg [6:0] reg7;
    reg reg1;

    assign Dout = reg1;

    always @(posedge clk or negedge clr) begin
        if (!clr)
            reg7 <= 7'b0000000;
        else if (Din)
            reg7 <= {reg7[5:0], Din};
        else
            reg7 <= (reg7 << 1);
    end

    always @(addr or Din or reg7) begin
        case (addr)
            3'b000: reg1 <= Din;
            3'b001: reg1 <= reg7[0];
            3'b010: reg1 <= reg7[1];
            3'b011: reg1 <= reg7[2];
            3'b100: reg1 <= reg7[3];
            3'b101: reg1 <= reg7[4];
            3'b110: reg1 <= reg7[5];
            3'b111: reg1 <= reg7[6];
            default: reg1 <= Din;
        endcase
    end
endmodule
