#!/bin/bash

#---------------VARIABLE----------------**
SOURCE_DIR=""
DESTINATION_DIR=""
DAYS=14
MEMORY=""
ACTION=""

#---------------- USAGE FUNCTOIN USED TO DISPLAY ------------------------------------------------**
USAGE(){
    echo "COMMAND USAGE:: $(basename $0) -s <Source Directory> -d <Destination Directory> -a <action: delete or archive> -t <No.of Days> -m<Memory size of file>"
    echo "Options: "
    echo " -s: Specify the source directory"
    echo " -d: Specify the destination directory when -a is archive"
    echo " -t: Number of days back to delete log file"
    echo " -m: Memory size of the file to delete log file"
    echo " -a: Action to be performed on log files. Options : Delete or Archive"
    echo " -h: Display Help and exit" 
}

#----------------------OPT ARGS---------------------------------------**
while getopts ":s:d:t:m:a:h" opt;
do
    case $opt in
        s) SOURCE_DIR="$OPTARG";;
        d) DESTINATION_DIR="$OPTARG";;
        t) DAYS="$OPTARG";;
        m) MEMORY="$OPTARG";;
        a) ACTION="$OPTARG";;
        h) USAGE; exit;;
        \?) echo "Invalid Options: -"$OPTARG"" >$2; USAGE; exit;;
    esac
done

#------------------CHECKING ACTION ARGUMENT PROVIDED OR NOT---------------**

if [ -z "$ACTION" ] 
then
    echo "ERROR:: -a option is mandatory. Either Delete or Archive"
    exit 1
fi

#---------------------CHECKING DESTINATION DIR PROVIDED IF ARCHIVE OPTION CHOOSEN---------------**

if [ -z "$DESTINATION_DIR" ] && [ $ACTION == "archive" ]
then
    echo "ERROR:: -d option is mandatory when -a is archive"
    exit 1
fi

if [ ! -d $SOURCE_DIR ] # ! denotes opposite
then
    echo "Source directory: $SOURCE_DIR does not exists."
fi

#-------------------------DELETE/ARCHIVE ACTION----------------------**

if [ $ACTION=="delete" ]
then
FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +"$DAYS" -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE
else
FILES_TO_ARCHIVE=$(find $SOURCE_DIR -type f -mtime +"$DAYS" -name "*.log")

while IFS= read -r line
do
    echo "Archiving file: $line"
    zip -r "$DESTINATION_DIR/$(basename "$line").zip"
    rm -rf $line
done <<< $FILES_TO_ARCHIVE
fi