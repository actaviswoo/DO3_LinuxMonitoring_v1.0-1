#!/bin/bash

HOSTNAME=$(hostname)
echo "HOSTNAME = $HOSTNAME"

TIMEZONE=$(timedatectl| grep "Time" | awk '{print $3, $4, $5}' | sed -E 's/^(.*)\((.*), (.*)00\)/\1 \2 \3/' | awk '{ printf ("%s %s %d", $1, $2, $3) }')
echo "TIMEZONE = $TIMEZONE"

USER=$(whoami)
echo "USER = $USER"

OS=$(cat /etc/os-release | awk '/PRETTY_NAME/{print substr($1,14), $2, substr($3,1,3)}')
echo "OS = $OS"

DATE=$(date +"%d %B %Y %T")
echo "DATE = $DATE" 

UPTIME=$(uptime | awk '{print $3}'| sed 's/,//')
echo "UPTIME = $UPTIME" 

UPTIME_SEC=$(cat /proc/uptime | awk '{printf("%.f", $1)}')
echo "UPTIME_SEC = $UPTIME_SEC"

IP=$(hostname -I)
echo "IP = $IP"

MASK=$(ipcalc $(hostname -I) | awk '/Netmask/{print $2}')
echo "MASK = $MASK"

GATEWAY=$(ip route | awk '/default/{print $3}')
echo "GATEWAY = $GATEWAY" 

RAM_TOTAL=$(free --bytes | awk '/Mem/{printf "%.3f", $2 / 1000000000}') 
echo "RAM_TOTAL = $RAM_TOTAL GB"

RAM_USED=$(free --bytes | awk '/Mem/{printf "%.3f", $3 / 1000000000}') 
echo "RAM_USED = $RAM_USED GB"

RAM_FREE=$(free --bytes | awk '/Mem/{printf "%.3f", $4 / 1000000000}')
echo "RAM_FREE = $RAM_FREE GB"

SPACE_ROOT=$(df -k | grep '/$' | awk '{printf "%.2f", $2 / 1000}')
echo "SPACE_ROOT = $SPACE_ROOT MB"
 
SPACE_ROOT_USED=$(df -k | grep '/$' | awk '{printf "%.2f", $3 / 1000}') 
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"

SPACE_ROOT_FREE=$(df -k | grep '/$' | awk '{printf "%.2f", $4 / 1000}') 
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"