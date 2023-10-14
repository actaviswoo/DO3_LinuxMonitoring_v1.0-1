#!/bin/bash

if [[ "$#" -ne 0 ]] 
then
    echo "too many arguments"
    exit 1
else  
    ./collect.sh
fi

read -p "want to save? Y/N " answer

if [[ $answer == "Y" || $answer == "y" ]]
then
    ./save.sh
fi
