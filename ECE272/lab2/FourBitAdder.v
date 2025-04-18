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
// CREATED		"Thu Apr 10 17:56:01 2025"

module FourBitAdder(
	Cin,
	A,
	B,
	Cout,
	z
);


input wire	Cin;
input wire	[3:0] A;
input wire	[3:0] B;
output wire	Cout;
output wire	[3:0] z;

wire	[3:0] Z_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





FullAdder	b2v_inst(
	.A(A[2]),
	.B(B[2]),
	.Cin(SYNTHESIZED_WIRE_0),
	.Cout(SYNTHESIZED_WIRE_2),
	.SUM(Z_ALTERA_SYNTHESIZED[2]));


FullAdder	b2v_inst1(
	.A(A[1]),
	.B(B[1]),
	.Cin(SYNTHESIZED_WIRE_1),
	.Cout(SYNTHESIZED_WIRE_0),
	.SUM(Z_ALTERA_SYNTHESIZED[1]));


FullAdder	b2v_inst2(
	.A(A[3]),
	.B(B[3]),
	.Cin(SYNTHESIZED_WIRE_2),
	.Cout(Cout),
	.SUM(Z_ALTERA_SYNTHESIZED[3]));


FullAdder	b2v_inst3(
	.A(A[0]),
	.B(B[0]),
	.Cin(Cin),
	.Cout(SYNTHESIZED_WIRE_1),
	.SUM(Z_ALTERA_SYNTHESIZED[0]));

assign	z = Z_ALTERA_SYNTHESIZED;

endmodule
