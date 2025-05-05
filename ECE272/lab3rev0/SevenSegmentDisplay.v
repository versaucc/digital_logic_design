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
// CREATED		"Thu Apr 24 11:16:36 2025"

module SevenSegmentDisplay(
	digit,
	segment
);


input wire	[3:0] digit;
output wire	[6:0] segment;

wire	[3:0] gdfx_temp0;
wire	[6:0] segment_ALTERA_SYNTHESIZED;





segmentA	b2v_inst(
	.digit(digit),
	.segment(segment_ALTERA_SYNTHESIZED[0]));


segmentB	b2v_inst2(
	.digit(digit),
	.segment(segment_ALTERA_SYNTHESIZED[1]));


segmentC	b2v_inst3(
	.digit(gdfx_temp0),
	.segment(segment_ALTERA_SYNTHESIZED[2]));


segmentD	b2v_inst4(
	.digit(digit),
	.segment(segment_ALTERA_SYNTHESIZED[3]));


segmentF	b2v_inst5(
	.digit(digit),
	.segment(segment_ALTERA_SYNTHESIZED[5]));


segmentG	b2v_inst6(
	.digit(digit),
	.segment(segment_ALTERA_SYNTHESIZED[6]));


segmentE	b2v_inst8(
	.digit(digit),
	.segment(segment_ALTERA_SYNTHESIZED[4]));

assign	segment = segment_ALTERA_SYNTHESIZED;
assign	gdfx_temp0[2] = digit[3];
assign	gdfx_temp0[3] = digit[2];
assign	gdfx_temp0[1] = digit[1];
assign	gdfx_temp0[0] = digit[0];

endmodule
