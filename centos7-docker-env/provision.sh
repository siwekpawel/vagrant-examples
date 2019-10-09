#!/bin/bash

echo -n "Updating and upgrading the package list"
yum update -y 
yum upgrade -y
yum install -y yum-utils device-mapper-persistent-data lvm2

echo -n "Installing Docker"
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
usermod -aG docker $(whoami)
systemctl enable docker.service
systemctl start docker.service

echo -n "Installing Docker Compose"
yum install -y epel-release
yum install -y python-pip
pip install docker-compose
pip install --upgrade pip