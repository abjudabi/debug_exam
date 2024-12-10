`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 08:57:40 AM
// Design Name: 
// Module Name: counter_4bit_tb
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


module counter_4bit_tb;


    
        logic clk                 ;
        logic reset_n             ;
        logic load                ;
        logic [3:0]load_data      ;
        logic [3:0]count          ;
        
        
     counter_4bit UUT(
        clk,
        reset_n,
        load,
        load_data,
        count
);


always 
#5 clk=~clk;

    initial begin 
    
    clk =0; reset_n =0; load =0; load_data =0; #10;
    reset_n =1; load =0; load_data =0; #10;
    load =0; load_data =0; #10;
    load =0; load_data =0; #10;
    load =1; load_data =1; #10;
    load =0; load_data =0; #10;
    
    #100;
    
    $finish;
    
    end





endmodule
