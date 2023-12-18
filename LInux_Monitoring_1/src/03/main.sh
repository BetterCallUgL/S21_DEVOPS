#!/bin/bash
. ../lib/func.sh

if [ $# \< 4 ]; then
echo Not enough arguments or Input is incorrect
elif [ $# \> 4 ]; then
echo Too many arguments or Input is incorrect
else

for (( i = 1 ; i <= 4; i++ ))
    do
    for (( j = 1 ; j <= 4; j++ ))
        do  
            if ! [[ ${!j} =~ ^[1-6]$ ]]; then
            echo Input is incorrect
            exit
            fi

            if [ ${!i} == ${!j} ] && [ $i != $j ]; then
            echo Arguments are repeated
            exit
            fi
        done
    done

output $@
fi
