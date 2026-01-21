#!/bin/bash
cp -r /home/* /backup

if [ $? -eq 0 ]; then
    echo "Backup succesful"
else
    echo "failed"
fi