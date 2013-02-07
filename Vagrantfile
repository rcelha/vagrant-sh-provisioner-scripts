# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    #networking
    config.vm.network :hostonly, "192.168.56.100"
    # config.vm.forward_port 80, 8080
    config.vm.forward_port 8000, 8000

    # basic tools
    config.vm.provision :shell, :path => "provisioner/base.sh"
    config.vm.provision :shell, :path => "provisioner/samba.sh"

    # some github projects
    config.vm.provision :shell, :path => "provisioner/dotfiles.sh"

end