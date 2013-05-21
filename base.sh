#!/bin/sh

# ADDING SOME ENV VAR
export_string="export PATH=/vagrant/bin:\$PATH"
grep "$export_string" ~vagrant/.bashrc;
if [ $? != 0 ]; then
    echo ${export_string} >> ~vagrant/.bashrc;
fi;


# PUTTING THIS FUCKING SHIT IN PT_BR
locale-gen pt_BR.utf8;
