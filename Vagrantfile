# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here.
  # Every Vagrant virtual environment requires a box to build off of.

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "general_dev" do |general_dev|
    general_dev.vm.provider "virtualbox" do |v, override|
      override.vm.box = "ubuntu/trusty64"
      # Machine will not build at 512 (runs out of memory installing pandas)
      v.memory = 1024
      v.cpus = 1
    end
    general_dev.vm.network "private_network", ip: "192.168.50.30"
    general_dev.vm.network "forwarded_port", guest: 22, host: 20230 # SSH
    general_dev.vm.network "forwarded_port", guest: 3306, host: 53306 # Mysql
    general_dev.vm.synced_folder ".", "/srv/general/dev/"    
    # makes dev logs accessible from everywhere
    # general_dev.vm.synced_folder "tmp", "/tmp/scratch"
    general_dev.vm.provision "shell", run: "always", path: "./bootstrap.sh"

  end
end
