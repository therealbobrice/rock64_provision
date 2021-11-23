## Configuration for Ikonical rock64 (RK3328) SBC with LCD

This rock64 was [sold on Amazon](https://www.amazon.com/gp/product/B0868WSTXH/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1) as a unit with a case, power supply, LCD, and of course the rock64 in 2020/2021. This script attempts to make the process of configuring this SBC with a display showing the time and IP address (for remote access) easy.

In order to use this you must:
1. Open the machine and flash [Armbian](https://www.armbian.com/rock64/) to the included micro SD card
2. Run through the first boot on the SBC to set up the non-root user
3. Log out of root (`logout`), then log in as normal user at the console
4. `cd ~`
5. Clone the repo
6. `cd` to the `rock64_provision` directory
7. Run `./rock64_w_lcd_install.sh`.

You will need to manually interact with some steps of the script (e.g. entering password, `armbian-config` to enable i2c, etc..), and at the end the script will reboot the machine. At that point the LCD display should update every minute (cronjob) and show the LAN IP.
