#!/bin/sh

packages=""

if [ ! `which vim` ]; then
    packages="$packages vim";
fi;

if [ ! `which screen` ]; then
    packages="$packages screen";
fi;

if [ ! `which easy_install` ]; then
    packages="$packages python-setuptools";
fi;

if [ ! `which virtualenv` ]; then
    packages="$packages python-virtualenv";
fi;

if [ ! `which virtualenv` ]; then
    packages="$packages python-virtualenv";
fi;

if [ ! `which compass` ]; then
    gem update --system &&
    gem install compass;
fi;

if [ ! `which make` ]; then
    packages="$packages build-essential";
fi;

if [ -n "$packages" ]; then
    apt-get update;
    apt-get install -y $packages;
fi;

locale-gen pt_BR.utf8;