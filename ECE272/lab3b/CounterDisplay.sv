
module CounterDisplay ( 
	input logic clock, 
	input logic clear_n, 
	input logic [3:0] addBy, 
	output logic [6:0] Seg0
	); 
	
	Counter counter_dut(
		.clock(clock),
		.clear_n(clear_n),
		.addBy(addBy),
		.count(count),
	);

	SevenSegmentDecode decode_dut (
		.digit(count),
		.segments(seg0)
	);

	endmodule
		
		