`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 7:02:36 PM
// Design Name: 
// Module Name: binaryDisplay_tb.v
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

module binaryDisplay_tb ();

    // input signals
    reg clk,reset;
    reg [12:0] SW;

    // output signals
    wire [6:0] segmentDisplay;
    wire [3:0] an;
    wire dp;

    binaryDisplay UUT (.SW(SW), .clk(clk), .reset(reset), .segmentDisplay(segmentDisplay), .an(an), .dp(dp));

    //generate the clock
    initial
        begin
            clk = 1'b0;
            forever begin
                #5;
                clk = ~clk;
            end
        end
    
    //generate the reset
    initial
        begin
            reset = 1'b1;
            #10;
            reset = 1'b0;
        end

    // change the SW values a few times to test that it works
    initial
        begin
            SW = 'b0_0000_0000_1101;
            #15;
            SW = 'b0_0000_1111_0001;
            #5;
            reset = 1'b1;
            SW = 'b0_0010_1111_1101;
            #10;
            reset = 1'b0;
            SW = 'b1_1111_1111_1111;
        end

endmodule : binaryDisplay_tb