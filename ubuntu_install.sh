#!/bin/bash
# Run under sudo.
# This will install only necessary applications.

# Software finders
apt-get -y install synaptic software-center
# Text editors
apt-get -y install vim geany
# Internet browsers
apt-get -y install firefox
# Python
apt-get -y python python-pip
# Java
apt-get -y default-jre default-jdk

