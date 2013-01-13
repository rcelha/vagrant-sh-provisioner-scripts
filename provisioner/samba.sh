#!/bin/sh

if [ ! `which smbd` ]; then

    apt-get update;
    apt-get install -y samba;
    smbpasswd -a vagrant -n;
fi;