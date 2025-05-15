// Homemade TB
`timescale 1ns / 1ps

module VGADriverHMTB;

    // Inputs
    logic clk;
    logic reset;
    logic [1:0] Red;
    logic [1:0] Green;
    logic [1:0] Blue;

    // Outputs
    logic HSync;
    logic VSync;
    logic [3:0] RedDisplay;
    logic [3:0] GreenDisplay;
    logic [3:0] BlueDisplay;

    // Instantiate the VGADriver
    VGADriver uut (
        .clk(clk),
        .reset(reset),
        .Red(Red),
        .Green(Green),
        .Blue(Blue),
        .HSync(HSync),
        .VSync(VSync),
        .RedDisplay(RedDisplay),
        .GreenDisplay(GreenDisplay),
        .BlueDisplay(BlueDisplay)
    );

    // Clock generation (50MHz => 20ns period)
    always #10 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        Red = 2'b00;
        Green = 2'b00;
        Blue = 2'b00;

        // Apply reset pulse (active low)
        #25 reset = 1; // Deassert reset after 25 ns

        // Wait for system to settle
        #100;

        // Apply various color inputs
        Red   = 2'b11;
        Green = 2'b10;
        Blue  = 2'b01;

        // Run for a few VGA frames (~1ms = 50,000 clock cycles)
        #2000000;

        // Change color values again
        Red   = 2'b01;
        Green = 2'b11;
        Blue  = 2'b10;

        #2000000;

        $stop; // Stop simulation
    end

endmodule