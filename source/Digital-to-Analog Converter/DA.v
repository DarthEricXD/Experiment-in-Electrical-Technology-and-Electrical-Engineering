module DA (
    input clk,
    input rst,
    input [1:0] k,
    output reg [3:0] out
);

    reg [3:0] count;
    reg [4:0] cnt;
    reg p;
    initial p = 1'b1;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 4'b0000;
            cnt <= 5'b00000;
        end else begin
            count <= count + 4'b0001;
            cnt <= cnt + 5'b00001;
        end
    end

    always @(k or count or cnt) begin
        case (k)
            2'b00: out <= (~p, count);
            2'b01: out <= (p, count);
            2'b10: out <= cnt;
            2'b11: out <= cnt;
            default: out <= (~p, count);
        endcase
    end
endmodule
