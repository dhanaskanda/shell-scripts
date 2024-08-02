#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGSFILE="/tmp/$0-$TIMESTAMP.log" # all logs will be stored here

echo "Script started executing at $TIMESTAMP &>> $LOGSFILE"

CHECK(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2... $R FAILED $G"
    else
        echo -e "$2... $G SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Error: run the script using root user $N"
    exit 1 # if not 0
else
    echo -e "You are $G root $N user"
fi

#echo -e "All arguments $G passed $N: $@" # This is to show what all arguments passed while executing the script

for package in $@
do
    yum list installed $package &>> $LOGSFILE # To check package is installed or not
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> $LOGSFILE # Install the package
        CHECK $? "Installing of $package" # validate
    else
        echo -e "The $package is already installed.. $Y Skipping $N"
    fi
done
