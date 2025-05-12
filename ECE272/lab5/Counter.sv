/* 
counter 
*/ 

module DynCounter (
	input logic clock, 
	input logic clear_n,
	input logic enable_n,
	input logic [3:0] addBy, // Amount to increment every clock tick (0-15)
	output logic [3:0] count, // Value stored in counter (0-15)
	output logic [3:0] sum
	);
	
		
	logic [3:0] count_next;
	
	always_comb begin
		// If writing is enabled (active low) count normally. If disabled, count is preserved. 
		if(!enable_n) 
			// Adder used for all 6 displays
			assign {sum, count_next} = count + addBy ; 
		else
			assign count_next = count; 
			assign sum = 0; 
	end 
	
	RegisterFourBit dut (
		.clock(clock),
		.clear_n(clear_n),
		.d(count_next),
		.q(count)
		);
			
	
endmodule 
	
	