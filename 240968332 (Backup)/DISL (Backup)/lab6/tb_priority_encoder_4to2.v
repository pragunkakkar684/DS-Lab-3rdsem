`timescale 1ns / 1ps

module tb_priority_encoder_4to2;

    reg [3:0] in;
    wire [1:0] out;

    // Instantiate the priority encoder
    priority_encoder_4to2 uut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("priority_encoder_4to2_tb.vcd");
        $dumpvars(0, tb_priority_encoder_4to2);

        $display("Time\t in     | out");
        $display("---------------------");

        in = 4'b0000; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b0001; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b0010; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b0100; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b1000; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b1010; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b0110; #10 $display("%0t\t %b | %b", $time, in, out);
        in = 4'b1111; #10 $display("%0t\t %b | %b", $time, in, out);

        $finish;
    end

endmodule

