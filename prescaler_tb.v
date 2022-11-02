`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 07:21:08 PM
// Design Name: 
// Module Name: prescaler_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module prescaler_tb();

    // Clock and reset signal
    reg clk,rst;
    
    // Design input and output
    wire clk_out;

    prescaler UUT (.clk(clk), .rst(rst), .clk_out(clk_out));

    // generate the clock

    initial
        begin
            clk = 1'b0;
            forever begin
                #5;
                clk = ~clk;
            end
        end
    
    // generate the reset
    initial
        begin
            rst = 1'b1;
            #10;
            rst = 1'b0;
        end

    // test the UUT
    initial 
        begin
            #1e6;
            #1e6;
        end
endmodule : prescaler_tb
