`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// This document contains information prorietary to the CSULB student that created
// the file -  any reuse without adequate approval and documentation is prohibited
//
// File Name: baud_decoder.v
// Project: Project 4 FullUART with the Tramelblaze
// Created by <Aaron Mai> on <November 11, 2020>
// Copright @ 2020 <Aaron Mai>. All rights reserved
//
//In submitting this file for class work at CSULB I am confirming 
// that this is my work product.  In the event other code sources are
// utilized I will document that code identifying the author. In  
// submitting this work I acknowledge that plagiarism in student  
// project work is subject to dismissal from the class.

/////////////////////////////////////////////////////////////////////////////////// 



module baud_decoder(baud, k);

input [3:0] baud;
output reg [18:0] k;


   always@(*)
    begin
      case (baud)
       
         4'b0000: k = 19'd333333;
         4'b0001: k = 19'd83333;
         4'b0010: k = 19'd41667;
         4'b0011: k = 19'd20833;
         4'b0100: k = 19'd10417;
         4'b0101: k = 19'd5208;
         4'b0110: k = 19'd2604;
         4'b0111: k = 19'd1736;
         4'b1000: k = 19'd868;
         4'b1001: k = 19'd434;
         4'b1010: k = 19'd217;
         4'b1011: k = 19'd109;
         default: k = 19'd333333;
      endcase
    end
endmodule
