# From: http://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf
# I'm using I2C bus 2
BUS=2
i2cdetect -y -r $BUS
# The MCP23017 appears at address 0x20
ADDR=0x20
i2cdump -y -r 0x00-0x1f $BUS $ADDR b
# The switches are on GPIOA and the LEDs on GPIOB
# This assumes it starts in BANK0.
# Set GPIOA, switches, to inputs
i2cset -y -r $BUS $ADDR 0x00 0xff
# Set GPIOB to outputs
i2cset -y -r $BUS $ADDR 0x01 0x00
# Set pull-up resistors on GPIOA
i2cset -y -r $BUS $ADDR 0x06 0xff
i2cdump -y -r 0x00-0x1f 2 0x20 b
