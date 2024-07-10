module six(D0, D1, D2, D3, D4, D5, clk, rst, Dout, Eout, en);
    input [5:0] D0;
    input [5:0] D1;
    input [5:0] D2;
    input [5:0] D3;
    input [5:0] D4;
    input [5:0] D5;
    input clk;
    input rst;
    input en;
    output reg [5:0] Dout;
    output reg [5:0] Eout;
    reg [2:0] cnt;
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            cnt <= 3'b000;
        else
            if(cnt == 3'b101)
                cnt <= 3'b000;
            else
                cnt <= cnt + 3'b001;
    end
    always@(cnt)
    begin
        case(cnt)
            3'b000 : Eout <= 6'b011111;
            3'b001 : Eout <= 6'b101111;
            3'b010 : Eout <= 6'b110111;
            3'b011 : Eout <= 6'b111011;
            3'b100 : Eout <= 6'b111101;
            default: Eout <= 6'b111110;
        endcase
    end
    always@(cnt or D5 or D4 or D3 or D2 or D1 or D0)
    begin
        case(cnt)
            3'b000 : Dout <= D5;
            3'b001 : Dout <= D4;
            3'b010 : Dout <= D3;
            3'b011 : Dout <= D2;
            3'b100 : Dout <= D1;
            default: Dout <= D0;
        endcase
    end
endmodule
