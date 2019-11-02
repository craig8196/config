#!/bin/bash

# Disable touchpad when the mouse is connected.
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# Load custom terminal settings/profiles.
dconf reset -f /org/gnome/terminal/
dconf load /org/gnome/terminal/ < gnome_terminal.conf

# Load paths to locations on RAID5 array
if [ -e "/dev/md2" ]; then
    cp "user-dirs.dirs" ~/.config/
fi

