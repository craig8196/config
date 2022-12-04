#!/bin/bash

# This will install desired Ubuntu applications

# Update before proceeding
sudo apt update

# Install git
sudo apt -y install git

# Text editor and additions
sudo apt -y install vim tmux
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Copy current vim configurations.
if [ -f ~/.vimrc ]; 
then
    echo "Moving existing .vimrc"
    mv ~/.vimrc ~/.vimrc.backup
else
# No .vimrc to replace
    cp vimrc ~/.vimrc
fi

# Curl and Wget for other installations
sudo apt -y install curl wget

# Install filesystem utils
sudo apt -y install mdadm gparted cifs-utils
# Install file utils
sudo apt -y install rsync

# Networking Utilities
sudo apt -y install net-tools

# Install XML tools (used in vim commands)
sudo apt -y install libxml2-utils

# General
sudo apt -y install exuberant-ctags build-essential cmake libssl-dev
# For OS development (build-essential installed above)
sudo apt -y install genisoimage nasm bochs bochs-sdl
# For building some projects
sudo apt -y install libssl-dev

# Python
sudo apt -y install python3 python3-dev
sudo apt -y install python3-pip python3-numpy python3-scipy
sudo apt -y install ipython3

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
#sudo apt -y install libuv0.10 libuv0.10-dbg libuv0.10-dev
sudo apt -y install libuv1 libuv1-dev #libuv1-dbg
sudo apt -y install libcurl4-openssl-dev
sudo apt -y install libexpat1 libexpat1-dev
sudo apt -y install cppcheck
sudo apt -y install clang clang-tools
sudo apt -y install llvm
sudo apt -y install linux-tools-common
sudo apt -y install lcov

# Rust
curl https://sh.rustup.rs -sSf | sh

# Haskell
sudo apt install -y ghc

# Javascript/Nodejs
#sudo apt install -y libssl1.0-dev nodejs-dev node-gyp nodejs npm
#curl https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

###### These were for classes, but are no longer needed. ######
# Spin Prerequisites
# apt-get -y install byacc flex
# R
# sudo apt-get -y install r-base r-base-core

# Install Java 8
#echo "Installing Java 8"
#add-apt-repository ppa:webupd8team/java
#apt-get update
#apt-get install oracle-java8-installer
#java -version
#javac -version
#apt-get install oracle-java8-set-default

