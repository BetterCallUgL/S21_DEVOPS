#!/bin/bash
read line

if [[ $line =~ ^[0-9]+$ ]]
then
echo "Error: input is incorrect"
else
echo $line
fi

