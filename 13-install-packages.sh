#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK(){
    if [ $1 -ne 0 ]
    then
        echo "$2... FAILED"
    else
        echo "$2... SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Error: run the script using root user $N"
    exit 1
else
    echo "You are root user"
fi

#echo -e "All arguments $G passed $N: $@" # This is to show what all arguments passed while executing the script

for package in $@
do
    yum list installed $package # To check package is installed or not
    if [ $? -ne 0 ]
    then 
        yum install $package -y # Install the package
        CHECK $? "Installing of $package" # validate
    else
        echo "The $package is already installed.. Skipping"
    fi
done
