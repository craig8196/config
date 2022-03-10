#!/bin/bash


sudo apt install -y docker.io
sudo usermod -a -G docker $USER
newgrp docker
sudo systemctl enable docker
sudo systemctl start docker

