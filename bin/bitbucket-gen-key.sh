#!/bin/bash

. common-gen-key.sh

_send_key(){
    local ID_FILE_PUB=$1;
    local USERNAME=$2;
    local PASSWORD=$3;

    local CURL;
    local KEY_VALUE;
    
    KEY_VALUE=`cat ${ID_FILE_PUB}`;
    CURL="curl -k -X POST -sL -w \nRETCODE:%{http_code} ";
    CURL="${CURL} --user ${USERNAME}:${PASSWORD}";
     
    $CURL https://api.bitbucket.org/1.0/users/${USERNAME}/ssh-keys/ -F "key=${KEY_VALUE}" -F "label=vagrant";
    return $?;
}

gen_key_main bitbucket.org;
