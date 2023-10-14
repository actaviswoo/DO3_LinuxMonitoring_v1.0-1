#!/bin/bash

HOSTNAME=$(hostname)
echo -e "$1$2HOSTNAME$5 = $3$4$HOSTNAME$5"

TIMEZONE=$(timedatectl| grep "Time" | awk '{print $3, $4, $5}' | sed -E 's/^(.*)\((.*), (.*)00\)/\1 \2 \3/' | awk '{ printf ("%s %s %d", $1, $2, $3) }')
echo -e "$1$2TIMEZONE$5 = $3$4$TIMEZONE$5"

USER=$(whoami)
echo -e "$1$2USER$5 = $3$4$USER$5"

OS=$(cat /etc/os-release | awk '/PRETTY_NAME/{print substr($1,14), $2, substr($3,1,3)}')
echo -e "$1$2OS$5 = $3$4$OS$5"

DATE=$(date +"%d %B %Y %T")
echo -e "$1$2DATE$5 = $3$4$DATE$5"

UPTIME=$(uptime | awk '{print $3}'| sed 's/,//')
echo -e "$1$2UPTIME$5 = $3$4$UPTIME$5"

UPTIME_SEC=$(cat /proc/uptime | awk '{printf("%.f", $1)}')
echo -e "$1$2UPTIME_SEC$5 = $3$4$UPTIME_SEC$5"

IP=$(hostname -I)
echo -e "$1$2IP$5 = $3$4$IP$5"

MASK=$(ipcalc $(hostname -I) | awk '/Netmask/{print $2}')
echo -e "$1$2MASK$5 = $3$4$MASK$5"
GATEWAY=$(ip route | awk '/default/{print $3}')
echo -e "$1$2GATEWAY$5 = $3$4$GATEWAY$5"

RAM_TOTAL=$(free --bytes | awk '/Mem/{printf "%.3f", $2 / 1000000000}') 
echo -e "$1$2RAM_TOTAL$5 = $3$4$RAM_TOTAL GB$5"

RAM_USED=$(free --bytes | awk '/Mem/{printf "%.3f", $3 / 1000000000}') 
echo -e "$1$2RAM_USED$5 = $3$4$RAM_USED GB$5"

RAM_FREE=$(free --bytes | awk '/Mem/{printf "%.3f", $4 / 1000000000}')
echo -e "$1$2RAM_FREE$5 = $3$4$RAM_FREE GB$5"

SPACE_ROOT=$(df -k | grep '/$' | awk '{printf "%.2f", $2 / 1000}')
echo -e "$1$2SPACE_ROOT$5 = $3$4$SPACE_ROOT MB$5"
 
SPACE_ROOT_USED=$(df -k | grep '/$' | awk '{printf "%.2f", $3 / 1000}') 
echo -e "$1$2SPACE_ROOT_USED$5 = $3$4$SPACE_ROOT_USED MB$5"

SPACE_ROOT_FREE=$(df -k | grep '/$' | awk '{printf "%.2f", $4 / 1000}') 
echo -e "$1$2SPACE_ROOT_FREE$5 = $3$4$SPACE_ROOT_FREE MB$5"
