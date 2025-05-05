// Copyright (C) 2025  Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Altera and sold by Altera or its authorized distributors.  Please
// refer to the Altera Software License Subscription Agreements 
// on the Quartus Prime software download page.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"
// CREATED		"Thu Apr 24 11:18:27 2025"

module segmentD(
	digit,
	segment
);


input wire	[3:0] digit;
output wire	[3:3] segment;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_8;




assign	segment = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_2 = digit[0] & SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_1 = digit[0] & digit[1] & digit[2];

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_11 & digit[2] & SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_13 & digit[1] & SYNTHESIZED_WIRE_12 & digit[3];

assign	SYNTHESIZED_WIRE_13 =  ~digit[0];

assign	SYNTHESIZED_WIRE_11 =  ~digit[1];

assign	SYNTHESIZED_WIRE_12 =  ~digit[2];

assign	SYNTHESIZED_WIRE_8 =  ~digit[3];


endmodule
