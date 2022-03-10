#!/bin/bash
#
# Installation steps for wifi dongle driver
# See: https://ostechnix.com/install-tp-link-ac600-archer-t2u-nano-wifi-usb-adapter-in-linux/
# 

sudo apt install dkms git build-essential libelf-dev linux-headers-$(uname -r)
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au/
sudo make dkms_install
sudo dkms status
# Should see:
# 8812au, 5.6.4.2_35491.20191025, 5.11.15-1-default, x86_64: installed

