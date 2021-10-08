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

module receiveEngine_tf;

	// Inputs
	reg clk;
	reg rst;
	reg Rx;
	reg eight;
	reg pen;
	reg reads0;
	reg even;
	reg [18:0] k;

	// Outputs
	wire RxRdy;
	wire perr;
	wire ferr;
	wire ovf;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	receiveEngine uut (
		.clk(clk), 
		.rst(rst), 
		.Rx(Rx), 
		.eight(eight), 
		.pen(pen), 
		.reads0(reads0), 
		.even(even), 
		.k(k), 
		.RxRdy(RxRdy), 
		.perr(perr), 
		.ferr(ferr), 
		.ovf(ovf), 
		.data(data)
	);
	
	//Generate clock
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		Rx = 0;
		eight = 0;
		pen = 0;
		reads0 = 0;
		even = 0;
		k = 109; //maximum baud rate

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		
		//DATA to be receieved 0xA5
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 0;
		
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;
		
		//stop bit
		wait(uut.btu == 1);
		wait(uut.btu == 0);
		Rx = 1;//stop
		
		wait(uut.done ==1);
		#200;
		$finish;
	 
		// Add stimulus here

	end
      
endmodule