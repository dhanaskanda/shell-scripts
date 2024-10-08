#!/bin/bash

# This script is to find disk usage more than threshold and sens an notification mail to the respective teams.

DISKUSAGE=$(df -hT | grep -vE 'tmp|File')
Threshold=1

message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -gt $Threshold ]
    then
        message+="High disk usage on $partition: $usage\n"
    fi
done <<< $DISKUSAGE

echo -e "message: $message"

#echo "$message" | mail -s "High disk usage" sutrayeanilkumarrao@gmail.com

sh mail.sh "DevsOps Team" "High disk usage" "$message" "sutrayeanilkumarrao@gmail.com" "HIGH DISK USAGE ALERT"