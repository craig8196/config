#!/bin/bash

# Run under sudo
# This will install desired Ubuntu applications

# Update before proceeding
sudo apt update

# Curl and Wget for other installations
sudo apt -y install curl wget

# Install git
sudo apt -y install git

# Install ctags
sudo apt -y install exuberant-ctags

# Text editor and additions
sudo apt -y install vim
# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
if [ -f ~/.vim/autoload/pathogen.vim ];
then
    echo "Removing existing pathogen.vim file"
    rm ~/.vim/autoload/pathogen.vim
fi
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Install syntastic
if [ -d ~/.vim/bundle/syntastic ];
then
    echo "Removing existing syntastic directory"
    rm -r ~/.vim/bundle/syntastic
fi
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
# Install Javascript configurations
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
# Copy current vim configurations.
if [ -f ~/.vimrc ]; 
then
    echo "Removing existing .vimrc"
    rm ~/.vimrc
else
    echo "No .vimrc to replace"
fi
cp ~/config/vimrc ~/.vimrc

# Python
sudo apt -y install python python3 
sudo apt -y install python-pip python-numpy python-scipy
sudo apt -y install ipython

# Audio
sudo apt -y install audacity

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
#apt install -y software-properties-common
#add-apt-repository -y ppa:hvr/ghc
#apt update
#apt install -y cabal-install-1.22 ghc-7.10.3
#cat >> ~/.bashrc <<EOF
#export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
#EOF
#export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH
## Stack
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
#echo 'deb http://download.fpcomplete.com/ubuntu trusty main'|sudo tee /etc/apt/sources.list.d/fpco.list
#sudo apt-get update && sudo apt-get install stack -y

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

