#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo "Error: Run the shell script using root user"
    exit 1
else
    echo "You are a root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Your mysql installation is FAILED"
else
    echo "Your mysql installation is SUCCESS"
fi