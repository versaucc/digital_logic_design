// Router

module RoutingEntry ( 
	input logic clock, 
	input logic clear_n, 
	output logic [23:0] data_in, 
	output logic [23:0] data_out
	);
	
	RegisterOneByte byteZero (.clock(clock), .clear_n(clear_n), .d(data_in[3:0]), .q(data_out[3:0])); 
	RegisterOneByte byteOne (.clock(clock), .clear_n(clear_n), .d(data_in[7:4]), .q(data_out[7:4]));
	RegisterOneByte byteTwo (.clock(clock), .clear_n(clear_n), .d(data_in[11:8]), .q(data_out[11:8]));
	RegisterOneByte byteThree (.clock(clock), .clear_n(clear_n), .d(data_in[15:12]), .q(data_out[15:12])); 
	RegisterOneByte byteFour (.clock(clock), .clear_n(clear_n), .d(data_in[19:16]), .q(data_out[19:16]));
	RegisterOneByte byteFive (.clock(clock), .clear_n(clear_n), .d(data_in[23:20]), .q(data_out[23:20]));
		
endmodule