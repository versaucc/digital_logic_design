// 6 Digit Counter Display (hex) 

module SixDigitCounterDisplay (
	input logic clock, 
	input logic clear_n, 
	input logic [3:0] addBy, 
	output logic [6:0] Seg0,
	output logic [6:0] Seg1,
	output logic [6:0] Seg2,
	output logic [6:0] Seg3,
	output logic [6:0] Seg4,
	output logic [6:0] Seg5
	);
	
		// Declare each digit and its 4 bit value, sums for the respective digits, and overflow (edge case)
		logic [3:0] digits [5:0];
		logic [3:0] sum [5:0]; 
		logic [3:0] overflow; // From MSB
		logic override; // Allows clear to be overriden when overflow occurs
		
		
		//assign override = clear_n;
		// Create 6 "Counter" instances, cascade sum to addBy
		
		Counter DigitZero (.clock(clock), .clear_n(override), .addBy(addBy), .count(digits[0]), .sum(sum[0])); 
		Counter DigitOne (.clock(clock), .clear_n(override), .addBy(sum[0]), .count(digits[1]), .sum(sum[1]));
		Counter DigitTwo (.clock(clock), .clear_n(override), .addBy(sum[1]), .count(digits[2]), .sum(sum[2]));
		Counter DigitThree (.clock(clock), .clear_n(override), .addBy(sum[2]), .count(digits[3]), .sum(sum[3]));
		Counter DigitFour (.clock(clock), .clear_n(override), .addBy(sum[3]), .count(digits[4]), .sum(sum[4]));
		Counter DigitFive (.clock(clock), .clear_n(override), .addBy(sum[4]), .count(digits[5]), .sum(sum[5]));
		
		// Check for overflow on last digit, if so restart the count from LSB
		
		always_comb begin
			if (sum[4] + digits[5] > 4'hf) begin 
				overflow = digits[5] + sum[4] + addBy;
				override = 0; 
			end else begin
				override = clear_n; 
			end 
			
		end
		
		
		// Create 6 Seven Segment Decode instances
		SevenSegmentDecode SegZero (.digit(digits[0]), .segments(Seg0));
		SevenSegmentDecode SegOne (.digit(digits[1]), .segments(Seg1));
		SevenSegmentDecode SegTwo (.digit(digits[2]), .segments(Seg2));
		SevenSegmentDecode SegThree (.digit(digits[3]), .segments(Seg3));
		SevenSegmentDecode SegFour (.digit(digits[4]), .segments(Seg4));
		SevenSegmentDecode SegFive (.digit(digits[5]), .segments(Seg5));
		
endmodule
		 
		
		 