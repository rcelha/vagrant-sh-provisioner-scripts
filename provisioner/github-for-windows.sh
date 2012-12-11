#!/bin/sh

if [ ! -f /home/vagrant/.ssh/github_rsa ]; then

    cp  /tmp/github-win/.ssh/github_rsa* /home/vagrant/.ssh/;
    cp /tmp/github-win/.gitconfig  /home/vagrant/;

    chown vagrant /home/vagrant/.ssh/github_rsa*;
    chown vagrant /home/vagrant/.gitconfig;

    chmod 600 /home/vagrant/.ssh/github_rsa;
    chmod 644 /home/vagrant/.ssh/github_rsa.pub;

    su -c "touch /home/vagrant/.ssh/config" - vagrant
    echo "# GITHUB CONFIG
Host github.com
StrictHostKeyChecking no
IdentityFile /home/vagrant/.ssh/github_rsa" >> /home/vagrant/.ssh/config

    # adding key to know host!
    # su -c "ssh -oStrictHostKeyChecking=no git@github.com" - vagrant
fi;

if [ ! `which git` ]; then
    apt-get update;
    apt-get install -y git;
fi;