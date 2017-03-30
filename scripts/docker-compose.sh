#!/bin/sh -eux

# Install Compose.
curl -sL https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# now alias so we don't have to type docker-compose all the time, just dc
if [ ! -e /usr/local/bin/dc ]; then
    ln -s /usr/local/bin/docker-compose /usr/local/bin/dc
fi
