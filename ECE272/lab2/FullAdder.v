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
// CREATED		"Fri Apr 11 11:59:05 2025"

module FullAdder(
	Cin,
	A,
	B,
	Cout,
	SUM
);


input wire	Cin;
input wire	A;
input wire	B;
output wire	Cout;
output wire	SUM;

wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;




assign	SYNTHESIZED_WIRE_10 = A & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_13 & Cin;

assign	SYNTHESIZED_WIRE_8 = A & B;

assign	SYNTHESIZED_WIRE_7 = Cin & B;

assign	SYNTHESIZED_WIRE_6 = Cin & A;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_15 & B & SYNTHESIZED_WIRE_14;

assign	Cout = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_11 = Cin & B & A;

assign	SUM = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_15 =  ~A;

assign	SYNTHESIZED_WIRE_13 =  ~B;

assign	SYNTHESIZED_WIRE_14 =  ~Cin;


endmodule
