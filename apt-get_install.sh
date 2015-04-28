#!/bin/bash
# Run under sudo.
# This will install only necessary applications.

# Software finders
apt-get -y install synaptic software-center
# Text editors
apt-get -y install vim geany
# Install firefox
apt-get -y install firefox
# Python
apt-get -y install python python3 python-pip python-numpy python-scipy
apt-get -y install ipython
# Java


# Audio
apt-get -y install audacity
# Video
apt-get -y install vlc
#Image
apt-get -y gimp
# Office Productivity
apt-get -y install libreoffice

###### These were for classes, but are no longer needed. ######
# Spin Prerequisites
# apt-get -y install byacc flex
# R
# sudo apt-get -y install r-base r-base-core


# Clean up
echo "Cleaning up." &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean
