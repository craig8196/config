#!/bin/bash

# Run under sudo
# This will install desired Ubuntu applications

# Update before proceeding
sudo apt update

# Curl and Wget for other installations
sudo apt -y install curl wget

# Install git
sudo apt -y install git

# Install filesystem utils
sudo apt -y install mdadm gparted cifs-utils

# Networking Utilities
sudo apt -y install net-tools

# Install XML tools (used in vim commands)
sudo apt -y install libxml2-utils

# Text editor and additions
sudo apt -y install vim
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Copy current vim configurations.
if [ -f ~/.vimrc ]; 
then
    echo "Removing existing .vimrc"
    rm ~/.vimrc
else
    echo "No .vimrc to replace"
fi
cp ~/config/vimrc ~/.vimrc

# General
sudo apt -y install exuberant-ctags build-essential cmake libssl-dev
# For building some projects
sudo apt -y install libssl-dev

# Python
sudo apt -y install python python3 python3-dev
sudo apt -y install python-pip python-numpy python-scipy python3-pip
pip3 install neovim
sudo apt -y install ipython

# Audio
sudo apt -y install audacity
sudo apt -y install pulseaudio pavucontrol

# Video
sudo apt -y install vlc
sudo apt -y install ffmpeg ffmpeg-doc

# Image
sudo apt -y install gimp inkscape

# C
sudo apt -y install gcc
sudo apt -y install valgrind
sudo apt -y install libuv0.10 libuv0.10-dbg libuv0.10-dev
sudo apt -y install libuv1 libuv1-dbg libuv1-dev
sudo apt -y install libcurl4-openssl-dev
sudo apt -y install libexpat1 libexpat1-dev

# Rust
curl https://sh.rustup.rs -sSf | sh

# Haskell
sudo apt install -y ghc

# Javascript/Nodejs
sudo apt install -y nodejs
curl https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

###### These were for classes, but are no longer needed. ######
# Spin Prerequisites
# apt-get -y install byacc flex
# R
# sudo apt-get -y install r-base r-base-core

# Install Chrome
#echo "Installing Google Chrome"
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#dpkg -i google-chrome-stable_current_amd64.deb
#rm -f google-chrome-stable_current_amd64.deb
#apt-get -y -f install

# Install Java 8
#echo "Installing Java 8"
#add-apt-repository ppa:webupd8team/java
#apt-get update
#apt-get install oracle-java8-installer
#java -version
#javac -version
#apt-get install oracle-java8-set-default

