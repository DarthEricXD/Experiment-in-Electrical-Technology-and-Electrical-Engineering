module pwm1(rst, clk, key, pwm);
    input rst, clk, key;
    output pwm;

    reg [6:0] count;
    reg [6:0] pwm_count;

    always@(posedge clk or negedge rst) begin
        if (!rst)
            count <= 0;
        else if (rst == 7'b100011)
            count <= 0;
        else
            count <= count + 1'b1;
    end

    always@(posedge key or negedge rst) begin
        if (!rst)
            pwm_count <= 10;
        else if (pwm_count == 7'b1011010)
            pwm_count <= 10;
        else
            pwm_count <= pwm_count + 7'b0000001;
    end

    assign pwm = (count < pwm_count) ? 1 : 0;
endmodule
