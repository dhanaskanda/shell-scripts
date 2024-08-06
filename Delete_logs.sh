#!/bin/bash

SOURCE_DIR="/tmp/shellscript_logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] # ! Denotes opposite
then
    echo -e "$R Soruce Directory: $SOURCE_DIR does not exists $N"
fi

FILES-TO-DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting the file $line"
done <<< $FILES-TO-DELETE