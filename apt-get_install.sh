#!/bin/bash
# Run under sudo.
# This will install only necessary applications.

# Software finders
apt-get -y install synaptic software-center
# Text editors
apt-get -y install vim geany
# Install firefox
apt-get -y install firefox
# Install chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
sudo apt-get install libnss3-nssdb libnss3 libnspr4
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
# Python
apt-get -y install python python3 python-pip python-numpy python-scipy
# Java

# R
# sudo apt-get -y install r-base r-base-core
# Audio
apt-get -y install audacity
# Video
apt-get -y install vlc
# Office Productivity
apt-get -y install libreoffice
# Spin Prerequisites
# apt-get -y install byacc flex

