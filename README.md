# Getting started

Ryba is a nodejs tool to deploy and configure hadoop nodes through SSH.
This project contain configuration files and scripts to control a cluster

# Install Process

## VMs

You may use Vagrant to boostrap a cluster of virtual machines (VMs). Feel free to tweek
the default Vagrant definition located in "./resources/Vagrantfile" with your own
topology. The current definition set up a cluster of 6 VMs and require 16GB of memory.

## Ryba

```
git clone https://github.com/ryba-io/ryba-ambari
cd ryba-ambari
npm install
```

## Virtual working environment with Vagrant (optional)

Please refer to doc/vagrant in ryba-io/ryba github project

# Configure Ryba

Please refer to the ryba-io/ryba github project
