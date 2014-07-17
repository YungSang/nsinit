# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "nsinit-builder"

  config.vm.box = "yungsang/boot2docker"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # Adjust datetime after suspend and resume
  config.vm.provision :shell do |s|
    s.inline = <<-EOT
      sudo /usr/local/bin/ntpclient -s -h pool.ntp.org
      date
    EOT
  end

  config.vm.provision :docker do |d|
    d.build_image "/vagrant/", args: "-t yungsang/nsinit"
    d.run "yungsang/nsinit", args: "--rm -v /vagrant:/target",
      auto_assign_name: false, daemonize: false
  end
end
