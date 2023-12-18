#!/bin/bash

function output {
a=()
if [ $# \> 0 ]; then
    for (( i = 0 ; i < 4; i++ )) do
        arg=$((i+1))
        if ((i % 2 == 0)); then 
            case ${!arg} in
            1 ) a[$i]="\033[47m";;
            2 ) a[$i]="\033[41m";;
            3 ) a[$i]="\033[42m";;
            4 ) a[$i]="\033[44m";;
            5 ) a[$i]="\033[45m";;
            6 ) a[$i]="\033[40m";;
            * ) a[$i]="\033[103m";;
            esac
        else
            case ${!arg} in
            1 ) a[$i]="\033[37m";;
            2 ) a[$i]="\033[31m";;
            3 ) a[$i]="\033[32m";;
            4 ) a[$i]="\033[34m";;
            5 ) a[$i]="\033[35m";;
            6 ) a[$i]="\033[30m";;
            * ) a[$i]="\033[93m";;
            esac
        fi 
    done
fi

OS=$(hostnamectl | grep "Operating System")
HOSTNAME=$(hostname)
TIMEZONE="$(cat /etc/timezone) UTC $(date +'%z')"
USER=$(whoami)
OS=${OS#*System: }
DATE=$(date +'%d %B %Y %H:%M:%S')
UPTIME=$(awk '{print int($1/3600)":"int(($1%3600)/60)":"int($1%60)}' /proc/uptime)
UPTIME_SEC=$(uptime | awk '{ print $1 }')
IP=$(ip a |  grep 'inet' | awk 'NR == 1 { print $2 }')
MASK=$(ifconfig | grep 'inet' | awk 'NR == 1{ print $4 }')
GATEWAY=$(ip r | grep 'default' | awk '{ print $3}')
RAM_USED=$(free -m | awk 'NR == 2 { printf"%.3f",$3/1024 }')
RAM_TOTAL=$(free -m | awk 'NR == 2 { printf"%.3f",$2/1024}')
RAM_FREE=$(free -m | awk 'NR == 2 { printf"%.3f",$4/1024}')
SPACE_ROOT=$(df -k | grep '/dev' | awk 'NR == 1 { printf"%.2f",$2/1024}')
SPACE_ROOT_USED=$(df -k | grep '/dev' | awk 'NR == 1 { printf"%.2f",$3/1024}')
SPACE_ROOT_FREE=$(df -k | grep '/dev' | awk 'NR == 1 { printf"%.2f",$4/1024}')
filename="$(date +'%d_%m_%Y_%H_%M_%S').txt"

if [ $# \> 0 ]; then
echo -e "${a[0]}${a[1]}HOSTNAME\033[0m = ${a[2]}${a[3]}$HOSTNAME\033[0m" 
echo -e "${a[0]}${a[1]}TIMEZONE\033[0m = ${a[2]}${a[3]}$TIMEZONE\033[0m"
echo -e "${a[0]}${a[1]}USER\033[0m = ${a[2]}${a[3]}$USER\033[0m"
echo -e "${a[0]}${a[1]}OS\033[0m = ${a[2]}${a[3]}$OS\033[0m"
echo -e "${a[0]}${a[1]}DATE\033[0m = ${a[2]}${a[3]}$DATE\033[0m"
echo -e "${a[0]}${a[1]}UPTIME\033[0m = ${a[2]}${a[3]}$UPTIME\033[0m"
echo -e "${a[0]}${a[1]}UPTIME_SEC\033[0m = ${a[2]}${a[3]}$UPTIME_SEC\033[0m"
echo -e "${a[0]}${a[1]}IP\033[0m = ${a[2]}${a[3]}$IP\033[0m"
echo -e "${a[0]}${a[1]}MASK\033[0m = ${a[2]}${a[3]}$MASK\033[0m"
echo -e "${a[0]}${a[1]}GATEWAY\033[0m = ${a[2]}${a[3]}$GATEWAY\033[0m"
echo -e "${a[0]}${a[1]}RAM_TOTAL\033[0m = ${a[2]}${a[3]}$RAM_TOTAL\033[0m"
echo -e "${a[0]}${a[1]}RAM_USED\033[0m = ${a[2]}${a[3]}$RAM_USED\033[0m"
echo -e "${a[0]}${a[1]}RAM_FREE\033[0m = ${a[2]}${a[3]}$RAM_FREE\033[0m"
echo -e "${a[0]}${a[1]}SPACE_ROOT\033[0m = ${a[2]}${a[3]}$SPACE_ROOT\033[0m"
echo -e "${a[0]}${a[1]}SPACE_ROOT_USED\033[0m = ${a[2]}${a[3]}$SPACE_ROOT_USED\033[0m" 
echo -e "${a[0]}${a[1]}SPACE_ROOT_FREE\033[0m = ${a[2]}${a[3]}$SPACE_ROOT_FREE\033[0m"
else
echo -e "${a[0]}${a[1]}HOSTNAME = ${a[2]}${a[3]}$HOSTNAME" 
echo -e "${a[0]}${a[1]}TIMEZONE = ${a[2]}${a[3]}$TIMEZONE"
echo -e "${a[0]}${a[1]}USER = ${a[2]}${a[3]}$USER"
echo -e "${a[0]}${a[1]}OS = ${a[2]}${a[3]}$OS"
echo -e "${a[0]}${a[1]}DATE = ${a[2]}${a[3]}$DATE"
echo -e "${a[0]}${a[1]}UPTIME = ${a[2]}${a[3]}$UPTIME"
echo -e "${a[0]}${a[1]}UPTIME_SEC = ${a[2]}${a[3]}$UPTIME_SEC"
echo -e "${a[0]}${a[1]}IP = ${a[2]}${a[3]}$IP"
echo -e "${a[0]}${a[1]}MASK = ${a[2]}${a[3]}$MASK"
echo -e "${a[0]}${a[1]}GATEWAY = ${a[2]}${a[3]}$GATEWAY"
echo -e "${a[0]}${a[1]}RAM_TOTAL = ${a[2]}${a[3]}$RAM_TOTAL"
echo -e "${a[0]}${a[1]}RAM_USED = ${a[2]}${a[3]}$RAM_USED"
echo -e "${a[0]}${a[1]}RAM_FREE = ${a[2]}${a[3]}$RAM_FREE"
echo -e "${a[0]}${a[1]}SPACE_ROOT = ${a[2]}${a[3]}$SPACE_ROOT"
echo -e "${a[0]}${a[1]}SPACE_ROOT_USED = ${a[2]}${a[3]}$SPACE_ROOT_USED" 
echo -e "${a[0]}${a[1]}SPACE_ROOT_FREE = ${a[2]}${a[3]}$SPACE_ROOT_FREE"
fi
}
