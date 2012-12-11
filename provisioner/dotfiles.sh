#!/bin/sh

if [ ! -d /home/vagrant/repos/dotfiles ]; then

    su -c "mkdir /home/vagrant/repos;
cd /home/vagrant/repos &&
git clone git@github.com:rcelha/dotfiles.git &&
cd dotfiles &&
./install.py;" vagrant;

fi;