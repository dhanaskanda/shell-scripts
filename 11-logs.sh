#!/bin/bash

#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGSFILE=/tmp/$0-$TIMESTAMP.log

CHECK(){
    if [ $1 -ne 0 ]
then
    echo " $2 ....FAILED"
    exit 1
else
    echo " $2 SUCCESS"
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