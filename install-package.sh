#!/bin/sh

. /tmp/provisioner-base.sh;
print_debug install-package.sh

install_package_debian () {
    packages="${@}";
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
}

install_package_rhel () {
    yum install -y $@;
}

func=`get_func install_package`;
$func ${@};