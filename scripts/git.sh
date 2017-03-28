#!/bin/sh -eux

# Required for latest Git.
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update

# Install Git.
sudo apt install -y git
