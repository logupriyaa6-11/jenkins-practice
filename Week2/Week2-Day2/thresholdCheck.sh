#! /bin/bash

maxThreshold=80

usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt "$maxThreshold" ]; then
    echo "Warning! disk usage exceeding. current usage: $usage"
else
    echo "Disk usage is within the threshold. current usage: $usage"
fi