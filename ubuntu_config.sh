#!/bin/bash

gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse
dconf reset -f /org/gnome/terminal/
dconf load /org/gnome/terminal/ < gnome_terminal.conf

