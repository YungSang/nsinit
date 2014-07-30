# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "boot2docker-nsinit"

  config.vm.box = "yungsang/boot2docker"

  config.vm.provision :shell, path: "boot2docker-nsinit", privileged: false
end
