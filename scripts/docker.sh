#!/bin/sh -eux

# Set up the repository.
sudo apt-get -y install apt-transport-https ca-certificates curl

# Add Docker’s official GPG key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Get Docker CE.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce

# Add docker to sudoers group.
sudo usermod -aG docker vagrant

# Start docker on boot.
sudo systemctl enable docker
