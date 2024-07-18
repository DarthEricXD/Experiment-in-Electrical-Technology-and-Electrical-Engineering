module traffic_lights3(
    input clk,
    input rst,
    output reg [5:0] cnt_out,
    output reg [4:0] count_red, count_green, count_yellow,
    output reg red, green, yellow
);

    reg [1:0] CS, NS;
    parameter IDLE = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

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
            CS <= IDLE;
        end else begin
            CS <= NS;
        end
    end

    always @(rst or CS or cnt_out) begin
        case (CS)
            IDLE: begin
                NS <= s1;
            end
            s1: begin
                if (cnt_out == 6'b100010) NS <= s2;
                else NS <= s1;
            end
            s2: begin
                if (cnt_out == 6'b100001) NS <= s3;
                else NS <= s2;
            end
            s3: begin
                if (cnt_out == 6'b100100) NS <= s1;
                else NS <= s3;
            end
            default: begin
                NS <= IDLE;
            end
        endcase
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            {red, green, yellow} <= 3'b000;
        end else begin
            case (NS)
                IDLE: begin
                    {red, green, yellow} <= 3'b000;
                    count_red <= 5'b10010;
                    count_green <= 5'b01111;
                    count_yellow <= 5'b00011;
                end
                s1: begin
                    {red, green, yellow} <= 3'b100;
                    count_red <= count_red - 1;
                    count_green <= 5'b01111;
                    count_yellow <= 5'b00011;
                end
                s2: begin
                    {red, green, yellow} <= 3'b010;
                    count_green <= count_green - 1;
                    count_red <= 5'b10010;
                    count_yellow <= 5'b00011;
                end
                s3: begin
                    {red, green, yellow} <= 3'b001;
                    count_yellow <= count_yellow - 1;
                    count_red <= 5'b10010;
                    count_green <= 5'b01111;
                end
                default: begin
                    {red, green, yellow} <= 3'b000;
                end
            endcase
        end
    end
endmodule
