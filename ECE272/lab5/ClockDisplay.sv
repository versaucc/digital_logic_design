/* 
Clock Display
*/

module ClockDisplay ( 
	input logic clock,
	/* For clock tuning
	input logic seconds_m,
	input logic minutes_m, 
	input logic hours_m, 
	input logic clock_m,
	*/
	input logic reset_n,
	output logic [25:0] tick,
	output logic [5:0] sec, 
	output logic [6:0] Seg0, // Seconds (ones) 
	output logic [6:0] Seg1, // Seconds (tens) 
	output logic [6:0] Seg2, // Minutes (ones) 
	output logic [6:0] Seg3, // Minutes (tens) 
	output logic [6:0] Seg4, // Hours (ones) 
	output logic [6:0] Seg5 // Hours (tens) 
	);
	
	logic [5:0] seconds; 
	logic [5:0] minutes;
	logic [4:0] hours;
	
	logic [3:0] secondsOnes, secondsTens, minutesOnes, minutesTens, hoursOnes, hoursTens; 
	
	always_comb begin 
		sec = seconds; 
	end
	
	Clock inst (
		.clock(clock),
		.clock_m(clock_m), 
		.reset_n(reset_n),
		.seconds_m(seconds_m),
		.minutes_m(minutes_m), 
		.hours_m(hours_m), 
		.tick(tick), 
		.seconds(seconds),
		.minutes(minutes),
		.hours(hours)
		);
	
	Parser #(.N(6)) parseSeconds (
		.digits(seconds), 
		.clock(clock),
		.ones(secondsOnes), 
		.tens(secondsTens)
	);
	
		Parser #(.N(6)) parseMinutes (
		.digits(minutes), 
		.clock(clock),
		.ones(minutesOnes), 
		.tens(minutesTens)
	);
	
		Parser #(.N(5)) parseHours (
		.digits(hours), 
		.clock(clock),
		.ones(hoursOnes), 
		.tens(hoursTens)
	);
	
	SevenSegmentDecode secOnes ( 
		.digit(secondsOnes), 
		.segments(Seg0), 
		); 
	SevenSegmentDecode secTens ( 
	.digit(secondsTens), 
	.segments(Seg1), 
	); 
		SevenSegmentDecode minOnes ( 
	.digit(minutesOnes), 
	.segments(Seg2), 
	); 
		SevenSegmentDecode minTens ( 
	.digit(minutesTens), 
	.segments(Seg3), 
	); 
		SevenSegmentDecode hOnes ( 
	.digit(hoursOnes), 
	.segments(Seg4), 
	); 
		SevenSegmentDecode hTens ( 
	.digit(hoursTens), 
	.segments(Seg5), 
	); 

	
endmodule

	