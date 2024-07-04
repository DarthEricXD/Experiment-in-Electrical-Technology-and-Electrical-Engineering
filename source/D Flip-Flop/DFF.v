module DFF(clk, set, clr, Din, Dout);
    input clk, set, clr;
    input Din;
    output reg Dout;

    always @(posedge clk or negedge clr or negedge set) begin
        if (!clr)
            Dout <= 1'b0;
        else if (!set)
            Dout <= 1'b1;
        else
            Dout <= Din;
    end
endmodule
