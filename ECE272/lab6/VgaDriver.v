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
// CREATED		"Thu May 29 17:05:05 2025"

module VgaDriver(
	clk,
	reset,
	Blue,
	Green,
	Red,
	HSync,
	VSync,
	BlueDisplay,
	GreenDisplay,
	RedDisplay
);


input wire	clk;
input wire	reset;
input wire	[1:0] Blue;
input wire	[1:0] Green;
input wire	[1:0] Red;
output wire	HSync;
output wire	VSync;
output wire	[3:0] BlueDisplay;
output wire	[3:0] GreenDisplay;
output wire	[3:0] RedDisplay;

wire	[3:0] BlueDisplay_ALTERA_SYNTHESIZED;
wire	[3:0] GreenDisplay_ALTERA_SYNTHESIZED;
wire	[3:0] RedDisplay_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_10;





ColorDecoder	b2v_BlueDcd(
	.din(Blue),
	.dout(SYNTHESIZED_WIRE_1));


ColorMUX	b2v_BlueMUX(
	.enable_d(SYNTHESIZED_WIRE_11),
	.color(SYNTHESIZED_WIRE_1),
	.cout(BlueDisplay_ALTERA_SYNTHESIZED));


ColorDecoder	b2v_GreenDcd(
	.din(Green),
	.dout(SYNTHESIZED_WIRE_3));


ColorMUX	b2v_GreenMUX(
	.enable_d(SYNTHESIZED_WIRE_11),
	.color(SYNTHESIZED_WIRE_3),
	.cout(GreenDisplay_ALTERA_SYNTHESIZED));

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;


SyncCount	b2v_inst3(
	.clk(SYNTHESIZED_WIRE_6),
	.reset(SYNTHESIZED_WIRE_12),
	.HSync(HSync),
	.VSync(VSync),
	.HDisplay(SYNTHESIZED_WIRE_4),
	.VDisplay(SYNTHESIZED_WIRE_5));


ClockDivider	b2v_inst5(
	.clk(clk),
	.reset(SYNTHESIZED_WIRE_12),
	.enable_n(SYNTHESIZED_WIRE_6));

assign	SYNTHESIZED_WIRE_12 =  ~reset;


ColorDecoder	b2v_RedDcd(
	.din(Red),
	.dout(SYNTHESIZED_WIRE_10));


ColorMUX	b2v_RedMUX(
	.enable_d(SYNTHESIZED_WIRE_11),
	.color(SYNTHESIZED_WIRE_10),
	.cout(RedDisplay_ALTERA_SYNTHESIZED));

assign	BlueDisplay = BlueDisplay_ALTERA_SYNTHESIZED;
assign	GreenDisplay = GreenDisplay_ALTERA_SYNTHESIZED;
assign	RedDisplay = RedDisplay_ALTERA_SYNTHESIZED;

endmodule
