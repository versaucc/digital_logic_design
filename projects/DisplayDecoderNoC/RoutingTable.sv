// Routing table 

module RoutingTable ( 
    input logic clock, 
    input logic clear_n, 
    input logic [3:0] target, 
    input logic [3:0] addBy,
    input logic [23:0] packet_in0,
    input logic [23:0] packet_in1,
    input logic [23:0] packet_in2,
    input logic [23:0] packet_in3,
    input logic [23:0] packet_in4,
    input logic [23:0] packet_in5,
    output logic [23:0] packet_out
);

    logic [23:0] packet_data [5:0]; // storage for each packet
    logic [23:0] next_data;

    always_comb begin
        case (target)
            4'd0: next_data = packet_data[0] + addBy;
            4'd1: next_data = packet_data[1] + addBy;
            4'd2: next_data = packet_data[2] + addBy;
            4'd3: next_data = packet_data[3] + addBy;
            4'd4: next_data = packet_data[4] + addBy;
            4'd5: next_data = packet_data[5] + addBy;
            default: next_data = 24'd0;
        endcase
    end

    always_ff @(posedge clock) begin
        if (!clear_n) begin
            packet_data[0] <= packet_in0;
            packet_data[1] <= packet_in1;
            packet_data[2] <= packet_in2;
            packet_data[3] <= packet_in3;
            packet_data[4] <= packet_in4;
            packet_data[5] <= packet_in5;
        end else begin
            if (target < 6)
                packet_data[target] <= next_data;
        end
    end

    assign packet_out = (target < 6) ? packet_data[target] : 24'd0;

endmodule