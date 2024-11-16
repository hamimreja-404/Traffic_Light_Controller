`timescale 1ns / 1ps
module Traffic_light_tb();
    reg clk,rst;
    wire [2:0]signal;
    Traffic_light UUT(
        .clk(clk),
        .rst(rst),
        .signal(signal)
    );
    initial
    begin
        rst<=1;
        #3 rst<=0;
        clk<=0;
        forever #0.5 clk = ~clk;
        #5 rst<=0;

    end
    initial
    begin
    #100 $stop;
    end
    
endmodule
