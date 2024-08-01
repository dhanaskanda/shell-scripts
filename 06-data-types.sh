#!/bin/bash

DATE=$(date)
NUMBER1=$1
NUMBER2=$2

SUM=$((NUMBER1+NUMBER2))

echo "Total is:: ${SUM}, up to ${DATE}"

echo "How many arguments passed: $#"
echo "All arguments lister here: $@"
echo "Script name is: $0"