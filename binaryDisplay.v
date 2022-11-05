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
    output reg [6:0] segmentDisplay;
    output reg [3:0] an;
    output reg dp;

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
    // stores value of first digit of SW
    integer onePos;
    integer tenPos;
    integer hundredPos;
    integer thousandPos;
    
    // check when the SW values are changing
    always@(SW) begin
        totalVal <= SW;
    end

    // if reset is high, move FSM back to STATE_RESET
    always @(posedge clk , posedge reset) begin
        if (reset == 1) begin
            CurrentState <= STATE_RESET;
        end else begin
            CurrentState <= NextState;
        end
    end

    // FSM State transition
    always @(posedge clk_output) begin
        // This indicates there is no state transition

        // TODO: Test out the functionality of the FSM
            NextState = CurrentState;
            case (CurrentState)
                STATE_RESET : begin
                    dp = 1'b0;
                    an = 4'b0000;
                    // state transition
                    if (clk == 1)
                        NextState = STATE_BIT_0;
                end
                STATE_BIT_0 : begin
                    onePos = totalVal % 10;
                    case(onePos)
                        'd0 : segmentDisplay = 7'b100_0000;
                        'd1 : segmentDisplay = 7'b111_1001;
                        'd2 : segmentDisplay = 7'b010_0100;
                        'd3 : segmentDisplay = 7'b011_0000;
                        'd4 : segmentDisplay = 7'b001_1001;
                        'd5 : segmentDisplay = 7'b001_0010;
                        'd6 : segmentDisplay = 7'b000_0010;
                        'd7 : segmentDisplay = 7'b111_1000;
                        'd8 : segmentDisplay = 7'b000_0000;
                        'd9 : segmentDisplay = 7'b001_0000;
                        default : segmentDisplay = 7'b000_0000;
                    endcase

                    dp = 1'b1;
                    an = 4'b1110;
                    if (clk == 1)
                        NextState = STATE_BIT_1;
                end
                STATE_BIT_1 : begin
                    tenPos = ((totalVal % 100) - onePos) / 10;
                    case (tenPos) 
                        'd0 : segmentDisplay = 7'b100_0000;
                        'd1 : segmentDisplay = 7'b111_1001;
                        'd2 : segmentDisplay = 7'b010_0100;
                        'd3 : segmentDisplay = 7'b011_0000;
                        'd4 : segmentDisplay = 7'b001_1001;
                        'd5 : segmentDisplay = 7'b001_0010;
                        'd6 : segmentDisplay = 7'b000_0010;
                        'd7 : segmentDisplay = 7'b111_1000;
                        'd8 : segmentDisplay = 7'b000_0000;
                        'd9 : segmentDisplay = 7'b001_0000;
                        default : segmentDisplay = 7'b000_0000;
                    endcase

                    dp = 1'b1;
                    an = 4'b1101;
                    if (clk == 1)
                        NextState = STATE_BIT_2;    
                end
                STATE_BIT_2 : begin
                    hundredPos = ((totalVal % 1000) - (totalVal % 100)) / 100;
                    case (hundredPos) 
                        'd0 : segmentDisplay = 7'b100_0000;
                        'd1 : segmentDisplay = 7'b111_1001;
                        'd2 : segmentDisplay = 7'b010_0100;
                        'd3 : segmentDisplay = 7'b011_0000;
                        'd4 : segmentDisplay = 7'b001_1001;
                        'd5 : segmentDisplay = 7'b001_0010;
                        'd6 : segmentDisplay = 7'b000_0010;
                        'd7 : segmentDisplay = 7'b111_1000;
                        'd8 : segmentDisplay = 7'b000_0000;
                        'd9 : segmentDisplay = 7'b001_0000;
                        default : segmentDisplay = 7'b000_0000;
                    endcase

                    dp = 1'b1;
                    an = 4'b1011;
                    if (clk == 1)
                        NextState = STATE_BIT_3;  
                end
                STATE_BIT_3 : begin
                    thousandPos = (totalVal  - (totalVal % 1000)) / 1000;
                    case (thousandPos)
                        'd0 : segmentDisplay = 7'b100_0000;
                        'd1 : segmentDisplay = 7'b111_1001;
                        'd2 : segmentDisplay = 7'b010_0100;
                        'd3 : segmentDisplay = 7'b011_0000;
                        'd4 : segmentDisplay = 7'b001_1001;
                        'd5 : segmentDisplay = 7'b001_0010;
                        'd6 : segmentDisplay = 7'b000_0010;
                        'd7 : segmentDisplay = 7'b111_1000;
                        'd8 : segmentDisplay = 7'b000_0000;
                        'd9 : segmentDisplay = 7'b001_0000;
                        default : segmentDisplay = 7'b000_0000;
                    endcase

                    dp = 1'b1;
                    an = 4'b0111;
                    if (clk == 1)
                        NextState = STATE_BIT_0;  
                end

                // unused states
                STATE_UNUSED_1 : begin
                    NextState = STATE_RESET;
                end
                STATE_UNUSED_2 : begin
                    NextState = STATE_RESET;
                end
                STATE_UNUSED_3 : begin
                    NextState = STATE_RESET;
                end
                default: begin
                    NextState = STATE_RESET;
                end
            endcase
    end 

endmodule

