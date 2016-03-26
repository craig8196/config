#!/bin/bash
# Run under sudo.
# This will install only necessary applications.

# Update before proceeding
apt-get update

<<<<<<< HEAD

# Preferred Terminal
apt-get -y install terminator
=======
>>>>>>> 622d2ec23a6f63ba6d87afddd447c4c31dd61161
# Software finders
apt-get -y install synaptic software-center
# Text editors
apt-get -y install vim
# Install firefox
apt-get -y install firefox
# Python
apt-get -y install python python3 python-pip python-numpy python-scipy
apt-get -y install ipython
# Audio
apt-get -y install audacity
# Multimedia
apt-get -y install vlc
# Image
apt-get -y gimp
# Office Productivity
apt-get -y install libreoffice
# Haskell
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y cabal-install-1.22 ghc-7.10.3
cat >> ~/.bashrc <<EOF
export PATH="\$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:\$PATH"
EOF
export PATH=~/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH

###### These were for classes, but are no longer needed. ######
# Spin Prerequisites
# apt-get -y install byacc flex
# R
# sudo apt-get -y install r-base r-base-core

# Install Chrome
echo "Installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome-stable_current_amd64.deb &&
rm -f google-chrome-stable_current_amd64.deb
apt-get -y -f install
# Install Java 8
#echo "Installing Java 8"
#add-apt-repository ppa:webupd8team/java
#apt-get update
#apt-get install oracle-java8-installer
#java -version
#javac -version
#apt-get install oracle-java8-set-default
