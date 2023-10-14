#!/bin/bash


if [[ "$#" -ne 4 ]] 
then
    echo "use 4 arguments"
else
    ./check.sh $1 $2 $3 $4
fi
