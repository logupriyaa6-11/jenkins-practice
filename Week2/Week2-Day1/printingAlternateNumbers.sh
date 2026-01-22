#!/bin/bash

echo "Enter elements"
read -a array

for ((element = 0; element < ${#array[@]}; element+=2))
do
    echo -n "${array[element]} "
done