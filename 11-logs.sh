#!/bin/bash

#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGSFILE=/tmp/$0-$TIMESTAMP.log

CHECK(){
    if [ $1 -ne 0 ]
then
    echo -e "$2 .... \e[31m FAILED \e[0m"
    exit 1
else
    echo -e "$2 \e[32m SUCCESS \e[0m"
fi
}
if [ $ID -ne 0 ]
then
    echo "Error: run the script using root user"
    exit 1
else
    echo "You are root user"
fi

yum install mysql -y &>> $LOGSFILE

CHECK $? "Installing MYSQL"

yum install git -y &>> $LOGSFILE
CHECK $? "Insalling GIT"