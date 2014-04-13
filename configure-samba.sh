#!/bin/sh

. /tmp/provisioner-base.sh;
print_debug configure-samba.sh

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

smbpasswd -a -n vagrant;
echo "vagrant
vagrant
" | smbpasswd -s vagrant;
echo "${CONF}" > /etc/samba/smb.conf;

# redhat || debian
add_service_boot smb || add_service_boot smbd;
restart_service smb || restart_service smbd;

exit 0;