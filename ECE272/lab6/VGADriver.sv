/* 
 TOP LEVEL TODO: 
	-Make sure reset is reseting on proper intervals
	-Timing between hcount and vcount 
	-look into VGA pinout more 
	-until tb is released make your own 
*/
module VGADriver ( 
	input logic clk, 
	input logic [1:0] Red, 
	input logic [1:0] Green,
	input logic [1:0] Blue,
	output logic HSync,
	output logic VSync,
	output logic RedDisplay, 
	output logic GreenDisplay, 
	output logic BlueDisplay
	
	); 
	
	logic [1:0] color; 
	logic [3:0] RedDecode; 
	logic [3:0] GreenDecode;
	logic [3:0] BlueDecode;
	
	logic reset; 
	logic enable_n; 
	logic HDisplay; 
	logic VDisplay; 
	logic enbable_display;
	
	ClockDivider clkdv (
		.clk(clk),
		.reset(reset),
		.enable_n(enable_n)
	); 
	
	SyncCount synct (
		.clk(clk),
		.reset(reset), 
		.enable_n(enable_n),
		.HSync(HSync), 
		.VSync(VSync), 
		.HDisplay(HDisplay), 
		.VDisplay(VDisplay) // For a color to be displayed both VD & HD need to be HIGH
		);
		
		
	ColorDecoder reddcd (
		.din(Red),
		.dout(RedDecode)
		);
	
	ColorDecoder greendcd (
		.din(Green),
		.dout(GreenDecode)
		);
		
	ColorDecoder bluedcd (
		.din(Blue),
		.dout(BlueDecode)
		);
		
	ColorMUX red ( 
		.enable_d(enable_display), // ?????!!?!?!?!? What here 
		.color(RedDecode),
		.cout(RedDisplay) //>!>!>!>!> 4b wide 
		); 
		
	ColorMUX green ( 
		.enable_d(enable_display), // ?????!!?!?!?!? What here 
		.color(GreenDecode),
		.cout(GreenDisplay) //>!>!>!>!> 4b wide 
		); 
		
	ColorMUX blue ( 
		.enable_d(enable_display), // ?????!!?!?!?!? What here 
		.color(BlueDecode),
		.cout(BlueDisplay) //>!>!>!>!> 4b wide 
		); 
		
		
		
		
	always_comb begin 
		assign enable_display = (HDisplay & VDisplay);
	end 
	