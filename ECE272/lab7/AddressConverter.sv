
// Address Converter Module
module AddressConverter (
    input  logic [8:0] row,
    input  logic [9:0] col,
    output logic [15:0] addr
);
    assign addr = row * 256 + col;
endmodule