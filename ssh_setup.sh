#!/bin/bash

# Setup the ssh server
# Create default files with strict permissions

# SSH Setup
sudo apt -y install openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
sudo chmod a-w /etc/ssh/sshd_config.orig
sudo systemctl restart ssh
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/config
touch ~/.ssh/known_hosts
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/{config,known_hosts,authorized_keys}

