#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGSFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "Script started execution at $Y $TIMESTAMP $N"

if [ $ID -ne 0 ]
then
    echo -e "$R Error: Run the script from root user $N"
    exit 1 # Exit if not 0
else
    echo -e "You are $G root $N user"
fi