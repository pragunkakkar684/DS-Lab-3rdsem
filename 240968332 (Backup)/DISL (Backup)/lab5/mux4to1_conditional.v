module mux4to1_conditional (
    input wire [1:0] sel,
    input wire d0, d1, d2, d3,
    output wire y
);

assign y = (sel == 2'b00) ? d0 :
           (sel == 2'b01) ? d1 :
           (sel == 2'b10) ? d2 :
                           d3;

endmodule

