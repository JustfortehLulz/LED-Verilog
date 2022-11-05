`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2022 11:11:53 AM
// Design Name: 
// Module Name: prescaler
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


module prescaler(
        clk,
        rst,
        clk_out
    );
    // input signals
    input wire clk;
    input rst;

    // output signals
    output reg clk_out;


    parameter FPGA_CLK = 100e6;
    parameter LIGHT_CLK = 1e3;
    parameter clk_context = FPGA_CLK/LIGHT_CLK;

    integer clk_counter;
    reg temp_clk;

    always @(posedge clk, posedge rst ) begin
        if (rst == 1) begin
            temp_clk = 0;
            clk_counter = 0;
            clk_out = 0;
        end
        else begin
            // rtoi is the real to integer converter
            if (clk_counter == $rtoi((clk_context / 2) - 1)) begin
                clk_counter = 0;
                temp_clk = !temp_clk;
                clk_out = temp_clk;
            end
            else 
                clk_counter = clk_counter + 1;
        end
    end
endmodule

