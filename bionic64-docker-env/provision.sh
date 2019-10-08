#!/bin/bash

echo -n "Updating and upgrading the package list"
apt-get update -y 

echo -n "Installing Docker"
curl -fsSL https://get.docker.com/ | sh

echo -n "Adding vagrant user to docker group"
gpasswd -a vagrant docker

echo -n "Installing Docker Compose"
curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo -n "Changing mod Docker Compose"
chmod +x /usr/local/bin/docker-compose