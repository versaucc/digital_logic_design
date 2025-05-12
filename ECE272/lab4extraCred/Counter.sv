/* 
counter 
*/ 

module Counter (
	input logic clock, 
	input logic clear_n,
	input logic [3:0] addBy, // Amount to increment every clock tick (0-15)
	output logic [3:0] count, // Value stored in counter (0-15)
	output logic [3:0] sum
	);
	
		
	logic [3:0] count_next;
	
	assign {sum, count_next} = count + addBy ; 
	
	
	RegisterFourBit dut (
		.clock(clock),
		.clear_n(clear_n),
		.d(count_next),
		.q(count)
		);
			
	
endmodule 
	
	