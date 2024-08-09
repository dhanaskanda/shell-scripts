#!/bin/bash

AMI="ami-0b4f379183e5706b9"
SG_ID="sg-0a9760d01e0335af7"

INSTANCES=("mongodb" "mysql" "redis" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ] || [ if $i == "shipping" ] || [ if $i == "mysql" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type $INSTANCE_TYPE --security-group-ids sg-0a9760d01e0335af7 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"

    echo "instance is: $i"

done