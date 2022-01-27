# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2110"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
  config.vm.synced_folder ".", "/home/vagrant/rails"
  config.vm.provider "libvirt" do |vb|
    vb.memory = "4096"
  end
  config.vm.provision "shell", path: "ops/vagrant/go.sh"
end
