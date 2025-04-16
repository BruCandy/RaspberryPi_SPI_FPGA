from machine import Pin, SPI
import time

COUNT_UP = const(0x01)
SHIFT    = const(0x0A)

spi = SPI(0, baudrate=5000000, sck=Pin(18), mosi=Pin(19))
cs = Pin(28, Pin.OUT, value=1)

btn_count_up  = Pin(0, Pin.IN, Pin.PULL_UP)
btn_shift     = Pin(2, Pin.IN, Pin.PULL_UP)

btns = [
    btn_count_up,
    btn_shift
]

cmds = [
    COUNT_UP,
    SHIFT
]

while True:
    num_push = sum(btn.value() == 0 for btn in btns)
    btns_push = num_push >= 2

    for i in range(6):
        if btns[i].value() == 0 and btns_push == 0:
            cs(0)
            spi.write(bytearray([cmds[i]]))
            cs(1)
            time.sleep(0.1)