#!/bin/sh

if [ ! `which jenkins-cli` ]; then

    echo "Staring Jenkins installation script";

    apt-get update;
    apt-get install -y jenkins;

    echo "Done.";

fi;