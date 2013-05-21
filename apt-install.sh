#!/bin/sh

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

exit 0;
