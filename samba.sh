#!/bin/sh

CONF="
[global]

    workgroup = MYGROUP
    server string = Samba Server Version %v

    security = user
    passdb backend = tdbsam


[homes]
    comment = Home Directories
    browseable = no
    writable = yes
    valid users = %S
    valid users = MYDOMAIN\%S
    valid users = %G\%S
";

if [ ! `which smbd` ]; then

    apt-get update;
    apt-get install -y samba;
echo "vagrant
vagrant
" | smbpasswd -s vagrant;

    echo "${CONF}" > /etc/samba/smb.conf;
    service smbd restart;
fi;

exit 0;