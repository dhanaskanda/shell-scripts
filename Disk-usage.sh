#!/bin/bash

DISKUSAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High Disk usage on $partition: $usage\n"
    fi
done <<< $DISKUSAGE

echo -e "message: $message"

echo "$message" | mail -s "High Disk usage" sutrayeanilkumarrao@gmail.com