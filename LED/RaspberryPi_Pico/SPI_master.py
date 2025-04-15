from machine import Pin, SPI
import time

LED1_ON  = const(0x01)
LED1_OFF = const(0xF1)
LED2_ON  = const(0x02)
LED2_OFF = const(0xF2)
LED3_ON  = const(0x03)
LED3_OFF = const(0xF3)

spi = SPI(0, baudrate=5000000, sck=Pin(18), mosi=Pin(19))
cs = Pin(28, Pin.OUT, value=1)

btn1_on  = Pin(0, Pin.IN, Pin.PULL_UP)
btn1_off = Pin(2, Pin.IN, Pin.PULL_UP)
btn2_on  = Pin(6, Pin.IN, Pin.PULL_UP)
btn2_off = Pin(9, Pin.IN, Pin.PULL_UP)
btn3_on  = Pin(13, Pin.IN, Pin.PULL_UP)
btn3_off = Pin(15, Pin.IN, Pin.PULL_UP)

btns = [
    btn1_on,
    btn1_off,
    btn2_on,
    btn2_off,
    btn3_on,
    btn3_off
]

cmds = [
    LED1_ON,
    LED1_OFF,
    LED2_ON,
    LED2_OFF,
    LED3_ON,
    LED3_OFF
]

while True:
    num_on = sum(btn.value() == 0 for btn in btns)
    btns_on = num_on >= 2

    for i in range(6):
        if btns[i].value() == 0 and btns_on == 0:
            cs(0)
            spi.write(bytearray([cmds[i]]))
            cs(1)
            time.sleep(0.1)
