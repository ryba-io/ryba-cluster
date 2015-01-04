# Getting started

Ryba is a nodejs tool to deploy and configure hadoop nodes through SSH. 

## Install Process

### Ryba

1. After git clone :
```
cd path/to/ryba-cluster
npm install
```

NB: you can use npm link instead of locally install node modules.
example, for masson

```
git clone https://github.com/wdavidw/node-masson
cd node-masson
npm link
```

### Working environment with Vagrant (optional)

If you want to install a working environment for ryba on your machine, you need to have vagrant installed. Vagrant is available for OS X, Windows, and Linux.

please check the official webpage for Vagrant installation process. If you use a linux distribution, vagrant should be available from your package manager.

Once Vagrant is installed, please also install some additionnal modules
```
vagrant plugin install vagrant-share
vagrant plugin install vagrant-vbguest
```

And if you work behind a proxy

`vagrant plugin install vagrant-proxyconf`

The vagrant configuration file VagrantFile is located in the resources directory. Vagrant MUST be executed from this directory. If you use a UNIX OS, you can use the vagrant script for this purpose.

Configure proxy using the env var *VAGRANT\_HTTP\_PROXY*. If you use proxy please set this variable :

On linux :
`export VAGRANT_HTTP_PROXY='http://user:password@proxyurl/'`

On windows :

`SET VAGRANT_HTTP_PROXY='http://user:password@proxyurl/'`

Now you need to download a vagrant box to get started.
To download the box corresponding to our default working environment (CentOS 6.5) :
`vagrant add 'centos65-x86_64' 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box'`

Please check in the resources/VagrantFile that the 'box' corresponds to the name of the box you want to use.
In the previous example :

`box = 'centos65-x86_64'`

VMs should have Vbox Guest Additions installed. The plugin vbguest is here to do the job. There is two ways to configure it :

#### local

You have to have the addition iso file on your computer, corresponding to the version of Virtualbox. You can manually download it or if you are on Linux, you might let your package manager handle it for you.

then modify VagrantFile :
```
config.vbguest.iso_path=/path/to/VBoxGuestAdditions.iso
config.no_remote=true
```

#### Remote

You can let vbguest handle it for you, but your VM have to have an internet connection. This is the default behaviour but here is the corresponding configuration.

`config.no_remote=false`


Now it is time to let Vagrant configure your VMs !

`/project_path/bin/vagrant up`

## Configure Ryba

