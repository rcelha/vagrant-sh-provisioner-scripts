#!/bin/sh

KEY="${1}";
KEY_NAME=github_rsa;
KEY_PATH=/home/vagrant/.ssh;
KEY_FILE=${KEY_PATH}/${KEY_NAME};
KEY_HOST=github.com
KEY_USER=git

if [ ! -f ${KEY_FILE} ]; then

    echo "${KEY}" > ${KEY_FILE};

    chown vagrant ${KEY_FILE};
    chmod 600 ${KEY_FILE};

    su -c "touch /home/vagrant/.ssh/config" - vagrant;
    echo "# ${KEY_HOST} CONFIG
Host ${KEY_HOST}
StrictHostKeyChecking no
IdentityFile ${KEY_FILE}" >> /home/vagrant/.ssh/config;

    # adding key to know host!
    su -c "ssh -oStrictHostKeyChecking=no ${KEY_USER}@${KEY_HOST}" - vagrant;
fi;

exit 0;