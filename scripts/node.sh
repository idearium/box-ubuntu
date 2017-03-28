#!/bin/sh -eux

# Install node.
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install the latest version of npm.
npm install -g npm
