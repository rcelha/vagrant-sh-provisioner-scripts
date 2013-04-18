# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    config.vm.customize [
        "modifyvm", :id, 
        "--cpus", "2",
        "--memory", "512"]
    
    #networking
    config.vm.network :hostonly, "192.168.56.100"
    # config.vm.forward_port guest, host
    config.vm.forward_port 8000, 8000
    config.vm.forward_port 80, 8080

    # basic tools
    config.vm.provision :shell, :path => "provisioner/base.sh"
    config.vm.provision :shell, :path => "provisioner/samba.sh"

    # github key
    config.vm.provision :shell do |s|
        s.path = "provisioner/github-key.sh"
        s.args = "'" + File.read(File.join(ENV["HOME"], ".ssh", "github_rsa")) + "'"
    end

    # some github projects
    config.vm.provision :shell, :path => "provisioner/dotfiles.sh"

end