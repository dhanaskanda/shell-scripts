#!/bin/bash

ID=$(id -u)

CHECK(){
    if [ $? -ne 0 ]
then
    echo " Error :: Installation is FAILED"
    exit1
else
    echo " Installation is SUCCESS"
fi
}
if [ $ID -ne 0 ]
then
    echo "Error: run the script using root user"
    exit1
else
    echo "You are root user"
fi

yum install mysql -y

CHECK