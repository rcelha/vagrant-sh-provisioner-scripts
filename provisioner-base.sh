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

    service $service_name restart;  
    ret=$?;

    return $ret;
}

stop_service () {
    service_name=$1;
    ret=0;

    if [ `get_distro` = "debian" ]; then
        echo "TODO"
        ret=$?;
    else
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
        chkconfig $service_name --add;
        ret=$?;
    fi;
    return $ret;
}

copy_files () {
    orig_name=$1;
    dest_path=$2;
    dos_2_unix=$3;

    mkdir -p $2;
    new_files=$(cp  -rfv /vagrant/$1 $2 | cut -d \> -f 2 | cut -d \` -f 2 | cut -d \' -f 1);

    if [[ $3 ]]; then
        for i in $new_files; do
            dos2unix $i;
        done;
    fi;
}

append_to_file () {
    content=$1;
    target=$2;

    grep "$1" $2;
    echo grep "$1" $2;

    if [ $? != 0 ]; then
        echo "${1}" >> $2;
    fi;
}

print_debug () {
    echo "##############################################"
    echo "[DEBUG:] ${@}"
    echo "##############################################"

}
