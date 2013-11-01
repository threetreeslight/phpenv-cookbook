# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "phpenv-berkshelf"
  config.vm.box = "Berkshelf-CentOS-6.3-x86_64-minimal"
  config.vm.box_url = "https://dl.dropbox.com/u/31081437/Berkshelf-CentOS-6.3-x86_64-minimal.box"

  config.vm.network :private_network, ip: "192.168.33.20"
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Install/Update berkshelf
  config.berkshelf.enabled = true
  # Install/Update chef
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      phpenv: { group_users: ["vagrant"],
                version: 'php-5.3.27' },
      git:    { version: "1.8.4.1",
                url: 'https://git-core.googlecode.com/files/git-1.8.4.1.tar.gz' }
    }

    chef.run_list = [
      "recipe[yum::remi]",
      "recipe[yum::epel]",
      "recipe[yum::repoforge]",
      "recipe[git::source]",
      "recipe[phpenv::perl]",
      "recipe[phpenv::default]",
      "recipe[phpenv::5_5_5]"
    ]
  end
end
