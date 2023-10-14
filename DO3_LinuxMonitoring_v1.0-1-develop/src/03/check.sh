#!/bin/bash

pattern='^[1-6]$'

if [[ $1 =~ $pattern ]] && [[ $2 =~ $pattern ]] && [[ $3 =~ $pattern ]] && [[ $4 =~ $pattern ]]
then
    if [[ $1 -eq $2 ]] || [[ $3 -eq $4 ]]
    then 
        echo "first-second and third-fourth should not be the same. try again"
    else
        ./color.sh $2 $1 $4 $3
    fi
else
    echo "expects arguments 1 to 6"
fi