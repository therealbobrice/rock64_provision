#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt install python3-pip
sudo pip3 install RPLCD
sudo apt install python3-smbus
sudo usermod -a -G sudo,i2c robert
crontab ~/rock64_provision/ip2lcd_cronjob
