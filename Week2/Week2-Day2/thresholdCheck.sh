#!/bin/bash

thresholdCheck() {
    maxThreshold=$1
    email=$2

    usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

    if [ "$usage" -gt "$maxThreshold" ]; then
        echo "Warning! disk usage exceeding. current usage: $usage %" | mail -s "Disk usage alert" "$email"
    else
        echo "Disk usage is within the threshold. current usage: $usage %" 
    fi
}

thresholdCheck 80 "priyaarul1107@gmail.com"