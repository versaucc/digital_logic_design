/* 
counter Notes: 
	-Sum refers to the "carry-out" of the operation. 
		- When changing to dnyamic structure this will probably 
			remove the need for a sum, as the packet width is flexible
	- Count: Output, flexible 
	- addBy: Input, could be flexible for tuning clock timing 
	- enable_n: Input, controls writing 
	- clock: Input 
	
	*use a module RegisterNBit to handle N bit, handle enable_n here
*/ 

module Counter #(
    parameter int N = 4,
    parameter int LIM = 50000000
)(
    input  logic clock,
    input  logic enable_n,
    input  logic reset_n,
    input  logic addBy,
    output logic [N-1:0] count,
    output logic sum
);

    always_ff @(posedge clock or negedge reset_n) begin
        if (!reset_n) begin
            count <= 0;
            sum <= 0;
        end else if (!enable_n) begin
            if (count + addBy >= LIM) begin
                count <= 0;
                sum <= 1;  
            end else begin
                count <= count + addBy;
                sum <= 0;
            end
        end else begin
            sum <= 0; 
        end
    end

endmodule


	
	