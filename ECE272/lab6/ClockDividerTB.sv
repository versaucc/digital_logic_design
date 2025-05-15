
module ClockDividerTB;

    // Testbench signals
    logic clk;
    logic reset;
    logic enable_n; 
	 logic [9:0] q; 
    logic lohi;

    // Instantiate the DUT
    ClockCount dut (
        .clk(clk),
        .reset(reset),
        .enable_n(enable_n),
		  .q(q),
        .lohi(lohi)
    );

    // Clock generation: 10ns period = 100MHz
    always #5 clk = ~clk;

    // Initialize and run test
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        enable_n = 0;

        // Hold reset high for first 2 clock cycles
        #20;
        reset = 0;

        // Run for 1600 clock cycles
        repeat (1600) @(posedge clk);

        $display("Simulation complete after 1600 clock cycles.");
        $stop;
    end

    // Optionally monitor lohi changes
    always_ff @(posedge clk) begin
        $display("Time: %0t | lohi = %b", $time, lohi);
    end

endmodule