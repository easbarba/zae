# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'generic/ubuntu2110'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.synced_folder '.', '/home/vagrant/rails'
  config.vm.provider 'libvirt' do |vb|
    vb.memory = '4096'
  end
  config.vm.provision 'shell', inline: <<-SHELL
    sudo apt update
    sudo apt install -y autoconf bison build-essential curl g++ gcc git libffi-dev libgconf-2-4 libgdbm-dev libncurses5-dev libreadline-dev libreadline-dev libsqlite3-dev libssl-dev libxi6 libyaml-dev make sqlite3 xvfb zip zlib1g-dev
SHELL
end
