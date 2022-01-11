# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2110"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder ".", "/home/vagrant/rails"
  config.vm.provider "libvirt" do |vb|
    vb.memory = "4096"
  end
  config.vm.provision "shell", inline: <<-SHELL
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
SHELL
end
