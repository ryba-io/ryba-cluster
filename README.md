# Getting started

Ryba is a Node.js tool to deploy and configure hadoop nodes through SSH.
This project contain a pre-configured environnement to get you started quickly
with a cluster of virtual machines. From there, you can update the configuration and adapt it
to your need based on your production environnement.

# Install Process

## VMs

You may use Vagrant to boostrap a cluster of virtual machines (VMs). Feel free to tweek
the default Vagrant definition located in "./resources/Vagrantfile" with your own
topology. The current definition set up a cluster of 6 VMs and require 16GB of memory.

## Quickstart Guide

To get started with Ryba, we recommend you to read the following resources:

* [Introduction](http://ryba.io/documentation/introduction)
* [Getting Started](http://ryba.io/documentation/getting_started)
* [Guide for Operators](http://ryba.io/documentation/operator)

```
git clone https://github.com/ryba-io/ryba-cluster
cd ryba-cluster
npm install
./bin/vagrant up
./bin/ryba install
```

Detailed information are available on the [official website](http://ryba.io).

## URLs

* Hadoop HDFS NN (krb UI)
  https://master1.ryba:50470 (active)
  https://master2.ryba:50470 (passive)
* Hadoop YARN RM (krb UI)
  https://master1.ryba:8090/cluster/apps
* Hadoop YARN TS (krb rest)
  https://master3.ryba:8190/ws/v1/timeline/
