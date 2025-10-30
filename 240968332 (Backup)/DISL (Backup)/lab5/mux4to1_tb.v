`timescale 1ns / 1ps

module mux4to1_tb;

reg [1:0] sel;
reg d0, d1, d2, d3;
wire y;

mux4to1 uut (
    .sel(sel),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .y(y)
);

initial begin
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, mux4to1_tb);
    $display("Time\tSel\tD0 D1 D2 D3\tY");
    $monitor("%0t\t%b\t%b  %b  %b  %b\t%b", $time, sel, d0, d1, d2, d3, y);

    // Case 1: Select d0
    sel = 2'b00; d0 = 1; d1 = 0; d2 = 0; d3 = 0; #10;

    // Case 2: Select d1
    sel = 2'b01; d0 = 0; d1 = 1; d2 = 0; d3 = 0; #10;

    // Case 3: Select d2
    sel = 2'b10; d0 = 0; d1 = 0; d2 = 1; d3 = 0; #10;

    // Case 4: Select d3
    sel = 2'b11; d0 = 0; d1 = 0; d2 = 0; d3 = 1; #10;

    // Case 5: All inputs high, select d1
    sel = 2'b01; d0 = 1; d1 = 1; d2 = 1; d3 = 1; #10;

    // Case 6: Mixed inputs, select d2
    sel = 2'b10; d0 = 1; d1 = 0; d2 = 0; d3 = 1; #10;

    $finish;
end

endmodule

