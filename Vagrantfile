# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = 'ubuntu/trusty64'

  # Configurate the virtual machine to use 1GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3001

  # we're using librarian-chef plugin
  config.librarian_chef.cheffile_dir = 'chef'

  # we're using librarian-chef, so if you have berkshelf plugin installed,
  # remember to uncomment this line
  # config.berkshelf.enabled = false

  # Use Chef Solo to provision virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'chef/cookbooks'

    chef.add_recipe 'apt'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'postgresql'
    chef.add_recipe 'postgresql::server'
    chef.add_recipe 'postgresql::ruby'
    chef.add_recipe 'postgresql::config_initdb'
    chef.add_recipe 'yasm'
    chef.add_recipe 'ffmpeg'

    # Install Ruby 2.1.5 and Bundler
    chef.json = {
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ['2.1.5'],
          global: '2.1.5',
          gems: {
            '2.1.5' => [
              { name: 'bundler' }
            ]
          }
        }]
      },
      postgresql: {
        password: {
          postgres: 'postgres'
        }
      },
      ffmpeg: {
        #install_method: :package
      }
    }
  end
end
