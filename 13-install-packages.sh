#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $ID -ne 0 ]
then
    echo -e "$R Error: run the script using root user $N"
    exit 1
else
    echo "You are root user"
fi

echo -e "All arguments $G passed $N: $@"
