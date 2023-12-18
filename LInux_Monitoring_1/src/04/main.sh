#!/bin/bash
. ../lib/func.sh

declare -A map
map['1']="white"
map['2']="red"
map['3']="green"
map['4']="blue"
map['5']="purple"
map['6']="black"
map['default']="orange"

filename="config"
if ! [ -e $filename ]; then
echo there is no config file
exit
fi

args=0
declare -A arr
arr=()
while IFS= read -r line || [ -n "$line" ];
do  
    if [[ $line =~ ^column1_background=[1-6]?$ ]]; then
        arr[0]=${line: -1}
    elif [[ $line =~ ^column1_font_color=[1-6]?$ ]]; then
        arr[1]=${line: -1}
    elif [[ $line =~ ^column2_background=[1-6]?$ ]]; then
        arr[2]=${line: -1}
    elif [[ $line =~ ^column2_font_color=[1-6]?$ ]]; then
        arr[3]=${line: -1}
    else
        echo Invalid input
        exit 
    fi
done < $filename

output ${arr[0]} ${arr[1]} ${arr[2]} ${arr[3]}
echo 

for (( i = 0; i < 4; i++ ))
do
    if ! [[ ${arr[$i]} =~ ^[1-6]$ ]]; then
        arr[$i]="default"
    fi
done

echo Column 1 background = ${arr[0]} \(${map[${arr[0]}]}\)
echo Column 1 font color = ${arr[1]} \(${map[${arr[1]}]}\)
echo Column 2 background = ${arr[2]} \(${map[${arr[2]}]}\)
echo Column 2 font color = ${arr[3]} \(${map[${arr[3]}]}\)
