#! /bin/bash

read -p "Enter user name: " userName

if id "$userName" ; then
    echo "User exist"
else
    echo "User doesn't exist"
fi 