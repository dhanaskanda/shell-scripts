#!/bin/bash

#----------Variables----------#

NAME=""
WISHES=""

#---------Function------------#
USAGE(){
    echo " USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo " -n, Specify the name (mandatory)"
    echo " -w, Specify the wishes, ex Hi Hello Good morning, Good Evening"
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
