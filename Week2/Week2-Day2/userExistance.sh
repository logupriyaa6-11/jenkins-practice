#! /bin/bash

checkUser() {
    userName="$1"

    if id "$userName" ; then
        echo "User exist"
    else
        echo "User doesn't exist"
    fi 
}

checkUser "$1"