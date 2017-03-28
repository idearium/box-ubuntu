#!/bin/sh -eux

# Vagrant specific
date > /etc/vagrant_box_build_time

pubkey_url="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub";
mkdir -p $HOME_DIR/.ssh;
if command -v wget >/dev/null 2>&1; then
    wget --no-check-certificate "$pubkey_url" -O $HOME_DIR/.ssh/authorized_keys;
elif command -v curl >/dev/null 2>&1; then
    curl --insecure --location "$pubkey_url" > $HOME_DIR/.ssh/authorized_keys;
else
    echo "Cannot download vagrant public key";
    exit 1;
fi
chown -R vagrant $HOME_DIR/.ssh;
chmod -R go-rwsx $HOME_DIR/.ssh;

# Add some aliases.
echo 'alias h="history"
alias rr="rm -rf"
alias d="docker"
alias dc="docker-compose"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
' | cat - $HOME_DIR/.bashrc > temp && mv temp $HOME_DIR/.bashrc

# SSH into the /vagrant folder by default.
echo 'cd /vagrant' | cat - $HOME_DIR/.bashrc > temp && mv temp $HOME_DIR/.bashrc
