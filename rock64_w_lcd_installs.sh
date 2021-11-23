#!/bin/bash

# Run apt updates and installs
echo "Running apt updates and installs..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3-pip
sudo pip3 install RPLCD
sudo apt install -y python3-smbus

# Regenerate the SSH keys for good measure
echo "Regenerating SSH keys"
sudo dpkg-reconfigure openssh-server

# Enable i2c manually using armbian-config
echo "You must manually enable i2c7 and i2c8..."
echo "    System>Hardware>[i2c7|i2c8]"
read -p "Press [enter] to open armbian-config"
sudo armbian-config

# Add current user to i2c group
echo "Adding current user to i2c group..."
sudo usermod -a -G sudo,i2c $USER

# Find LCD address
test -x /sbin/i2cdetect || echo "i2cdetect not found. Exiting..."
test -x /sbin/i2cdetect || exit 1
echo "Finding LCD i2c address..."
lcd_addr="0x$(sudo /sbin/i2cdetect -y 1 | tail -8 | sed -e 's/.*: //' -e 's/--//g' | grep -e '[0-7][0-9a-fA-F]' | sed 's/ *//g')"
echo "LCD located at $lcd_addr..."
echo "Editing ip2lcd.py..."
sed -i "s/LCD_ADDRESS/$lcd_addr/" /home/$USER/rock64_provision/ip2lcd.py

# Modifying user crontab to display IP to LCD
echo "Modifying user crontab to display IP to LCD..."
echo "* * * * * /home/$USER/rock64_provision/ip2lcd.py" > /home/$USER/rock64_provision/ip2lcd_cronjob
crontab /home/$USER/rock64_provision/ip2lcd_cronjob
rm /home/$USER/rock64_provision/ip2lcd_cronjob

# Restart to enable i2c
echo "Rebooting in 10s to enable i2c"
sleep 10
sudo reboot
