# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.hostname = "Basebox"
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "puppetlabs/ubuntu-16.04-32-puppet"
  config.vm.box_version = "1.0.0"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 2080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.101.113"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # This synced_folder should be the one we update to point to the Joechem code.
  config.vm.synced_folder File.expand_path('../joechem', Dir.pwd), "/var/www", mount_options: ["dmode=777,fmode=777"]

  # These are puppet specific mounts, these should not be touched unless you want
  # to update the puppet setup.
  config.vm.synced_folder File.expand_path('./modules', Dir.pwd), "/etc/puppetlabs/code/environments/production/modules", mount_options: ["dmode=777,fmode=777"]
  config.vm.synced_folder File.expand_path('./manifests', Dir.pwd), "/home/vagrant/manifests", mount_options: ["dmode=777,fmode=777"]

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", :inline => <<EOF
    export DEBIAN_FRONTEND=noninteractive
    # This is needed for mayflower-php, see https://github.com/puphpet/puphpet/issues/2101
    # Not the same package but experienced the same issue.
    sudo apt-get -y update && sudo apt-get install -y software-properties-common vim

    # Update modulepath for the 'production' environment so puppet can find moudules with the synced folder above
    echo "modulepath = ./modules:$basemodulepath" >> /etc/puppetlabs/code/environments/production/environment.conf

    # Run puppet!
    sudo /opt/puppetlabs/bin/puppet apply --environment production manifests/default.pp
EOF
end
