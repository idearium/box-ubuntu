#!/bin/sh -eux

# Install the latest version of Docker.
curl -fsSL https://get.docker.com/ | sh

# Add docker to sudoers group.
sudo usermod -aG docker vagrant
