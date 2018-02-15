#!/bin/sh -eux

# Install Compose.
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# now alias so we don't have to type docker-compose all the time, just dc
if [ ! -e /usr/local/bin/dc ]; then
    sudo ln -s /usr/local/bin/docker-compose /usr/local/bin/dc
fi
