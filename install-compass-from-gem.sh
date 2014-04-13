#!/bin/sh

# COMPASS
if [ ! `which compass` ]; then
    gem update --system &&
    gem install sass --version 3.1.1
    gem install compass --version 0.11.1;
fi;