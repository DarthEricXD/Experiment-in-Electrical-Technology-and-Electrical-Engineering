module four(D0, D1, D2, D3, clk, rst, Dout, Eout);
    input [3:0] D0;
    input [3:0] D1;
    input [3:0] D2;
    input [3:0] D3;
    input clk;
    input rst;
    output reg [3:0] Dout;
    output reg [3:0] Eout;
    reg [1:0] cnt;

    always@(posedge clk or negedge rst) begin
        if (!rst)
            cnt <= 2'b00;
        else
            cnt <= cnt + 2'b01;
    end

    always@(cnt or D3 or D2 or D1 or D0) begin
        case(cnt)
            2'b00: Eout <= 4'b0111;
            2'b01: Eout <= 4'b1011;
            2'b10: Eout <= 4'b1101;
            default: Eout <= 4'b1110;
        endcase
    end

    always@(cnt or D3 or D2 or D1 or D0) begin
        case(cnt)
            2'b00: Dout <= D0;
            2'b01: Dout <= D1;
            2'b10: Dout <= D2;
            default: Dout <= D3;
        endcase
    end
endmodule
