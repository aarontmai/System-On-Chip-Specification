`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// This document contains information prorietary to the CSULB student that created
// the file -  any reuse without adequate approval and documentation is prohibited
//
// File Name: Data_Status.v
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


module Data_Status(select,data, status,in_port);
 
    input select;
    input [7:0] data, status;
    output reg [15:0] in_port;
    
    always @ (*) begin
      if (select)
        in_port = {8'b0, status};
      else
        in_port = {8'b0, data};
    end
    
endmodule
