# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    # basic tools
    config.vm.provision :shell, :path => "provisioner/base.sh"
     
    config.vm.provision :shell, :path => "provisioner/jenkins.sh"

    # Github for windows
    config.vm.share_folder "v-github-windows", "/tmp/github-win", ENV["HOME"]
    config.vm.provision :shell, :path => "provisioner/github-for-windows.sh"

    # some github projects
    config.vm.provision :shell, :path => "provisioner/dotfiles.sh"

end