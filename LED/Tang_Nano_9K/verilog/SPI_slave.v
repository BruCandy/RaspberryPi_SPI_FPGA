module SPI_slave(
    input  wire       i_clk,
    input  wire       i_rst,
    input  wire       i_sck,
    input  wire       i_mosi,
    input  wire       i_cs,
    output wire [7:0] o_data,
    output wire       o_done
);

    reg [3:0] r_sck;
    reg [3:0] r_cs;
    reg [7:0] r_data;
    reg r_doing = 0;

    wire w_sck;
    wire w_cs_down;
    wire w_done;

    assign w_sck = (r_sck[3] == 0 && r_sck[2] == 1) ? 1 : 0;
    assign w_cs_down = (r_cs[3] == 1 && r_cs[2] == 0) ? 1 : 0;
    assign w_done = (r_cs[3] == 0 && r_cs[2] == 1) ? 1:0;


    assign o_data = w_done ? r_data : 8'b00000000;
    assign o_done = w_done;

    always @(posedoge i_clk or posedoge i_rst) begin
        if (i_rst) begin
            r_sck <= 0;
            r_cs <= 4'b1111;
            r_data <= 0;
            r_doing <= 0; 
        end
        else begin
            r_sck <= {r_sck[2:0], i_sck};
            r_cs <= {r_cs[2:0], i_cs};
            if (w_cs_down) begin
                r_doing <= 1;
            end else if (w_done) begin
                r_doing <= 0;
            end
            if (r_doing) begin
                if (w_sck) begin
                    r_data <= {r_data[6:0], i_mosi};
                end
            end
        end
    end

endmodule