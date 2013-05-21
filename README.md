vagrant-sh-provisioner-scripts
==============================


Vagrantfile sample

```ruby
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

    config.vm.provision :shell, :path => "base.sh"

    # adding some new repos
    config.vm.provision :shell, :path => "ubuntu-repo-manager.sh", :args => "ppa:chris-lea/node.js"

    # Installing packages through the package manager
    config.vm.provision :shell do |s|
        s.path = "apt-install.sh"
        s.args = "apache2 vim screen python-setuptools python-virtualenv build-essential curl git python-dev libevent-dev unzip rabbitmq-server nodejs"
    end

    config.vm.provision :shell, :path => "samba.sh"

    # github key
    config.vm.provision :shell do |s|
        begin
            s.path = "github-key.sh"
            s.args = "'" + File.read(File.join(ENV["HOME"], ".ssh", "github_rsa")) + "'"
        rescue
        end
    end

    # some github projects
    config.vm.provision :shell, :path => "dotfiles.sh"
end
``` 