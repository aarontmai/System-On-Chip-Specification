`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// This document contains information prorietary to the CSULB student that created
// the file -  any reuse without adequate approval and documentation is prohibited
//
// File Name: srflop.v
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

module srflop(input clk, rst, s, r, 
				  output reg srOut);
				 
	
	always @(posedge clk, posedge rst)
		if(rst) srOut <= 1'b0; else
		if(s)	  srOut <= 1'b1; else
		if(r)   srOut <= 1'b0; 
		else	  srOut <= srOut;//not really needed


endmodule
