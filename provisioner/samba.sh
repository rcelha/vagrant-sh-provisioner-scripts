#!/bin/sh

if [ ! `which smbd` ]; then

    apt-get update;
    apt-get install -y samba;
echo "vagrant
vagrant
" | smbpasswd -s vagrant;

    cp /vagrant/provisioner/smb.conf /etc/samba/;
    service smbd restart;
fi;