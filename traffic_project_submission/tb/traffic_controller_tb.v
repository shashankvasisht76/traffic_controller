`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:26:23 04/21/2026
// Design Name:   traffic_controller
// Module Name:   traffic_controller_tb.v
// Project Name:  traffic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module tb_traffic_controller();

reg clk;
reg reset;
reg emergency_A;

wire [2:0] roadA;
wire [2:0] roadB;

// Instantiate DUT
traffic_controller uut (
    .clk(clk),
    .reset(reset),
    .emergency_A(emergency_A),
    .roadA(roadA),
    .roadB(roadB)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    emergency_A = 0;

    // Release reset
    #10 reset = 0;

    // Normal operation
    #80;

    // Emergency ON
    emergency_A = 1;
    #40;

    // Emergency OFF
    emergency_A = 0;

    #100;

    $stop;
end

endmodule