#!/bin/sh

. /tmp/provisioner-base.sh;
print_debug install-r-server.sh

install_r_server_debian () {
    cd /tmp
	wget http://download2.rstudio.org/rstudio-server-0.98.501-amd64.deb
	gdebi -n rstudio-server-0.98.501-amd64.deb
}

install_r_server_rhel () {
    echo "TODO";
}

func=`get_func install_r_server`;
$func;