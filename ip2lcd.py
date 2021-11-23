#!/usr/bin/python3

# from subprocess import check_output
from time import sleep
from datetime import datetime
from RPLCD.i2c import CharLCD
import socket
#lcd = CharLCD('PCF8574', 0x3f, auto_linebreaks=False)
lcd = CharLCD('PCF8574', 0x3f, auto_linebreaks=False)
lcd.clear()

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
ip = s.getsockname()[0]
ipstr = "IP {0}".format(ip)
print(ipstr)
s.close()


now = datetime.now()
rightnow = now.strftime("%m/%d, %H:%M")

lcd.write_string(rightnow)
lcd.crlf()
lcd.write_string(ipstr)
