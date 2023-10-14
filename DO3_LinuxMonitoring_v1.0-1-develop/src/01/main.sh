#!/bin/bash

if [[ "$#" -ne 1 ]] 
then
    echo "too many arguments"
else  
    if [[ $1 =~ ^[-+]?[0-9]+([.,][0-9]+)?$ ]]
    then
        echo "incorrect input"
    else
        echo $1
    fi
fi
