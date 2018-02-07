#!/bin/sh -eux

# Install node.
# https://nodejs.org/en/download/package-manager/
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install the latest version of npm.
npm install -g npm

# Install Yarn
# https://yarnpkg.com/en/docs/install#linux-tab
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
