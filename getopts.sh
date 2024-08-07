#!/bin/bash

# Variables for this script !

SOURCE_DIR=""
TIME="14"
ACTION=""
DEST_DIR=""
MEMORY=""

USAGE(){
    echo " USAGE:: $(basename $0) -s <source directory> -d <destination directory> -t <days> -m <memory> -a <action>"
    echo "Options::"
    echo " -a, Specify the action is mandatory"
    echo " -s, Specify the source directory"
    echo " -m, Specify the memory"
    echo " -d, Specify the destination directory"
    echo " -t, Specify the days(optional) default is 14 days"
    echo " -h, Display the help and exit"
}

while getopts ":-s:a:d:t:m opt"
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

