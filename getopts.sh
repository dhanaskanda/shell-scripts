#!/bin/bash

# Variables for this script !

SOURCE_DIR=""
TIME="14"
ACTION=""
DEST_DIR=""
MEMORY=""

R="\e[31m"
N="\e[0m"

USAGE(){
    echo " USAGE:: $(basename $0) -s <source directory> -d <destination directory> -t <Number of days> -m <memory size of file> -a <action:delete or archive>"
    echo "Options::"
    echo " -a, Specify the action is mandatory"
    echo " -s, Specify the source directory"
    echo " -m, Specify the memory"
    echo " -d, Specify the destination directory whic -a is archive"
    echo " -t, Specify the days(optional) to delete the files.. default is 14 days"
    echo " -h, Display the help and exit"
}

while getopts ":s:a:d:t:m" opt
do
    case $opt in
        s) SOURCE_DIR="$OPTARG";;
        t) TIME="$OPTARG";;
        a) ACTION="$OPTARG";;
        d) DEST_DIR="$OPTARG";;
        m) MEMORY="$OPTARG";;
        \?) echo "Invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        h) USAGE; exit;;
        :) USAGE; exit;;
    esac
done

## Checking ACTION argument provided or not ##

if [ -z $ACTION ]; then
    echo "ERROR: -a option is mandotory either action or delete the content"
    exit 1
fi

## Checking destination directory when action -a is given"

if [ -z "$DEST_DIR" ] && [ "$ACTION" == "archive" ]
then
    echo "-d option is mandatory when -a action is given"
    exit 1
fi

if [ ! -ne $SOURCE_DIR ] # Denotes opposite
then
    echo -e "Source Directory: $SOURCE_DIR $R does not exist $N"
fi

#-------------------------DELETE/ARCHIVE ACTION----------------------#

if [ Action == "delete" ]
then
    FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +"$DAYS" -name *.log)

    while IFS= read -r line
    do
        echo "Deleting file: $line"
        rm -rf $line
    done <<< $FILES_TO_DELETE
else
    FILES_TO_ARCHIVE=$(find $SOURCE_DIR -type f -mtime +"$DAYS" -name "*.log")

    while IFS= read -r line
    do
        echo "Archiving the files: $line"
        zip -r "$DEST_DIR/$(basname "$line")".zip
        rm -rf $line
    done <<< $FILES_TO_ARCHIVE
fi







