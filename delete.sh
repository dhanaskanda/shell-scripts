#!/bin/bash

S_DIR="/tmp/shell_logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $S_DIR ]
then
    echo -e "$R source directory $S_DIR does not exists $N"
fi

FILES_TO_DEL=$(find $S_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting the file: $line"
done <<< $FILES_TO_DEL