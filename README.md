
# About

Configuration settings for vim.
Install script for development on Ubuntu.
Other information and scripts for setting up my machine.


## ISO to USB

Unmount any mounted partitions on the USB drive.
```bash
sudo umount /dev/sd<?>[1...]
```
Copy contents of ISO to device.
```bash
sudo dd bs=4M if=~/Downloads/<?>.iso of=/dev/sd<?> conv=fdatasync status=progress
```


## Manual WiFi Driver Installation

For some reason my wifi card doesn't work automatically on installation.
You can download the needed packages on another machine and then install
them manually from a USB drive.
```bash
sudo apt --download-only install broadcom-sta-dkms dkms
```
On the target machine run something like:
```bash
sudo dpkg -i broadcom-sta-dkms_all.deb dkms_all.deb
```


## Chrome, Spotify, Steam

Chrome must be installed by going to provider's website.
Spotify might install with:
```bash
sudo snap install spotify
```
Steam might install with multiverse enabled:
```bash
sudo apt install steam
```


## Mount RAID5

Running the `install.sh` script will install `mdadm`.
The system should automatically put the raid array together.
To mount the raid after fresh install:
```bash
sudo mkdir /mnt/raid
sudo mount /dev/md2 /mnt/raid
```
Take the line from /etc/mtab and add to /etc/fstab.
Change the /dev/md2 to UUID=. Get the UUID from running:
```bash
sudo blkid /dev/md2
```
Restart and test that the RAID5 mounts, then run `mk_sym_links.sh`.


## Git User Setup

Run the following commands:
```bash
# Run the following commands as a user
# Install git
sudo apt -y install git
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
```


## SSH

How to generate elliptical curve key for `github.com`.
```bash
ssh-keygen -t ed25519 -C "<email>"
```
