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
    $CURL https://api.github.com/user/keys -d "{\"title\":\"vagrant\", \"key\": \"${KEY_VALUE}\"}";
    return $?;


}


gen_key_main github.com;
