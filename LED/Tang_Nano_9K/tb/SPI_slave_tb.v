module SPI_slave_tb();
    reg       i_clk = 1'b1;
    reg       i_rst = 0;
    reg       i_sck = 0;
    reg       i_mosi = 0;
    reg       i_cs = 1;
    wire [7:0] o_data;
    wire       o_done;


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, SPI_slave_tb);
    end

    SPI_slave  spi_slave(
        .i_clk  (i_clk),
        .i_rst  (i_rst),
        .i_sck  (i_sck),
        .i_mosi (i_mosi),
        .i_cs   (i_cs),
        .o_data (o_data),
        .o_done (o_done)
    );

    always #10 begin
        i_clk <= ~i_clk;
    end

    always #250 begin
        i_sck <= ~i_sck;
    end

    initial begin
        i_rst <= 1'b1; #10;
        i_rst <= 1'b0; #30;

        i_cs <= 1'b1; #500;
        i_cs <= 1'b0; #500;

        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        
        i_cs <= 1'b1; #500;
                
        // wait (o_done == 1'b1);   


        $finish;
    end
endmodule