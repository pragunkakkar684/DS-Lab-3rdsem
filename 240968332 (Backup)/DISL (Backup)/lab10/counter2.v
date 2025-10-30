module counter2 (input clk, input resetn, output reg [1:0] count);
    always @(posedge clk or negedge resetn) begin
        if (!resetn)
            count <= 2'b00;
        else
            count <= count + 1;
    end
endmodule

