#!/bin/bash

backup() {
    source=$1
    destination=$2
    cp -r "$source"/* "$destination"
    if [ $? -eq 0 ]; then
        echo "Backup succesful"
    else
        echo "failed"
        return 1
    fi
}

backup "/home" "/backup"