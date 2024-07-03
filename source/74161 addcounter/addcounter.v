module addcounter(clr, ld, p, t, clk, D, Q, co);
    input clr, ld, p, t, clk;
    input [3:0] D;
    output reg [3:0] Q;
    output reg co;

    always @(posedge clk or negedge clr) begin
        if (!clr)
            Q = 4'b0000;
        else if (!ld)
            Q <= D;
        else
            casex ({p, t})
                2'b11: begin
                    co <= Q[3] & Q[2] & Q[1] & Q[0];
                    Q <= Q + 1'b1;
                end
                2'b01: begin
                    Q <= Q;
                    co <= Q[3] & Q[2] & Q[1] & Q[0];
                end
                2'bx0: begin
                    Q <= Q;
                    co <= 0;
                end
            endcase
    end
endmodule
