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
        SW,
        clk,
        reset,
        segmentDisplay,
        an,
        dp
    );
    // input singals
    input [12:0] SW;
    input wire clk;
    input reset;

    //output signals
    output [6:0] segmentDisplay;
    output [3:0] an;
    output dp;

    // intermediate signals
    integer totalVal;
    wire clk_output;

    // intialize the prescaler
    prescaler PRESCALER (.clk(clk), .rst(reset), .clk_out(clk_output));

    // STATES in FSM
    localparam STATE_RESET = 3'b000;
    localparam STATE_BIT_0 = 3'b001;
    localparam STATE_BIT_1 = 3'b010;
    localparam STATE_BIT_2 = 3'b011;
    localparam STATE_BIT_3 = 3'b100;

    // unused States in FSM
    localparam STATE_UNUSED_1 = 3'b101;
    localparam STATE_UNUSED_2 = 3'b110;
    localparam STATE_UNUSED_3 = 3'b111;

    // stores the value of the current state
    reg[2:0] CurrentState;
    // stores the value of the next state
    reg[2:0] NextState;

    
    // check when the SW values are changing
    always@(posedge clk, negedge reset, SW) begin
        if (reset == 1) begin
            totalVal <= 0;
        end else begin
            totalVal <= SW;
        end
    end




endmodule

