// ColorMUX

module ColorMUX ( 
	input logic enable_d, 
	input logic [3:0] color, 
	output logic [3:0] cout
	);
	
	assign cout = (enable_d) ? color : 4'b0000; 
	
	endmodule