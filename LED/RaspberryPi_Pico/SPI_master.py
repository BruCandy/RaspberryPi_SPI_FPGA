from machine import Pin, SPI
import time

spi = SPI(0, baudrate=51200000, sck=Pin(18), mosi=Pin(19))
cs = Pin(28, Pin.OUT, value=1)

btn1_on  = Pin(0, Pin.IN, Pin.PULL_UP)
btn1_off = Pin(2, Pin.IN, Pin.PULL_UP)
btn2_on  = Pin(6, Pin.IN, Pin.PULL_UP)
btn2_off = Pin(9, Pin.IN, Pin.PULL_UP)
btn3_on  = Pin(13, Pin.IN, Pin.PULL_UP)
btn3_off = Pin(15, Pin.IN, Pin.PULL_UP)


while True:
    if btn1_on.value() == 0:
        cs(0)
        spi.write()
        cs(1)
        time.sleep(.1)
    elif btn1_off.value() == 0:
        cs(0)
        spi.write()
        cs(1)