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
// CREATED		"Thu Apr 24 11:17:18 2025"

module segmentF(
	digit,
	segment
);


input wire	[3:0] digit;
output wire	[5:5] segment;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;





assign	SYNTHESIZED_WIRE_0 =  ~digit[1];

assign	SYNTHESIZED_WIRE_11 =  ~digit[2];

assign	SYNTHESIZED_WIRE_10 =  ~digit[3];

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_0 & digit[2] & digit[3];

assign	SYNTHESIZED_WIRE_9 = digit[0] & digit[1] & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_7 = digit[1] & SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_8 = digit[0] & SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_10;

assign	segment = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9;


endmodule
