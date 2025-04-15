module SPI_led(
    input wire i_clk,
    input wire i_rst,
    input wire i_sck,
    input wire i_mosi,
    input wire i_cs,
    output wire o_led1,
    output wire o_led2,
    output wire o_led3    
);

    reg [7:0] r_data [0:5];
    reg r_led1 = 0;
    reg r_led2 = 0;
    reg r_led3 = 0;

    wire [7:0] w_data;
    wire       w_done;

    initial begin
        r_data[0] = 8'b00000001;
        r_data[1] = 8'b11110001;
        r_data[2] = 8'b00000010;
        r_data[3] = 8'b11110010;
        r_data[4] = 8'b00000011;
        r_data[5] = 8'b11110011;
    end

    SPI_slave SPI_slave(
        .i_clk  (i_clk  ),
        .i_rst  (i_rst  ),
        .i_sck  (i_sck  ),
        .i_mosi (i_mosi ),
        .i_cs   (i_cs   ),
        .o_data (w_data ),
        .o_done (w_done )
    );

    assign o_led1 = r_led1;
    assign o_led2 = r_led2;
    assign o_led3 = r_led3;

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            r_led1 <= 0;
            r_led2 <= 0;
            r_led3 <= 0;
        end
        else begin
            if (w_data == r_data[0]) begin
                r_led1 <= 1;
            end else if (w_data == r_data[1]) begin
                r_led1 <= 0;
            end else if (w_data == r_data[2]) begin
                r_led2 <= 1; 
            end else if (w_data == r_data[3]) begin
                r_led2 <= 0; 
            end else if (w_data == r_data[4]) begin
                r_led3 <= 1; 
            end else if (w_data == r_data[5]) begin
                r_led3 <= 0; 
            end
        end
    end


endmodule