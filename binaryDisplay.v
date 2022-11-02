`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2022 08:18:39 AM
// Design Name: 
// Module Name: binaryDisplay
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


module binaryDisplay(
        input SW,
        input wire clk,
        input reset,
        output segmentDisplay,
        output an,
        output dp
    );

    integer totalVal;
    wire clk_output;

    // intialize the prescaler
    prescaler PRESCALER (.clk(clk), .rst(reset), .clk_out(clk_output));

    



endmodule

