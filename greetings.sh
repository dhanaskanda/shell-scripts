#!/bin/bash

#----------Variables----------#

NAME=""
WISHES=""

#---------Function------------#
USAGE(){
    echo "echo USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "options::"
    echo " -n, Specify the name (mandatory)"
    echo " -w, Specify the wishes, ex Hi Hello Good morning, Good Evening"
    echo " -h, dispaly help and exit"
}

#------------Loop for getopst-----------#

while getopts= "n:w:h" opt;
do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTORG";;
        \?) echo "Invalid options: -"$OPTARG"" >&2; exit;;
        h) USAGE; exit;;
        :) USAGE; exit;;
    esac
done
