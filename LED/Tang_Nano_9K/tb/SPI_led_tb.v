module SPI_led_tb();
    reg  i_clk = 1'b1;
    reg  i_rst = 0;
    reg  i_sck = 0;
    reg  i_mosi = 0;
    reg  i_cs = 1;
    wire o_led1;
    wire o_led2;
    wire o_led3;


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, SPI_led_tb);
    end

    SPI_led  spi_led(
        .i_clk  (i_clk),
        .i_rst  (i_rst),
        .i_sck  (i_sck),
        .i_mosi (i_mosi),
        .i_cs   (i_cs),
        .o_led1 (o_led1),
        .o_led2 (o_led2),
        .o_led3 (o_led3)
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

        i_mosi <= 1'b0; 
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        
        i_cs <= 1'b1; #500;

        #3000

        i_cs <= 1'b0;

        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        
        i_cs <= 1'b1; #500;

        #3000

        i_cs <= 1'b0;

        i_mosi <= 1'b0; 
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        
        i_cs <= 1'b1; #500;

        #3000

        i_cs <= 1'b0;

        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        
        i_cs <= 1'b1; #500;

        #3000

        i_cs <= 1'b0;

        i_mosi <= 1'b0; 
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        
        i_cs <= 1'b1; #500;

        #3000

        i_cs <= 1'b0;

        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b0; #500;
        i_mosi <= 1'b1; #500;
        i_mosi <= 1'b1; #500;
        
        i_cs <= 1'b1; #500;
                
        // wait (o_done == 1'b1);   


        $finish;
    end
endmodule