
module CounterDisplay ( 
	input logic clock, 
	input logic clear_n, 
	input logic [3:0] addBy, 
	output logic [6:0] Seg0
	); 
	
	logic [3:0] count; 
	
	// counter instance 
	Counter counter_dut(
		.clock(clock),
		.clear_n(clear_n),
		.addBy(addBy),
		.count(count)
	);
	
	// Seven Segment Decoder
	SevenSegmentDecode decode_dut (
		.digit(count),
		.segments(Seg0)
	);


endmodule
		
		