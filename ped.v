`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
// This document contains information prorietary to the CSULB student that created
// the file -  any reuse without adequate approval and documentation is prohibited
//
// File Name: ped.v
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

module ped(input   clk, rst, signal,
		     output  pulse);
			  
   //local registers
	reg q1, q2; //q1-level; q2-delayReg

	always @(posedge clk, posedge rst)
		if(rst) begin 
			  q1 <= 1'b0;//q1 and q2 gets reset 
			  q2 <= 1'b0;
		end
	
		else begin   
	        q1 <= signal; //q1 gets signal
	        q2 <= q1;     //q2 gets q1
		end		  
	
	assign pulse = q1 & ~q2;//AND gate for a Positive Edge Detect Output
	


endmodule
