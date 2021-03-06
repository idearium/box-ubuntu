# box-ubuntu

An Ubuntu Vagrant development box, built with Packer.

You can [download the box on Vagrant Cloud](https://app.vagrantup.com/idearium/boxes/ubuntu-16.04).

## Features

- Ubuntu 16.04 LTS (Xenial Xerus) Server
- Docker
- Docker Compose
- Git
- MongoDB Shell + Tools
- Node.js

## Requirements

Make sure all dependencies have been installed before moving on:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
    - [vagrant-hostmanager](https://github.com/devopsgroup-io/vagrant-hostmanager/)
  - [VirtualBox](https://www.virtualbox.org/)
  - [VMWare](http://www.vmware.com/products/fusion.html)

## Setup

1. Download this repository.
1. Make sure your system meets all dependencies.
1. Run `packer build ubuntu-16.04.json` to build the boxes.
1. Upload the boxes in the `builds` folder to [Vagrant Cloud](https://app.vagrantup.com/idearium/boxes/ubuntu-16.04).

## Testing

You can test the built boxes with the provided Vagrant script. Make sure you change the box path if you are using `vmware`.
