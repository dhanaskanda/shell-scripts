#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "Error: run the script using root user"
    exit 1
else
    echo "You are root user"
fi

echo "All arguments passed: $@"
