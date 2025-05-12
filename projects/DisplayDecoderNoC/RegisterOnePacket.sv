// Packet register

module RegisterOnePacket ( 
	input logic clock, 
	input logic clear_n, 
	input logic [23:0] packet_in,
	output logic [23:0] packet_out
	);
	
	RegisterOneByte byteZero (.clock(clock), .clear_n(clear_n), .d(packet_in[3:0]), .q(packet_out[3:0])); 
	RegisterOneByte byteOne (.clock(clock), .clear_n(clear_n), .d(packet_in[7:4]), .q(packet_out[7:4]));
	RegisterOneByte byteTwo (.clock(clock), .clear_n(clear_n), .d(packet_in[11:8]), .q(packet_out[11:8]));
	RegisterOneByte byteThree (.clock(clock), .clear_n(clear_n), .d(packet_in[15:12]), .q(packet_out[15:12])); 
	RegisterOneByte byteFour (.clock(clock), .clear_n(clear_n), .d(packet_in[19:16]), .q(packet_out[19:16]));
	RegisterOneByte byteFive (.clock(clock), .clear_n(clear_n), .d(packet_in[23:20]), .q(packet_out[23:20]));
	
endmodule