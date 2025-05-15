/*
State Machine
*/

module CycleEnable (
	input logic clk, 
	input logic reset, 
	output logic enable_n
	
); 


    typedef enum logic {
        IDLE,
        ENABLE
    } state_t;

    state_t state, next_state;

	logic [9:0] count; // Assuming we will reset every 800 cycles

	 // Sequential logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
				count <= 0;  
        end else begin
            state <= next_state;
				count <= count + 1; 
			end
    end

    // Transfer logic
    always_comb begin
        next_state = state;  // default to current state
        case (state)
            IDLE: begin
						if(count == 2) 
							next_state = ENABLE;
            end

            ENABLE: begin
                next_state = IDLE;
            end
        endcase
    end

	 // Output
    always_comb begin
        case (state)
            IDLE:   enable_n = 1;
            ENABLE: enable_n = 0;
        endcase
    end

endmodule