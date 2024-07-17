module sixdeng(
    input clk,
    input rst,
    output reg [5:0] cnt_out,
    output reg [4:0] count_WERed, count_SNRed,
    output reg [4:0] count_WEgreen, count_SNgreen,
    output reg [4:0] count_WEyellow, count_SNyellow,
    output WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow
);

    reg [2:0] current_state, next_state;
    parameter IDLE = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            cnt_out <= 6'b0;
        end else if (cnt_out == 6'b100000) begin
            cnt_out <= 6'b0;
        end else begin
            cnt_out <= cnt_out + 1;
        end
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    always @(rst or current_state or cnt_out) begin
        case (current_state)
            IDLE: begin
                next_state = s1;
            end
            s1: begin
                if (cnt_out == 6'b001111) next_state = s2;
                else next_state = s1;
            end
            s2: begin
                if (cnt_out == 6'b010101) next_state = s3;
                else next_state = s2;
            end
            s3: begin
                if (cnt_out == 6'b100001) next_state = s4;
                else next_state = s3;
            end
            s4: begin
                if (cnt_out == 6'b101000) next_state = s1;
                else next_state = s4;
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b000000;
        end else begin
            case (next_state)
                IDLE: begin
                    {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b100000;
                    count_WERed = 6'b101000;
                    count_SNRed = 6'b101000;
                    count_WEgreen = 6'b011111;
                    count_SNgreen = 6'b011111;
                    count_WEyellow = 6'b000111;
                    count_SNyellow = 6'b000111;
                end
                s1: begin
                    {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b010000;
                    count_WERed = count_WERed - 1;
                    count_SNRed = count_SNRed - 1;
                end
                s2: begin
                    {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b001000;
                    count_WEgreen = count_WEgreen - 1;
                    count_SNgreen = count_SNgreen - 1;
                end
                s3: begin
                    {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b000100;
                    count_WEyellow = count_WEyellow - 1;
                    count_SNyellow = count_SNyellow - 1;
                end
                s4: begin
                    {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b000010;
                    count_WERed = count_WERed - 1;
                    count_SNRed = count_SNRed - 1;
                end
                default: begin
                    {WERed, SNRed, WEgreen, SNgreen, WEyellow, SNyellow} <= 6'b100000;
                end
            endcase
        end
    end
endmodule
