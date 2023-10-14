#!/bin/bash

pattern='^[1-6]$'
color0=$1
color1=$2
color2=$3
color3=$4
default=0

if [[ -z $1 ]] || [[ -z $2 ]] || [[ -z $3 ]] || [[ -z $4 ]]
then
    color0='6'
    color1='1'
    color2='1'
    color3='6'
    default=1
fi

if [[ $color0 =~ $pattern ]] && [[ $color1 =~ $pattern ]] && [[ $color2 =~ $pattern ]] && [[ $color3 =~ $pattern ]]
then
    if [[ $color0 -eq $color1 ]] || [[ $color2 -eq $color3 ]]
    then 
        echo "first-second and third-fourth should not be the same. try again"
    else
        ./color.sh $color1 $color0 $color3 $color2 $default
    fi
else
    echo "expects arguments 1 to 6"
fi