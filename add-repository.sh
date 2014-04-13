#!/bin/sh

. /tmp/provisioner-base.sh;
print_debug add-repository.sh

add_repository_debian () {
    repos=$@

    if [ ! `which add-apt-repository` ]; then
        echo "ERROR: no add-apt-repository command found";
        return 1;
    fi;

    for r in $repos; do
        add-apt-repository ppa:$repos;
    done;
}

add_repository_rhel () {
    echo "TODO";
}

func=`get_func add_repository`;
$func ${@};
