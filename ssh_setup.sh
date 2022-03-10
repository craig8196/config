#!/bin/bash

# Setup server
sudo apt -y install openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
sudo chmod a-w /etc/ssh/sshd_config.orig
sudo systemctl restart ssh
# Create default files
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/config
touch ~/.ssh/known_hosts
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/{config,known_hosts,authorized_keys}
# Make keys
ssh-keygen -t rsa

