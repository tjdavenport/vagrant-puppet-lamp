# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    # Basic configuration
    config.vm.box = 'ubuntu/trusty64'
    config.vm.hostname = 'Fragbox'
    config.vm.post_up_message = 'Welcome to the Fragbox!'

    # Networking
    ## Open up port 80 so we can access the apache server
    config.vm.network 'private_network', ip: '192.168.56.101'
    config.vm.network 'forwarded_port', guest: 80, host: 8080

    # VirtualBox settings
    config.vm.provider 'virtualbox' do |vbox|
        vbox.name = 'Fragbox'
        vbox.memory = 512
        vbox.cpus = 1
    end

    # Puppet configuration
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = './manifests'
        puppet.module_path = './modules'
        puppet.hiera_config_path = 'hiera.yaml'
    end
end
