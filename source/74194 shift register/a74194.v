module a74194(clr, M1, M0, clk, SR, SL, D, Q);
    input clr, M1, M0, clk, SR, SL;
    input [3:0] D;
    output reg [3:0] Q;
    
    always @(posedge clk or negedge clr) begin
        if (!clr)
            Q <= 4'b0000;
        else begin
            case ({M1, M0})
                2'b00: Q <= Q;
                2'b01: Q <= {SR, Q[3:1]};
                2'b10: Q <= {Q[2:0], SL};
                2'b11: Q <= D;
            endcase
        end
    end
endmodule
