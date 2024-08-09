#!/bin/bash

# This script will be creating mongodb" "mysql" "redis" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web" instances along with the ROUTE53 records.......###

AMI_ID="ami-0b4f379183e5706b9"
SG_ID="sg-0a9760d01e0335af7"
DOMAIN_NAME="dhanaskanda.online"
HOSTED_ZONE="Z067782025J385S1OCSZM"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Instance creation has been started $N"

INSTANCES=("mongodb" "mysql" "redis" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ] || [ $i == "shipping" ] || [ $i == "mysql" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    IPADDRESS=$(aws ec2 run-instances --image-id $AMI_ID --instance-type $INSTANCE_TYPE --security-group-ids sg-0a9760d01e0335af7 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)

    echo "instance is: $i: $IPADDRESS"

    # Creates route 53 records based on env name

    aws route53 change-resource-record-sets \
    --hosted-zone-id $HOSTED_ZONE \
    --change-batch '
    {
    
            "Comment": "Testing creating a record set"
            ,"Changes": [{
            "Action"              : "CREATE"
            ,"ResourceRecordSet"  : {
                "Name"              : "'$i'.'$DOMAIN_NAME'"
                ,"Type"             : "A"
                ,"TTL"              : 1
                ,"ResourceRecords"  : [{
                    "Value"         : "'$IPADDRESS'"
                }]
            }
            }]
    }
        '
done