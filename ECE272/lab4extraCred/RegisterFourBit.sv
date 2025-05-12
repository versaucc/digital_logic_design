/* 
4 Bit Register 
*/

module RegisterFourBit (
	input logic clock, 
	input logic clear_n, // suffix _n usually indicates "active low' 
	input logic [3:0] d,
	output logic [3:0] q
);

/*
	NOTE: The clear function in this design is synchronous 
	meaning the counter will only be set to 0 on the rising edge of the clock
	*asynchronous* clear (called reset) would set the counter to 0 when 
	activated regardless of the clock signal
*/


	// Create four "OneBitRegister" instances 
	RegisterOneBit bitZero (.clock(clock), .clear_n(clear_n), .din(d[0]), .qout(q[0])); 
	RegisterOneBit bitOne (.clock(clock), .clear_n(clear_n), .din(d[1]), .qout(q[1]));
	RegisterOneBit bitTwo (.clock(clock), .clear_n(clear_n), .din(d[2]), .qout(q[2]));
	RegisterOneBit bitThree (.clock(clock), .clear_n(clear_n), .din(d[3]), .qout(q[3]));
	
endmodule 