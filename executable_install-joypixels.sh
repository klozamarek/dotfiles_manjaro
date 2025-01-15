#!/bin/sh
set -e
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo "Setting up JoyPixels font..."
# 1 - install  ttf-joypixels package
pacman -S ttf-joypixels --needed
# 2 - add font config to /etc/fonts/conf.d/01-joypixels.conf
echo "<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>JoyPixels</family>
            <family>DejaVu Sans</family>
        </prefer>
    </alias>
    <alias>
        <family>serif</family>
        <prefer>
            <family>JoyPixels</family>
            <family>DejaVu Serif</family>
        </prefer>
    </alias>
    <alias>
        <family>monospace</family>
        <prefer>
            <family>JoyPixels</family>
            <family>DejaVu Sans Mono</family>
        </prefer>
    </alias>
</fontconfig>

" > /etc/fonts/local.conf
# 3 - update font cache via fc-cache
fc-cache
echo "JoyPixels Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, your default font contains emojis."
