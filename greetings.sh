#!/bin/bash

#----------Variables----------#

NAME=""
WISHES="Good Morning"

#---------Function------------#
USAGE(){
    echo " USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n, Specify the name (mandatory)"
    echo " -w, Specify the wishes (Optional). Default is good morning"
    echo " -h, dispaly help and exit"
}

#------------Loop for getopst-----------#

while getopts ":n:w:h" opt; do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "Invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        h) USAGE; exit;;
        :) USAGE; exit;;
    esac
done

#if [ -z "$NAME" ] || [ -z "$WISHES" ]; then
if [ -z "$NAME" ]; then # Now wishes are optional
    #echo "Error: Both -n and -w are mandatory options."
    echo "Error: -n is mandatory option."
    USAGE
    exit 1
fi

echo "Hi $NAME. $WISHES.. I have been learning shell script"