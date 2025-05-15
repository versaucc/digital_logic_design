 module ColorDecoder (
	input logic [1:0] din, 
	output logic [3:0] dout
); 
	
	always_comb begin 
		case (din) 
			2'b00 : dout = 4'b0000; 
			2'b01 : dout = 4'b0101; 
			2'b10 : dout = 4'b1010;
			2'b11 : dout = 4'b1010; 
		endcase
	end 
endmodule