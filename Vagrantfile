# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    config.vm.provider "virtualbox" do |vb|
        vb.customize [
            "modifyvm", :id,
            "--cpus", "2",
            "--memory", "512"]
    end

    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 8000, host: 8000
    config.vm.network "forwarded_port", guest: 8787, host: 8787

    config.vm.provision "shell", path: "provisioner-base.sh"

    # Installing packages through the package manager
    config.vm.provision :shell do |s|
        s.path = "install-package.sh"
        s.args = "r-base gdebi-core libapparmor1"
    end

    # github key
    config.vm.provision :shell do |s|
        begin
            s.path = "import-github-key-from-windows.sh"
            s.args = "'" + File.read(File.join(ENV["HOME"], ".ssh", "github_rsa")) + "'"
        rescue
        end
    end

    config.vm.provision "shell", path: "install-r-server.sh"

end