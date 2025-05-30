
// RGB Multiplexer
module RGBMux (
    input  logic sel,
    input  logic [11:0] img_rgb,
    input  logic [11:0] sw_rgb,
    output logic [11:0] RGBout
);
    assign RGBout = sel ? img_rgb : sw_rgb;
endmodule