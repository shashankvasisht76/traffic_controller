`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    12:25:37 04/21/26
// Design Name:    
// Module Name:    traffic_controller
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module traffic_controller(clk, reset, emergency_A, roadA, roadB);

input clk;
input reset;
input emergency_A;

output reg [2:0] roadA;
output reg [2:0] roadB;

reg [1:0] state;
reg [3:0] count;

// State encoding
parameter S0 = 2'b00; // A green, B red
parameter S1 = 2'b01; // A yellow, B red
parameter S2 = 2'b10; // A red, B green
parameter S3 = 2'b11; // A red, B yellow

//-----------------------------------------
// State Transition Logic
//-----------------------------------------
always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= S0;
        count <= 0;
    end
    else if (emergency_A)
    begin
        state <= S0;
        count <= 0;
    end
    else
    begin
        count <= count + 1;

        case (state)

            S0:
            begin
                if (count == 5)
                begin
                    state <= S1;
                    count <= 0;
                end
            end

            S1:
            begin
                if (count == 2)
                begin
                    state <= S2;
                    count <= 0;
                end
            end

            S2:
            begin
                if (count == 5)
                begin
                    state <= S3;
                    count <= 0;
                end
            end

            S3:
            begin
                if (count == 2)
                begin
                    state <= S0;
                    count <= 0;
                end
            end

        endcase
    end
end

//-----------------------------------------
// Output Logic
//-----------------------------------------
always @(state)
begin
    case (state)

        S0:
        begin
            roadA = 3'b001; // GREEN
            roadB = 3'b100; // RED
        end

        S1:
        begin
            roadA = 3'b010; // YELLOW
            roadB = 3'b100; // RED
        end

        S2:
        begin
            roadA = 3'b100; // RED
            roadB = 3'b001; // GREEN
        end

        S3:
        begin
            roadA = 3'b100; // RED
            roadB = 3'b010; // YELLOW
        end

        default:
        begin
            roadA = 3'b100;
            roadB = 3'b100;
        end

    endcase
end

endmodule
