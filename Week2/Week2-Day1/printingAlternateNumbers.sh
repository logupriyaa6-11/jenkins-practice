#!/bin/bash

printAlternateNumbers() {
    array=("$@")
    for ((element = 0; element < ${#array[@]}; element+=2))
    do
        echo "${array[element]} "
    done
    echo
}

printAlternateNumbers "$@"