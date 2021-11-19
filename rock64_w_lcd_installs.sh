#!/bin/bash

#sudo apt update && sudo apt upgrade
#sudo apt install python3-pip
#sudo pip3 install RPLCD
#sudo apt install python3-smbus
#sudo usermod -a -G sudo,i2c $USER
echo "* * * * * /home/$USER/rock64_provision/ip2lcd.py" > /home/$USER/rock64_provision/ip2lcd_cronjob
crontab /home/$USER/rock64_provision/ip2lcd_cronjob
rm /home/$USER/rock64_provision/ip2lcd_cronjob
