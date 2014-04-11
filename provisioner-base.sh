#!/bin/sh

##
# returns debian|rhel|other
get_distro () {
    uname_=$(uname -a);

    if [ `expr  "$uname_" : '.*Ubuntu.*'` -gt 0 ] ; then
        echo debian;
    elif [ `expr  "$uname_" : '.*Debian.*'` -gt 0 ] ; then
        echo debian;
    elif [ `expr  "$uname_" : '.*el5.*'` -gt 0 ] ; then
        echo rhel;
    else 
        echo other;
    fi;
    return 0;
}

get_func () {
    func_name=$1;
    distro_name=`get_distro`;
    echo ${func_name}_${distro_name};
}

restart_service () {
    service_name=$1;
    ret=0;

    if [ `get_distro` = "debian" ]; then
        echo "TODO"
        service $service_name restart;
        ret=$?;
    else
        echo "TODO: TEST"
        chkconfig $service_name on;
        ret=$?;
    fi;

    return $ret;
}

stop_service () {
    service_name=$1;
    ret=0;

    if [ `get_distro` = "debian" ]; then
        echo "TODO"
        ret=$?;
    else
        echo "TODO: TEST"
        chkconfig $service_name off;
        ret=$?;
    fi;

    return $ret;
}

add_service_boot () {
    service_name=$1;
    ret=0;
    if [ `get_distro` = "debian" ]; then
        update-rc.d $service_name defaults
        ret=$?;
    else
        echo "TODO: TEST"
        chkconfig $service_name --add;
        ret=$?;
    fi;
    return $ret;
}

copy_files () {
    orig_name=$1;
    dest_path=$2;

    mkdir -p $2;
    cp -rf /vagrant/$1 $2;
}

append_to_file () {
    content=$1;
    target=$2;

    grep "$1" $2;
    if [ $? != 0 ]; then
        echo ${1} >> $2;
    fi;
}

print_debug () {
    echo "##############################################"
    echo "[DEBUG:] ${@}"
    echo "##############################################"

}


# TODO: remove hardcoded '/vagrant'
cp -f /vagrant/provisioner-base.sh /tmp/provisioner-base.sh;
