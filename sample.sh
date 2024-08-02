#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGSFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "Script started execution at $Y $TIMESTAMP $N" &>> $LOGSFILE

CHECK(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2.. $R Failed $N"
    else
        echo -e "$2.. $G Success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Error: Run the script from root user $N"
    exit 1 # Exit if not 0
else
    echo -e "You are $G root $N user"
fi

for package in $@
do
    yum list installed $package &>> $LOGSFILE # this will check the package installed or not
    if [ $? -ne 0 ] 
    then
        yum install $package -y &>> $LOGSFILE # this install the package
        CHECK $? "Installing of $package"
    else
        echo -e "$package installed already.. $Y SKIPIING $N"
    fi 
done
