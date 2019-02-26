#!/bin/bash

# Don't run this as a stand alone script
exit 1

# Run the following commands as a user

# Setup git user
sudo adduser git
su git
cd
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys
exit
# Add user key (on same machine)
cat ~/.ssh/user.pub | sudo tee -a /home/git/.ssh/authorized_keys
# Restrict what can be done with git for security reasons by using the git shell
echo $(which git-shell) | sudo tee -a /etc/shells
sudo chsh git -s $(which git-shell)

