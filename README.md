## Configuration for Ikonical rock64 (RK3328) SBC with LCD

This rock64 was [sold on Amazon](7https://www.amazon.com/gp/product/B0868WSTXH/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1) as a unit with a case, power supply, LCD, and of course the rock64 in 2020/2021. This script attempts to make the process of configuring this SBC with a display showing the time and IP address (for remote access) easy.

In order to use this you must first open the machine and flash [Armbian](https://www.armbian.com/rock64/) to the included micro SD card. Then clone the repo, `cd` to the directory and run `./rock64_w_lcd_install.sh`.
