                                                                                                                                                                                # -*- mode: ruby -*-
# vi: set ft=ruby :

#require "#{File.dirname(__FILE__)}/vagrant/artisan.rb"
#require "#{File.dirname(__FILE__)}/vagrant/composer.rb"

Vagrant::configure("2") do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    # Definir entorno para el servidor web
    config.vm.define :web do |www|
        www.vm.hostname = "www.botdemon.stage"
        #www.vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        www.ssh.max_tries = 10
        www.vm.network :forwarded_port, guest: 80, host: 6045  # Apache port
        www.vm.network :private_network, ip: "192.168.33.10"

        www.vm.synced_folder "www", "/var/www", :extra => 'dmode=777,fmode=777'
        www.vm.provider :virtualbox do |vb|
          vb.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root', '1' ]
        end
    end

    # Definir entorno para el servidor de base de datos
    config.vm.define :db do |db|
        db.vm.hostname = "db.botdemon"
        #db.vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        db.ssh.max_tries = 10
        db.vm.network :private_network, ip: "192.168.33.11"
        db.vm.network :forwarded_port, guest: 3306, host: 8889 # MySQL port
        db.vm.network :forwarded_port, guest: 5432, host: 5433 # Postgres port

    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.module_path = "puppet/modules"
        #puppet.options = "--verbose --debug"
        #puppet.options = "--verbose"
    end
end
