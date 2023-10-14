#!/bin/bash

if [[ $1 == 1 ]]; then
  color0="\033[37m"
  config0="white"
elif [[ $1 == 2 ]]; then
  color0="\033[31m"
  config0="red"
elif [[ $1 == 3 ]]; then
  color0="\033[32m"
  config0="green"
elif [[ $1 == 4 ]]; then
  color0="\033[34m"
  config0="blue"
elif [[ $1 == 5 ]]; then
  color0="\033[35m"
  config0="purple"
elif [[ $1 == 6 ]]; then
  color0="\033[30m"
  config0="black"
fi

if [[ $2 == 1 ]]; then
  color1="\033[47m"
  config1="white"
elif [[ $2 == 2 ]]; then
  color1="\033[41m"
  config1="red"
elif [[ $2 == 3 ]]; then
  color1="\033[42m"
  config1="green"
elif [[ $2 == 4 ]]; then
  color1="\033[44m"
  config1="blue"
elif [[ $2 == 5 ]]; then
  color1="\033[45m"
  config1="purple"
elif [[ $2 == 6 ]]; then
  color1="\033[40m"
  config1="black"
fi

if [[ $3 == 1 ]]; then
  color2="\033[37m"
  config2="white"
elif [[ $3 == 2 ]]; then
  color2="\033[31m"
  config2="red"
elif [[ $3 == 3 ]]; then
  color2="\033[32m"
  config2="green"
elif [[ $3 == 4 ]]; then
  color2="\033[34m"
  config2="blue"
elif [[ $3 == 5 ]]; then
  color2="\033[35m"
  config2="purple"
elif [[ $3 == 6 ]]; then
  color2="\033[30m"
  config2="black"
fi

if [[ $4 == 1 ]]; then
  color3="\033[47m"
  config3="white"
elif [[ $4 == 2 ]]; then
  color3="\033[41m"
  config3="red"
elif [[ $4 == 3 ]]; then
  color3="\033[42m"
  config3="green"
elif [[ $4 == 4 ]]; then
  color3="\033[44m"
  config3="blue"
elif [[ $4 == 5 ]]; then
  color3="\033[45m"
  config3="purple"
elif [[ $4 == 6 ]]; then
  color3="\033[40m"
  config3="black"
fi

./collect.sh $color0 $color1 $color2 $color3 "\033[0m"

if [[ $5 -eq 1 ]]
then
    echo "Column 1 background = default (white)"
    echo "Column 1 font color = default (black)"
    echo "Column 2 background = default (black)"
    echo "Column 2 font color = default (white)"
else
    echo "Column 1 background = $2 ($config1) "
    echo "Column 1 font color = $1 ($config0) "
    echo "Column 2 background = $4 ($config3) "
    echo "Column 2 font color = $3 ($config2) "
fi