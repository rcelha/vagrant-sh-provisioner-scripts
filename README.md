vagrant-sh-provisioner-scripts
==============================


Vagrantfile sample

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    #networking
    config.vm.network :hostonly, "192.168.56.100"

    config.vm.provision "file", source: "provisioner-base.sh", destination: "/tmp/provisioner-base.sh"

    config.vm.provision :shell do |s|
        s.path = "install-package.sh"
        s.args = "python-software-properties python g++ make"
    end

    config.vm.provision :shell do |s|
        s.path = "add-repository.sh"
        s.args = "chris-lea/node.js"
    end

    config.vm.provision :shell do |s|
        s.path = "install-package.sh"
        s.args = "python python-dev gcc make samba ruby rubygems git"
    end

    config.vm.provision :shell, :path => "install-compass-from-gem.sh"

    config.vm.provision "shell", inline: ". /tmp/provisioner-base.sh && copy_files bin/* /usr/local/bin/"
    config.vm.provision "shell", inline: ". /tmp/provisioner-base.sh && copy_files example-rc/.bash_aliases ~vagrant/"
    config.vm.provision "shell", inline: ". /tmp/provisioner-base.sh && append_to_file 'alias l=\"ls -lh\"' ~vagrant/.bash_aliases"

    config.vm.provision :shell, :path => "configure-samba.sh"


    # github key
    config.vm.provision :shell do |s|
        begin
            s.path = "import-github-key-from-windows.sh"
            s.args = "'" + File.read(File.join(ENV["HOME"], ".ssh", "github_rsa")) + "'"
        rescue
        end
    end


end
end
``` 