`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 09:44:54 AM
// Design Name: 
// Module Name: core_tb
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


module core_tb;

logic clk, resetn;

 core DUT(
    clk, 
    resetn
);

always 
#5 clk=~clk;

    initial begin 
    clk =0; resetn=0; #10
    resetn=1; #10000;
    $finish;
    end


endmodule
