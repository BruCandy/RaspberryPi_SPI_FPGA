module SPI_top (
    input wire i_clk,
    input wire i_rst,
    input wire i_sck,
    input wire i_mosi,
    input wire i_cs,
    output wire o_led1,
    output wire o_led2,
    output wire o_led3  
);

    wire w_rst;
    wire w_led1;
    wire w_led2;
    wire w_led3;

    assign w_rst  = ~ i_rst;
    assign o_led1 = ~ w_led1;
    assign o_led2 = ~ w_led2;
    assign o_led3 = ~ w_led3;

    SPI_led spi_led (
        .i_clk  (i_clk ),
        .i_rst  (w_rst ),
        .i_sck  (i_sck ),
        .i_mosi (i_mosi),
        .i_cs   (i_cs  ),
        .o_led1 (w_led1),
        .o_led2 (w_led2),
        .o_led3 (w_led3) 
    );

endmodule