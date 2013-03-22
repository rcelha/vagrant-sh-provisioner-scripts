#!/bin/sh

packages="vim screen python-setuptools python-virtualenv build-essential npm curl git python-dev libevent-dev unzip rabbitmq-server";
new_packages="";

for p in $packages; do
    aptitude show $p | grep State | cut -d: -f2 | grep not;
    if [ ${?} -eq 0 ]; then
        new_packages="$new_packages $p"
    fi;

done;

if [ -n "$new_packages" ]; then
    apt-get update;
    apt-get install -y $new_packages;
fi;

# COMPASS
if [ ! `which compass` ]; then
    gem update --system &&
    gem install sass --version 3.1.1
    gem install compass --version 0.11.1;
fi;

# ADDING SOME ENV VAR
export_string="export PATH=/vagrant:/vagrant/provisioner:/vagrant/provisioner/send-git-keys-script:\$PATH"
grep "$export_string" ~vagrant/.bashrc;
if [ $? != 0 ]; then
    echo ${export_string} >> ~vagrant/.bashrc;
fi;


# PUTTING THIS FUCKING SHIT IN PT_BR
locale-gen pt_BR.utf8;